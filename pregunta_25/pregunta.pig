/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT  
       firstname,
       SUBSTRING_INDEX(firstname, 'a', 1)
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
--- Paso 1: Leer el archivo
data = LOAD 'data.csv' USING PigStorage(',') AS (id: int, firstname: chararray, lastname: chararray, birthday: chararray, color: chararray, number: int);

-- Paso 2: Calcular la posición de la primera "a" en cada nombre
result = FOREACH data GENERATE (INDEXOF(firstname, 'a') == -1 ? '-1' : (chararray)(INDEXOF(firstname, 'a'))) AS first_a_position;

-- Paso 3: Escribir el resultado en la carpeta "output"
STORE result INTO 'output25v1' USING PigStorage(',');

-- Mostrar resultado
DUMP result;


