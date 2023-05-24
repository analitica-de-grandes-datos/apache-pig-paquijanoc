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

-- Agrega un número de rango a cada registro basado en la tercera columna
ranked_data = RANK data BY col3;

-- Filtra los registros con un rango menor o igual a 5
filtered_data = FILTER ranked_data BY $0 <= 5;

-- Ordena los datos por el rango ascendente
sorted_data = ORDER filtered_data BY $0;

-- Proyecta solo la tercera columna
result = FOREACH sorted_data GENERATE col3;

-- Almacena los resultados en formato CSV
STORE result INTO 'output' USING PigStorage(',');

-- Muestra los resultados en la consola
DUMP result;