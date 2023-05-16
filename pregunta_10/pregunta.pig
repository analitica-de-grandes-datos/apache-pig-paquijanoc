/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Paso 1: Leer archivo
data = LOAD 'data.csv' USING PigStorage(',') AS (col1: chararray, col2: chararray, col3: chararray);

-- Paso 2: Generar relación con apellido y longitud
relation = FOREACH data GENERATE col3 AS apellido, SIZE(col3) AS longitud;

-- Paso 3: Ordenar por longitud y apellido
sorted_relation = ORDER relation BY longitud DESC, apellido;

-- Paso 4: Obtener los primeros 5 registros
limited_relation = LIMIT sorted_relation 5;

-- Paso 5: Escribir resultado en carpeta "output"
STORE limited_relation INTO 'output' USING PigStorage(',');

-- Mostrar resultado
DUMP limited_relation;
