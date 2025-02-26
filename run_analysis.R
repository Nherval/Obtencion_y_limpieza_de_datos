# 1. Descargar y descomprimir los datos
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_file <- "UCI_HAR_Dataset.zip"

if (!file.exists(zip_file)) {
  download.file(url, zip_file, method = "curl")
}
unzip(zip_file)

# 2. Cargar los datos
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Cargar conjunto de entrenamiento
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Cargar conjunto de prueba
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# 3. Fusionar los conjuntos de datos
train_data <- cbind(subject_train, y_train, x_train)
test_data <- cbind(subject_test, y_test, x_test)
merged_data <- rbind(train_data, test_data)

# 4. Extraer mediciones de media y desviación estándar
selected_features <- grep("mean\\(\\)|std\\(\\)", features$feature, value = TRUE)
tidy_data <- merged_data %>% select(subject, activity, all_of(selected_features))
# 5. Asignar nombres descriptivos
tidy_data$activity <- factor(tidy_data$activity, levels = activity_labels$code, labels = activity_labels$activity)

# 6. Crear segundo conjunto de datos con promedios por actividad y sujeto
library(dplyr)
final_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

# Guardar el resultado
write.table(final_data, "tidy_data.txt", row.name = FALSE)


