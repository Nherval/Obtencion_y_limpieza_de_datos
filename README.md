# Obtencion_y_limpieza_de_datos

# 1. Descripción del Proyecto

Este proyecto tiene como objetivo limpiar y procesar el conjunto de datos Human Activity Recognition Using Smartphones (UCI HAR Dataset). Se sigue una metodología para:

✔ Fusionar los datos de entrenamiento y prueba.

✔ Extraer solo las variables de media y desviación estándar.

✔ Etiquetar adecuadamente las actividades con nombres descriptivos.

✔ Crear un conjunto de datos ordenado con la media de cada variable para cada sujeto y actividad.

# 2. Estructura del Repositorio

El repositorio contiene los siguientes archivos:


README.md	-> Explicación del proyecto y cómo ejecutarlo.

✔ run_analysis.R ->	Script en R que procesa los datos paso a paso.

✔ CodeBook.md -> Documentación de variables y transformaciones.

✔ tidy_data.txt ->	Conjunto de datos ordenado final.

# 3. Descripción del Proceso

El script run_analysis.R sigue estos pasos:

1️ Descargar y descomprimir los datos.

2️ Cargar y fusionar los conjuntos de entrenamiento y prueba.

3️ Seleccionar solo las mediciones de media y desviación estándar.

4️ Reemplazar códigos de actividad por nombres descriptivos.

5️ Crear un conjunto de datos ordenado con promedios por actividad y sujeto.

