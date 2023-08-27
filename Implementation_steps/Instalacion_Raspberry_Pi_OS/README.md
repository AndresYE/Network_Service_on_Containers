# Configuración de tu Raspberry Pi - Guía Personalizada

¡Hola! Aquí te guiaré a través de los pasos para configurar tu Raspberry Pi.

## Paso 1: Descargar Raspberry Pi Imager

1.1. Ve al sitio web oficial de Raspberry Pi Imager haciendo clic en este enlace: [Raspberry Pi Imager](https://www.raspberrypi.org/software/).

1.2. Descarga el programa Raspberry Pi Imager que coincide con tu sistema operativo y, una vez descargado, instálalo en tu computadora.

![Descargar Raspberry Pi Imager - Paso 1](url_imagen_paso_1)

## Paso 2: Insertar la tarjeta microSD

2.1. Toma tu tarjeta microSD y colócala en el lector de tarjetas.

2.2. Luego, conecta el lector de tarjetas a tu computadora.

## Paso 3: Abrir Raspberry Pi Imager

3.1. Ahora, abre el programa Raspberry Pi Imager que descargaste en el Paso 1.

![Abrir Raspberry Pi Imager - Paso 3](url_imagen_paso_3)

## Paso 4: Seleccionar el sistema operativo

4.1. En la ventana de Raspberry Pi Imager, busca y selecciona la opción "Choose OS".

4.2. Luego, elige "Raspberry Pi OS (32-bit)" como tu sistema operativo.

## Paso 5: Seleccionar la tarjeta SD

5.1. Haz clic en "Choose SD Card" y selecciona la tarjeta microSD que conectaste en el Paso 2.

![Seleccionar la tarjeta SD - Paso 5.1](url_imagen_paso_5_1)
![Seleccionar la tarjeta SD - Paso 5.2](url_imagen_paso_5_2)

## Paso 6: Configurar la conexión a Internet (opcional)

6.1. Si deseas configurar la conexión a Internet desde el primer arranque, selecciona la opción "Opciones Avanzadas" y configura los detalles de la red Wifi o SSH, según tus necesidades.

![Configurar la conexión a Internet - Paso 6.1](url_imagen_paso_6_1)
![Configurar la conexión a Internet - Paso 6.2](url_imagen_paso_6_2)
![Configurar la conexión a Internet - Paso 6.3](url_imagen_paso_6_3)
![Configurar la conexión a Internet - Paso 6.4](url_imagen_paso_6_4)

## Paso 7: Escribir la imagen en la tarjeta SD

7.1. Ahora, presiona el botón "Write" en Raspberry Pi Imager para escribir la imagen de Raspberry Pi OS en tu tarjeta microSD. Esto tomará algunos minutos.

![Escribir la imagen en la tarjeta SD - Paso 7.1](url_imagen_paso_7_1)
![Escribir la imagen en la tarjeta SD - Paso 7.2](url_imagen_paso_7_2)

## Paso 8: Ingreso mediante SSH

8.1. Una vez que la escritura se complete, retira la tarjeta microSD del lector y colócala en tu Raspberry Pi.

8.2. Enciende tu Raspberry Pi y, si lo deseas, puedes acceder a ella mediante una conexión SSH utilizando un software como Putty.

![Ingreso mediante SSH - Paso 8.1](url_imagen_paso_8_1)
![Ingreso mediante SSH - Paso 8.2](url_imagen_paso_8_2)
![Ingreso mediante SSH - Paso 8.3](url_imagen_paso_8_3)

## Paso 9: Verificar la versión del sistema operativo

9.1. Una vez que hayas iniciado sesión en tu Raspberry Pi, puedes verificar la versión del sistema operativo instalado ejecutando el siguiente comando en la terminal:

```shell
cat /etc/os-release


