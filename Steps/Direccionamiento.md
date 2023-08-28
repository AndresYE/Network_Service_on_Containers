# Configuración de Interfaces Virtuales y Punto de Acceso en Raspberry Pi

En este tutorial, aprenderás cómo configurar interfaces virtuales en una Raspberry Pi utilizando el archivo de configuración `/etc/network/interfaces`. Además, configuraremos `wlan0` como un punto de acceso (AP) y `eth0` como cliente DHCP.
## Configuración de Interfaz WLAN 0
### Paso 1: Abrir el archivo de configuración de interfaces.

```shell
sudo nano /etc/network/interfaces
```
### Paso 1: Abrir el archivo de configuración de interfaces.

## Configuración de Interfaces Virtuales

### Paso 1: Abre el archivo de configuración de interfaces:
```shell
sudo nano /etc/network/interfaces
```
Agrega las siguientes líneas para configurar las interfaces virtuales wlan0:1 hasta wlan0:7. Puedes ajustar los números de interfaz según tus necesidades:

```shell
auto wlan0:1
iface wlan0:1 inet static
    address 192.168.1.2
    netmask 255.255.255.0

auto wlan0:2
iface wlan0:2 inet static
    address 192.168.1.3
    netmask 255.255.255.0
```

![address_configuration_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/97b0654a-d413-433b-8428-cf0119585c1f)


# Repite estos pasos para wlan0:3 hasta wlan0:7
Asegúrate de configurar direcciones IP únicas para cada interfaz virtual.

Guarda y cierra el archivo.

Reinicia el servicio de red para aplicar los cambios:
```shell
sudo service networking restart
```

Verifcar las interfaces mediante el comando:
```shell
sudo ip -a
```

![usbadapter_configuration_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/aa26d654-5b94-4731-be54-779748661d10)

![usbadapter_configuration_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/97e75b24-032d-41aa-927b-874f836d5ec0)

