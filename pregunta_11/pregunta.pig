/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código que genere la siguiente salida.

   Boyer,BOYER,boyer
   Coffey,COFFEY,coffey
   Conway,CONWAY,conway
   Crane,CRANE,crane
   Diaz,DIAZ,diaz
   Estes,ESTES,estes
   Fry,FRY,fry
   Garrett,GARRETT,garrett
   Guy,GUY,guy
   Hamilton,HAMILTON,hamilton
   Holcomb,HOLCOMB,holcomb
   Jarvis,JARVIS,jarvis
   Kinney,KINNEY,kinney
   Klein,KLEIN,klein
   Knight,KNIGHT,knight
   Noel,NOEL,noel
   Sexton,SEXTON,sexton
   Silva,SILVA,silva

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Paso 1: Leer archivo
data = LOAD 'data.csv' USING PigStorage(',') AS (col1: chararray, col2: chararray, col3: chararray);

-- Paso 2: Generar relación con apellidos y sus variantes en mayúsculas y minúsculas
relation = FOREACH data GENERATE col3 AS apellido, UPPER(col3) AS apellido_mayusculas, LOWER(col3) AS apellido_minusculas;

-- Paso 3: Ordenar por apellido en orden alfabético
sorted_relation = ORDER relation BY apellido;

-- Paso 4: Escribir resultado en carpeta "output"
STORE sorted_relation INTO 'output' USING PigStorage(',');

-- Mostrar resultado
DUMP sorted_relation;
