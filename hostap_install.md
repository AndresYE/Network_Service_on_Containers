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
driver=nl80211
ssid=NombreDelHotspot
hw_mode=g
channel=7
wpa=2
wpa_passphrase=ContraseñaDelHotspot
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

## Uso

Una vez que hayas instalado y configurado Hostapd, puedes seguir estos pasos para utilizarlo:

1. Paso 1: Primer paso de uso
2. Paso 2: Segundo paso de uso
3. Paso 3: Tercer paso de uso

## Contribución

Si deseas contribuir a este proyecto, sigue estos pasos:

1. Paso 1: Cómo clonar el repositorio
2. Paso 2: Cómo crear una rama de características
3. Paso 3: Cómo enviar una solicitud de extracción

## Problemas

Si encuentras algún problema durante la instalación o configuración, revisa nuestra sección de problemas conocidos antes de abrir un problema. Si tu problema no se ha resuelto, puedes abrir un nuevo problema proporcionando los detalles necesarios.

## Licencia

Este proyecto se distribuye bajo la Licencia XYZ. Para más información, consulta el archivo [LICENSE](LICENSE).
