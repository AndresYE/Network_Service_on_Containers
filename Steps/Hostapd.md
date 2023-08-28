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

![Paso 3 - rpi_1_preconfiguracion_hostapd_instalacion_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/0e52074d-0577-4978-b985-d87c32640961)


## Configuración de Hostap

### Paso 1: Abrir el archivo de configuración de Hostap. 
Abrir el archivo de configuración de Hostap. Puedes encontrarlo en la ruta `/etc/hostapd/hostapd.conf`.

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

![Paso 2 - rpi_1_preconfiguracion_hostapd_configuration_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/642869e5-c08a-4130-a058-240a3f06aa33)


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

![Paso 4 - rpi_1_preconfiguracion_hostapd_configuracion_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/3647e61b-0ad0-45e1-979d-daacad4d9853)


**NOTA: El servicio de HOSTAPD se activara correctamente una vez se haya configurado la dirección IP a la interfaz asociada.**
