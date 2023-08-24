# Configuración de Interfaces Virtuales y Punto de Acceso en Raspberry Pi

En este tutorial, aprenderás cómo configurar interfaces virtuales en una Raspberry Pi utilizando el archivo de configuración `/etc/network/interfaces`. Además, configuraremos `wlan0` como un punto de acceso (AP) y `eth0` como cliente DHCP.

## Configuración de Interfaces Virtuales

1. Abre el archivo de configuración de interfaces:
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
# Repite estos pasos para wlan0:3 hasta wlan0:7
Asegúrate de configurar direcciones IP únicas para cada interfaz virtual.

Guarda y cierra el archivo.

Reinicia el servicio de red para aplicar los cambios:
```shell
sudo service networking restart
```

Configura la interfaz de puente en /etc/network/interfaces para permitir que los dispositivos conectados al punto de acceso obtengan direcciones IP a través de eth0. Agrega estas líneas al archivo:

```shell
auto br0
iface br0 inet dhcp
    bridge_ports eth0 wlan0
```
Guarda y cierra el archivo.

Reinicia tu Raspberry Pi para aplicar todas las configuraciones:

```shell
Copy code
sudo reboot
```
