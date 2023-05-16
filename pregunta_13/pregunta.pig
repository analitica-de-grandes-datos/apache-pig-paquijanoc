/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
-- Paso 1: Leer archivo
data = LOAD 'data.csv' USING PigStorage(',') AS (col1: chararray, col2: chararray, col3: chararray);

-- Paso 2: Filtrar los registros donde el color comienza con 'b'
filtered_data = FILTER data BY col3 MATCHES 'b.*';

-- Paso 3: Proyectar solo la columna de color
color_result = FOREACH filtered_data GENERATE col3 AS color;

-- Paso 4: Escribir resultado en carpeta "output"
STORE color_result INTO 'output' USING PigStorage(',');

-- Mostrar resultado
DUMP color_result;
