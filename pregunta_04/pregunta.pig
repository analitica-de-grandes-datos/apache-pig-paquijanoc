/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/
-- Carga el archivo CSV
data = LOAD 'data.csv' USING PigStorage(',') AS (
  driverId: int,
  truckId: int,
  eventTime: chararray,
  eventType: chararray,
  longitude: double,
  latitude: double,
  eventKey: chararray,
  correlationId: chararray,
  driverName: chararray,
  routeId: long,
  routeName: chararray,
  eventDate: chararray
);

-- Obtén los primeros 10 registros para las primeras tres columnas
result = FOREACH (LIMIT data 10) GENERATE driverId, truckId, eventTime;

-- Ordena los resultados por driverId, truckId y eventTime
sorted_result = ORDER result BY driverId, truckId, eventTime;

-- Muestra los resultados en la consola
DUMP sorted_result;