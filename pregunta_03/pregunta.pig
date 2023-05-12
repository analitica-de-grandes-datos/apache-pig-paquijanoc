/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Carga el archivo TSV
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1: chararray, col2: chararray, col3: int);

-- Ordena los datos por la tercera columna en orden ascendente
sorted_data = ORDER data BY col3 ASC;

-- Obtiene los cinco valores más pequeños de la tercera columna
top_values = TOP sorted_data 5;

-- Almacena los resultados en formato CSV
STORE top_values INTO 'output' USING PigStorage(',');

-- Muestra los resultados en la consola
DUMP top_values;