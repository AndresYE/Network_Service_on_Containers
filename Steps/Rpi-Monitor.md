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

![preconfiguracion_rpimonitor_instalacion_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/dab019af-5d93-4344-95fb-f4fe5575eb6a)

![preconfiguracion_rpimonitor_instalacion_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/fc5dd350-13c4-4491-b089-8fb14a0792fe)


## Configuración
#### Paso 3: Configuración de RPi-Monitor
Editar el archivo de configuración de RPi-Monitor, para configurar:
- Delay: Retardo entre KPIs.
- TimeOut: Tiempo de espera en segundos.
- Default Interval: Intervalo de muestreo en segundos.
- Dirección IPv4 de escucha de peticiones.
- Puerto de Escucha.

```shell
sudo nano /etc/rpimonitor/daemon.conf
```

```shell
daemon.delay=1
daemon.timeout=2
daemon.defaultinterval=0.1
daemon.addr=192.168.0.7
daemon.port=8888
```
#### Paso 4: Agregar Complementos de Monitoreo
Configurar el archivo "data.conf", para configurar los archivos de configuración de monitoreo adicionales.
```shell
sudo nano /etc/rpimonitor/data.conf
```
Agregamos los archivos de configuración para el monitoreo de CPU, Memoria, Temperatura, UPtime y service. Además agregar archivos personalizados para las interfaces "eth1", "eth2" y "eth3", basadas en las configuraciones de "network.conf", que se encuentran en el directorio "/etc/rpimonitor/template/".

#### Paso 5: Reinicia el servicio
Reiniciar el servicio de RPi-Monitor para aplicar la configuración:

```shell
sudo systemctl restart rpimonitor 
```
#### Paso 5: Acceder al panel web de RPi-Monitor
Abrir un navegador web y accede a la dirección IP de tu Raspberry Pi seguida del puerto 8888. Por ejemplo, "http://192.168.0.7:8888". 

![preconfiguracion_rpimonitor_interfaz](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/6eddc7d6-e5a7-4c4a-960b-104a7e07c747)
