# Instalación y Configuración de Hostapd
## Instalación Hostap
### Paso 1: Abrir una terminal mediante Putty.
### Paso 2: Actualizar la lista de paquetes disponibles en los repositorios:

```shell
sudo apt-get update
```

### Paso 3: Verificar la instalación del paquete hostapd:

```shell
service hostapd status
```

## Configuración de Hostap

### Paso 1: Abre el archivo de configuración de Hostap. Puedes encontrarlo en la ruta `/etc/hostapd/hostapd.conf`.

### Paso 2: Edita el archivo de configuración
Aquí puedes especificar el nombre de la red (SSID), el tipo de seguridad, la contraseña, el canal, entre otras opciones. A continuación, se describe la configuración implementada.

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

### Paso 3: Desenmascarar servicio Hostap
Desenmascarar servicio Hostap, para poder habilitar servicio.

```shell
sudo systemctl unmask hostapd
```

### Paso 4: Reinicia el servicio de Hostapd 
 Reinicia el servicio de Hostapd  para aplicar los cambios realizados en la configuración. Puedes hacerlo ejecutando el siguiente comando en la terminal:

```shell
sudo service hostapd restart
```

### Paso 5: Habilitar el servicio Hostapd 
Habilitar el servicio para que se ejecute al inicio de la sesión del host.
   
```shell
sudo service hostapd enable 
```

**NOTA: El servicio de HOSTAPD se activara correctamente una vez se haya configurado la dirección IP a la interfaz asociada.**
