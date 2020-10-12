# Beetrack_Test

Link GitHub: https://github.com/JanoVilches/Beetrack_Test.git

## Instalación y Configuración.

El sistema fue desarrollado en Windows, dado que era el SO que se tenía más a la mano.
Se utilizó una version de Rails 6.0.3.3 y Ruby 2.6.6.
Para mayor información respecto a la instalación, revisar http://instalarrails.com/instalar-rails-en-windows/#:~:text=Para%20instalar%20Ruby%20en%20Windows,luego%2C%20nuevamente%20en%20Next%20%3E.

## Aplicación y Supuestos.

La aplicación consta de dos endpoint como se solicitaba, cada uno manejado por su propio controlador, y un modelo realizado por medio de la lógica provista por Rails para el control de la información de los vehiculos y sus posiciones. Se utiliza la base de datos de develop SQLite.

### Modelo.

El modelo consta de 2 tablas. Para mayor detalle consultar db\schema.rb

1. Vehicles: Contiene la información respecto a los vehiculos existentes, almacenando el identificador alfanumérico del vehiculo.
2. Locations: Contiene la información de las diferentes posiciones asociadas a los vehiculos existentes, siguiendo el formato indicado. Además se añade un campo boolean "is_actual" de manera de poder mantener registro de la posición actual y conservar el historial de sus posiciones pasadas.

Este esquema realiado permite optimizar la lectura de las posiciones de los vehiculos para ser mostrados en el mapa, sin embargo la escritura se ve levemente sacrificada dado que se debe hacer update del campo is_actual antes de agregar la nueva posición del vehiculo.

### Endpoint /show

El controlador de esta vista consta de la obtención de la posición más actualizada de los vechiculos, consultando primero por todos los existentes en la tabla 'vehicles' y luego para cada uno, se obtiene su posición actual de la tabla 'locations' por medio del campo "is_actual". La información es almacenada en un lista de Hash y transformada a JSON, para ser enviada a la vista.

La vista consta principalmente de un script, el cual carga un mapa de OpenStreetMap y posiciona cada vehiculo utilizando un ícono igual para todos, mostrando su identificador al hacer click sobre un vehiculo. Se utiliza Bootstrap para el manejo de algunos css, y es cargado desde url dado que es un sistema de prueba.

### Endpoint /api/v1/gps

El controlador de este endpoint está configurado por medio de POST, recibiendo la información en base a lo indicado en las instrucciones, y luego realizando los cambios en la BD.
Para la modificación de la BD primero se consulta por la existencia de este vehiculo en la tabla 'vehicles', por medio del identificador. De no existir se crea un registro para este vehiculo y se añade su posición a la tabla 'locations'. En caso de existir el vehiculo, se modifica su posición más actual, cambiando el campo 'is_actual' a false, y se añade la nueva posición como la más actualizada.