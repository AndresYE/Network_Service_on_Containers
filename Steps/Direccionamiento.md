# Configuración de Interfaces Virtuales y Punto de Acceso en Raspberry Pi

En este tutorial, aprenderás cómo configurar interfaces virtuales en una Raspberry Pi utilizando el archivo de configuración `/etc/network/interfaces`. Además, configuraremos `wlan0` como un punto de acceso (AP) y `eth0` como cliente DHCP.
## Configuración de Interfaz WLAN 0
### Paso 1: Abrir el archivo de configuración de interfaces.

```shell
sudo nano /etc/network/interfaces
```
### Paso 2: Habilitar automaticamente interfaz WLAN0 en inicio de sesión
```shell
auto wlan0
```
### Paso 3: Habilitar configuraración para red en modo manual
```shell
iface wlan0 inet manual
```
### Paso 4: Habilitar detección automatica de dispositivos en WLAN0
```shell
allow-hotplug wlan0
```
### Paso 5: Configurar direccionamiento estático para interfaz WLAN0
```shell
iface wlan0 inet static
address 192.168.0.1
netmask 255.255.255.0
broadcast 192.168.0.255
```

## Configuración de Interfaces Virtuales

### Paso 1: Abre el archivo de configuración de interfaces

```shell
sudo nano /etc/network/interfaces
```

### Paso 2: Habilitar automaticamente interfaz virtual WLAN0:1 en inicio de sesión

```shell
auto wlan0:1
```

### Paso 3: Configurar direccionamiento estático para interfaz virtual WLAN0:1

```shell
iface wlan0:1 inet static
address 192.168.0.2
netmask 255.255.255.0
broadcast 192.168.0.255
```

### Paso 4: Repite estos pasos para wlan0:2 hasta wlan0:6

### Paso 5: Reinicia el servicio de red

```shell
sudo systemctl restart networking 
```

### Paso 6: Verifcar las interfaces mediante el comando:
```shell
sudo ifconfig -a
```


