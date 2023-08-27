# Instalación y Configuración de RPi-Monitor en Raspberry Pi

## Pasos de instalación

Sigue estos pasos para instalar RPi-Monitor en tu Raspberry Pi:

1. **Preparación de la Raspberry Pi**: Actualizar la lista de paquetes disponibles en los repositorios:
```shell
sudo apt-get update
sudo apt-get upgrade
   ```
2. **Instalación de RPi-Monitor:** Ejecutar los siguientes comandos para instalar RPi-Monitor:

```shell
sudo apt-get install -y dirmngr
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F
sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list
sudo apt-get update
sudo apt-get install -y rpimonitor
```

3. **Configuración de RPi-Monitor:** Editar el archivo de configuración de RPi-Monitor:

```shell
sudo nano /etc/rpimonitor/daemon.conf
```
Ajustar las configuraciones según tus necesidades.

4. **Reinicia el servicio:** Reiniciar el servicio de RPi-Monitor para aplicar la configuración:

```shell
sudo service rpimonitor restart
```
5. **Accede al panel web de RPi-Monitor:** Abrir un navegador web y accede a la dirección IP de tu Raspberry Pi seguida del puerto 8888. Por ejemplo, http://<tu_direccion_ip>:8888. Deberías ver el panel de control de RPi-Monitor.
