/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
-- Paso 1: Leer archivo
data = LOAD 'data.csv' USING PigStorage(',') AS (col1: chararray, col2: chararray, col3: chararray);

-- Paso 2: Filtrar los apellidos que empiezan por las letras 'd' a 'k'
filtered_data = FILTER data BY (col3 >= 'D' AND col3 <= 'L');

-- Paso 3: Proyectar solo la columna de apellidos
apellidos = FOREACH filtered_data GENERATE col3;

-- Paso 4: Escribir resultado en carpeta "output"
STORE apellidos INTO 'output' USING PigStorage(',');

-- Mostrar resultado
DUMP apellidos;
