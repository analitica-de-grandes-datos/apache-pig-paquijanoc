/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname 
   FROM 
       u 
   WHERE 
       SUBSTRING(firstname, 0, 1) >= 'm';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Paso 1: Leer archivo
data = LOAD 'data.csv' USING PigStorage(',') AS (id: int, firstname: chararray, lastname: chararray, birthday: chararray, color: chararray, number: int);

-- Paso 2: Filtrar registros donde el primer carácter de firstname es mayor o igual a 'm'
result = FILTER data BY SUBSTRING(firstname, 0, 1) >= 'm';

-- Paso 3: Proyectar solo el campo firstname
result = FOREACH result GENERATE firstname;

-- Paso 4: Escribir resultado en carpeta "output"
STORE result INTO 'output' USING PigStorage(',');

-- Mostrar resultado
DUMP result;
