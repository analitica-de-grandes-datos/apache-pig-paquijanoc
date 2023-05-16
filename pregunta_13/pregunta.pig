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
data = LOAD 'data.csv' USING PigStorage(',') AS (col1: int, col2: chararray, col3: chararray, col4: chararray, col5: chararray, col6: int);

-- Paso 2: Filtrar los registros que cumplen con la condición WHERE
filtered_data = FILTER data BY col5 MATCHES '^b.*';

-- Paso 3: Proyectar solo la columna de color
result = FOREACH filtered_data GENERATE col5;

-- Paso 4: Escribir resultado en carpeta "output"
STORE result INTO 'output' USING PigStorage(',');

-- Mostrar resultado
DUMP result;
