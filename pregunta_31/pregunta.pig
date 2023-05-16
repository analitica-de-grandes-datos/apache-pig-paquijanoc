/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Paso 1: Leer el archivo
data = LOAD 'data.csv' USING PigStorage(',') AS (id: int, firstname: chararray, lastname: chararray, birthday: chararray, color: chararray, number: int);

-- Paso 2: Obtener el año de nacimiento
year_count = FOREACH data GENERATE SUBSTRING(birthday, 0, 4) AS year;

-- Paso 3: Agrupar por año y contar
grouped_data = GROUP year_count BY year;
count_by_year = FOREACH grouped_data GENERATE group AS year, COUNT(year_count) AS count;

-- Paso 4: Escribir el resultado en la carpeta "output"
STORE count_by_year INTO 'output' USING PigStorage(',');

-- Mostrar resultado
DUMP count_by_year;
