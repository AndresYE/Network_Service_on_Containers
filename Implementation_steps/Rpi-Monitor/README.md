# Instalación y Configuración de RPi-Monitor en Raspberry Pi

Este repositorio contiene instrucciones y pasos para instalar y configurar RPi-Monitor en una Raspberry Pi.

## Pasos de instalación

Sigue estos pasos para instalar RPi-Monitor en tu Raspberry Pi:

1. **Preparación de la Raspberry Pi**:
Asegúrate de que tu Raspberry Pi esté actualizada y en funcionamiento. Puedes hacerlo ejecutando los siguientes comandos:
```shell
sudo apt-get update
sudo apt-get upgrade
   ```
2. **Instalación de RPi-Monitor:**
Ejecuta los siguientes comandos para instalar RPi-Monitor:

```shell
sudo apt-get install -y dirmngr
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F
sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list
sudo apt-get update
sudo apt-get install -y rpimonitor
```
![rpimonitor_configuration_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/416d3604-4faf-455e-9bbd-964ad5c0237b)

![rpimonitor_configuration_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/6b438018-923b-4830-8b9b-59cebff6a180)

3. **Configuración de RPi-Monitor:**
Edita el archivo de configuración de RPi-Monitor:

```shell
sudo nano /etc/rpimonitor/daemon.conf
```
Ajusta las configuraciones según tus necesidades.

4. **Reinicia el servicio:**
Reinicia el servicio de RPi-Monitor para aplicar la configuración:

```shell
sudo service rpimonitor restart
```
5. **Accede al panel web de RPi-Monitor:**

Abre un navegador web y accede a la dirección IP de tu Raspberry Pi seguida del puerto 8888. Por ejemplo, http://<tu_direccion_ip>:8888. Deberías ver el panel de control de RPi-Monitor.
