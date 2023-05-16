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
-- Paso 1: Leer archivo
data = LOAD 'data.csv' USING PigStorage(',') AS (id: int, firstname: chararray, lastname: chararray, birthday: chararray, color: chararray, number: int);

-- Paso 2: Aplicar la función SUBSTRING_INDEX para extraer la parte antes del primer carácter 'a'
result = FOREACH data GENERATE firstname, SUBSTRING_INDEX(firstname, 'a', 1) AS extracted_part;

-- Paso 3: Escribir resultado en carpeta "output"
STORE result INTO 'output' USING PigStorage(',');

-- Mostrar resultado
DUMP result;

