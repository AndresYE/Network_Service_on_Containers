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
![hostapd_install](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/7ea1f04f-d7a7-4a47-b6de-83f956f1869d)

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
![hostapd_configuration_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/78fc9afc-b0f9-471c-bfd6-7080b890914c)

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
![hostapd_configuration_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/d09bf112-e397-4b5a-be13-688dadf17418)
 
 **NOTA: El servicio de HOSTAPD se activara correctamente una vez se haya configurado la dirección IP a la interfaz asociada.
