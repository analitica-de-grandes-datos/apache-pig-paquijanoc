/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       REGEX_EXTRACT(birthday, '....-..-..', 2) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Paso 1: Leer archivo
data = LOAD 'data.csv' USING PigStorage(',') AS (id: int, firstname: chararray, lastname: chararray, birthday: chararray, color: chararray, number: int);

-- Paso 2: Aplicar la función REGEX_EXTRACT para extraer el segundo componente de la fecha de cumpleaños
result = FOREACH data GENERATE REGEX_EXTRACT(birthday, '(....-..-..)', 2) AS extracted_component;

-- Paso 3: Escribir resultado en carpeta "output"
STORE result INTO 'output' USING PigStorage(',');

-- Mostrar resultado
DUMP result;

