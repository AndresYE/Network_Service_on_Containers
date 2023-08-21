
1. **Descargar Raspberry Pi Imager**

   - Ir al sitio web oficial de Raspberry Pi Imager: [Raspberry Pi Imager](https://www.raspberrypi.org/software/).
   ![Instalacion_Raspberrry_Os_Paso_1 1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/819711dd-a462-48f8-9750-d8ce787fa228)

   - Descarga e instala Raspberry Pi Imager en tu computadora según el sistema operativo que estés utilizando.
    ![Instalacion_Raspberrry_Os_Paso_1 2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/20d8baa2-6b68-4551-9c56-f325ba404efe)

2. **Insertar la tarjeta microSD**

   - Inserta la tarjeta microSD en tu lector de tarjetas y conéctalo a tu computadora.

3. **Abrir Raspberry Pi Imager**

   - Abre Raspberry Pi Imager en tu computadora.

4. **Seleccionar el sistema operativo**

   - En Raspberry Pi Imager, haz clic en "Choose OS".
   - Selecciona "Raspberry Pi OS (32-bit)".

5. **Seleccionar la tarjeta SD**

   - Haz clic en "Choose SD Card" y selecciona la tarjeta microSD que insertaste.

6. **Escribir la imagen en la tarjeta SD**

   - Haz clic en "Write" para escribir la imagen de Raspberry Pi OS en la tarjeta microSD. Esto tomará unos minutos.

7. **Configurar la conexión a Internet (opcional)**

   - Si deseas configurar la conexión a Internet desde el primer arranque, crea un archivo llamado `wpa_supplicant.conf` en la raíz de la tarjeta microSD e ingresa los detalles de tu red Wi-Fi. Aquí tienes un ejemplo de contenido para ese archivo:
