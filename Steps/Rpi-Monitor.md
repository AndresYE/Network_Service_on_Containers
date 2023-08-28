# Instalación y Configuración de RPi-Monitor en Raspberry Pi

## Instalación

#### Paso 1: Preparación de la Raspberry Pi
Actualizar la lista de paquetes disponibles en los repositorios:
```shell
sudo apt-get update
sudo apt-get upgrade
   ```
#### Paso 2: Instalación de RPi-Monitor
Ejecutar los siguientes comandos para instalar RPi-Monitor:

```shell
sudo apt-get install -y dirmngr
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F
sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list
sudo apt-get update
sudo apt-get install -y rpimonitor
```
## Configuración
#### Paso 3: Configuración de RPi-Monitor
Editar el archivo de configuración de RPi-Monitor, para configurar:
- Delay: Retardo entre KPIs.
- TimeOut: Tiempo de espera en segundos.
- Default Interval: Intervalo de muestreo en segundos.
- Dirección IPv4 de escucha de peticiones.

```shell
sudo nano /etc/rpimonitor/daemon.conf
```

```shell
daemon.delay=1
daemon.timeout=2
daemon.defaultinterval=0.1
daemon.addr=192.168.0.7
```

#### Paso 4: Reinicia el servicio
Reiniciar el servicio de RPi-Monitor para aplicar la configuración:

```shell
sudo service rpimonitor restart
```
#### Paso 5: Accede al panel web de RPi-Monitor
Abrir un navegador web y accede a la dirección IP de tu Raspberry Pi seguida del puerto 8888. Por ejemplo, http://<tu_direccion_ip>:8888. Deberías ver el panel de control de RPi-Monitor.
