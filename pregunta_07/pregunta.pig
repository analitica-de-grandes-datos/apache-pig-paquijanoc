/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Carga el archivo TSV
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1: chararray, col2: bag{t: tuple(letter: chararray)}, col3: chararray);

-- Calcula la cantidad de elementos en la columna 2
col2_count = FOREACH data GENERATE col1, SIZE(col2) AS col2_count;

-- Calcula la cantidad de elementos en la columna 3
col3_count = FOREACH data GENERATE col1, SIZE(TOKENIZE(REPLACE(col3, '[', ''), ',')) AS col3_count;

-- Combina las columnas y ordena los resultados
result = JOIN col2_count BY col1, col3_count BY col1;
result = FOREACH result GENERATE col2_count::col1 AS col1, col2_count::col2_count AS col2_count, col3_count::col3_count AS col3_count;
result = ORDER result BY col1, col2_count, col3_count;

-- Almacena los resultados en formato CSV
STORE result INTO 'output' USING PigStorage(',');

-- Muestra los resultados en la consola
DUMP result;