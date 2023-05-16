/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
-- Paso 1: Leer archivo
data = LOAD 'data.csv' USING PigStorage(',') AS (col1: int, firstname: chararray, lastname: chararray, birthdate: chararray, color: chararray, col6: int);

-- Paso 2: Filtrar los registros que cumplen con las condiciones WHERE
filtered_data = FILTER data BY color == 'blue' AND firstname MATCHES '^Z.*';

-- Paso 3: Proyectar las columnas firstname y color
result = FOREACH filtered_data GENERATE firstname, color;

-- Paso 4: Escribir resultado en carpeta "output"
STORE result INTO 'output' USING PigStorage(',');

-- Mostrar resultado
DUMP result;
