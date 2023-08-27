
1. **Descargar Raspberry Pi Imager**

   - Ir al sitio web oficial de Raspberry Pi Imager: [Raspberry Pi Imager](https://www.raspberrypi.org/software/).
   
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/9ccede86-05fb-42ce-92ce-af2b3963f33balt" alt="Descripción de la imagen">
  </kbd>
</p>

   - Descarga e instala Raspberry Pi Imager en tu computadora según el sistema operativo que estés utilizando.
<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/c0fa1782-3077-4239-80a4-b68b74cafe81" alt="Descripción de la imagen">
  </kbd>
</p>

2. **Insertar la tarjeta microSD**

   - Inserta la tarjeta microSD en tu lector de tarjetas y conéctalo a tu computadora.

3. **Abrir Raspberry Pi Imager**

   - Abre Raspberry Pi Imager en tu computadora.

<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/cbe37cc0-16d1-4b8d-ae2a-a0ff113f1313" alt="Instalacion_Raspberrry_Os_Paso_3">
  </kbd>
</p>

4. **Seleccionar el sistema operativo**

   - En Raspberry Pi Imager, haz clic en "Choose OS".


<p align="center">
  <kbd>
    <img src="" alt="Descripción de la imagen">
  </kbd>
</p>
   - Selecciona "Raspberry Pi OS (32-bit)".

<p align="center">
  <kbd>
    <img src="" alt="Descripción de la imagen">
  </kbd>
</p>
5. **Seleccionar la tarjeta SD**

   - Haz clic en "Choose SD Card" y selecciona la tarjeta microSD que insertaste.


<p align="center">
  <kbd>
    <img src="" alt="Descripción de la imagen">
  </kbd>
</p>
6. **Configurar la conexión a Internet (opcional)**

   - Si deseas configurar la conexión a Internet desde el primer arranque, selecciona la opción "Opciones Avanzadas" y configure los parámetros de arranque para la configuración de la red Wifi, conexión SSH, etc.

<p align="center">
  <kbd>
    <img src="" alt="Descripción de la imagen">
  </kbd>
</p>
7. **Escribir la imagen en la tarjeta SD**
- Haz clic en "Write" para escribir la imagen de Raspberry Pi OS en la tarjeta microSD. Esto tomará unos minutos.

<p align="center">
  <kbd>
    <img src="" alt="Descripción de la imagen">
  </kbd>
</p>

8. **Ingreso mediante SSH**

 - Encienda la Raspberry Pi e ingrese mediante conexión SSH a la dirección de la red local a través del software Putty.

<p align="center">
  <kbd>
    <img src="" alt="Descripción de la imagen">
  </kbd>
</p>
9. **Verificar la version del sistema operativo**
  - Verificar la version del sistema operativo instalado mediante el comando:

```shell
cat /etc/os-release
```

<p align="center">
  <kbd>
    <img src="" alt="Descripción de la imagen">
  </kbd>
</p>
