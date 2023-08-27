# Instrucciones para Configurar una Raspberry Pi

## Paso 1: Descargar Raspberry Pi Imager

1.1. Ve al sitio web oficial de Raspberry Pi Imager haciendo clic en este enlace: [Raspberry Pi Imager](https://www.raspberrypi.org/software/).

<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/558435cf-7e1c-4a9d-8bdd-8d3a77584d24" alt="Descargar Raspberry Pi Imager - Paso 1">
  </kbd>
</p>

   - Descarga e instala Raspberry Pi Imager en tu computadora según el sistema operativo que estés utilizando.
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/e17c57a1-1155-4ac8-bc12-ea394cde1ef5" alt="Descargar Raspberry Pi Imager - Paso 2">
  </kbd>
</p>

2. **Insertar la tarjeta microSD**
   - Inserta la tarjeta microSD en tu lector de tarjetas y conéctalo a tu computadora.
   
3. **Abrir Raspberry Pi Imager**
   - Abre Raspberry Pi Imager en tu computadora.
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/7e318b39-83ef-43a7-b923-27850ed84dc0" alt="Abrir Raspberry Pi Imager - Paso 3">
  </kbd>
</p>

4. **Seleccionar el sistema operativo**
   - En Raspberry Pi Imager, haz clic en "Choose OS".
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/5254d660-09fc-49a3-ab51-bd84d59e555f" alt="Seleccionar el sistema operativo - Paso 4.1">
  </kbd>
</p>

   - Selecciona "Raspberry Pi OS (32-bit)".
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/bc112555-8e39-4719-bb05-21e45d5985a6" alt="Seleccionar el sistema operativo - Paso 4.2">
  </kbd>
</p>

5. **Seleccionar la tarjeta SD**
   - Haz clic en "Choose SD Card" y selecciona la tarjeta microSD que insertaste.
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/97818b8c-2b67-4200-b023-2e6eff9ca681" alt="Seleccionar la tarjeta SD - Paso 5.1">
  </kbd>
</p>
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/dc45ca19-c1d4-467c-bcb1-f7fc413e64c3" alt="Seleccionar la tarjeta SD - Paso 5.2">
  </kbd>
</p>

6. **Configurar la conexión a Internet (opcional)**
   - Si deseas configurar la conexión a Internet desde el primer arranque, selecciona la opción "Opciones Avanzadas" y configure los parámetros de arranque para la configuración de la red Wifi, conexión SSH, etc.
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/150d1848-ce8c-425d-9765-2144ed03f2cd" alt="Configurar la conexión a Internet - Paso 6.1">
  </kbd>
</p>
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/a828d752-ef06-4753-b8cf-806d696d3836" alt="Configurar la conexión a Internet - Paso 6.2">
  </kbd>
</p>
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/0bdaf173-33fc-48b0-bf61-bd8f03b8a61d" alt="Configurar la conexión a Internet - Paso 6.3">
  </kbd>
</p>
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/6fb666af-99fa-46fe-b41d-fc05ac4272c2" alt="Configurar la conexión a Internet - Paso 6.4">
  </kbd>
</p>

7. **Escribir la imagen en la tarjeta SD**
- Haz clic en "Write" para escribir la imagen de Raspberry Pi OS en la tarjeta microSD. Esto tomará unos minutos.
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/801f8e26-c683-486e-b0b8-c4a1b884fd0b" alt="Escribir la imagen en la tarjeta SD - Paso 7.1">
  </kbd>
</p>
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/5dad41f6-c5f6-46b9-a1c8-6f1390234fac" alt="Escribir la imagen en la tarjeta SD - Paso 7.2">
  </kbd>
</p>

8. **Ingreso mediante SSH**
 - Encienda la Raspberry Pi e ingrese mediante conexión SSH a la dirección de la red local a través del software Putty.
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/75fbe464-441e-418d-9ee1-f099266ce398" alt="Ingreso mediante SSH - Paso 8.1">
  </kbd>
</p>
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/21358b5e-abba-4537-8032-bb2789c5b710" alt="Ingreso mediante SSH - Paso 8.2">
  </kbd>
</p>
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/4d1327e9-b322-4136-bb15-b0c848256093" alt="Ingreso mediante SSH - Paso 8.3">
  </kbd>
</p>

9. **Verificar la version del sistema operativo**
  - Verificar la version del sistema operativo instalado mediante el comando:
```shell
cat /etc/os-release
```
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/e8958fb9-3493-43a2-8454-0ea7c4280c9c" alt="Verificar la versión del sistema operativo - Paso 9.1">
  </kbd>
</p>

