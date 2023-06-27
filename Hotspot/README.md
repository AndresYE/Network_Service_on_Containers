# Hostap

![hostap](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/e8b68fde-6435-4150-9e9d-64c60f8fc44a)

## Descripción

Hostap es un servicio que permite convertir un dispositivo en un punto de acceso inalámbrico (AP) para compartir la conexión a Internet con otros dispositivos. Proporciona una funcionalidad de hotspot que permite a los usuarios conectarse y acceder a la red.

## Características

- **Punto de acceso inalámbrico**: Hostap permite crear un punto de acceso inalámbrico en un dispositivo, lo que permite a otros dispositivos conectarse y compartir la conexión a Internet.
- **Seguridad**: Proporciona opciones de seguridad para proteger el punto de acceso, como cifrado de red (WPA2) y autenticación de usuarios.
- **Configuración flexible**: Permite personalizar la configuración del punto de acceso, como el nombre de la red (SSID), el canal inalámbrico y las contraseñas de seguridad.
- **Compatibilidad de dispositivos**: Hostap es compatible con una amplia gama de dispositivos y tarjetas de red inalámbricas.
- **Gestión y monitoreo**: Proporciona herramientas para gestionar y monitorear el estado del punto de acceso, como la visualización de dispositivos conectados y estadísticas de uso.

## Arquitectura

El servicio Hostap se basa en el uso de software y controladores de red inalámbrica para permitir la funcionalidad de punto de acceso inalámbrico en un dispositivo. Utiliza protocolos estándar de red para la comunicación inalámbrica y se integra con el sistema operativo del dispositivo.

## Tipos de Implementaciones

- **Compartir Internet en hogares o pequeñas oficinas**: Hostap se puede utilizar en entornos domésticos o de oficina para compartir la conexión a Internet con dispositivos móviles, computadoras portátiles u otros dispositivos inalámbricos.
- **Hotspots públicos**: El servicio Hostap también se puede implementar en lugares públicos como cafeterías, hoteles o aeropuertos, proporcionando a los usuarios acceso a Internet de forma inalámbrica.
- **Redes empresariales**: En entornos empresariales, Hostap se puede utilizar para crear puntos de acceso inalámbrico para empleados, invitados o dispositivos de Internet de las cosas (IoT).


# Cómo instalar hostapd en Debian

Esta guía te mostrará cómo instalar y desinstalar hostapd en Debian.

## Instalación

Para instalar hostapd en Debian, sigue estos pasos:

1. Abre una terminal.
2. Actualiza la lista de paquetes disponibles en los repositorios de Debian:
```shell
sudo apt-get update
```
3. Instala el paquete hostapd en tu sistema:
```shell
sudo apt-get install hostapd
```
4. Verifica la instalación del paquete hostapd:
```shell
service hostapd status
```
## Configuración de Hostap

Sigue estos pasos para configurar Hostap en tu sistema:

1. **Paso 1**: Abre el archivo de configuración de Hostap. Puedes encontrarlo en la ruta `/etc/hostapd/hostapd.conf`.

2. **Paso 2**: Edita el archivo de configuración según tus necesidades. Aquí puedes especificar el nombre de la red (SSID), el tipo de seguridad, la contraseña, el canal, entre otras opciones. A continuación, se describe la configuración implementada.

```shell
interface=wlan0
ssid=RPI-DOCKER
hw_mode=g
channel=4
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=1234567890
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP
rsn_pairwise=CCMP
```
3. **Paso 3**: Desenmascarar servicio Hostap, para poder habilitar servicio.
```shell
sudo systemctl unmask hostapd
```
4. **Paso 4**: Reinicia el servicio de Hostapd para aplicar los cambios realizados en la configuración. Puedes hacerlo ejecutando el siguiente comando en la terminal:
```shell
sudo service hostapd restart
```

5. **Paso 5**: Hbailitamos el servicio para que se ejecute al inicio de la sesión del host.
```shell
sudo service hostapd enable 
```
6. **Paso 6**: Verifica que la configuración se haya aplicado correctamente. Puedes revisar los registros o logs del servicio para obtener información adicional sobre el estado de la conexión y cualquier posible error. 
