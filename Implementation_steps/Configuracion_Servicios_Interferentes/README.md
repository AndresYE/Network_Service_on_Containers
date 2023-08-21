
# Procedimiento para Deshabilitar y Verificar Servicios Interferentes

Este procedimiento te guiará a través de los pasos para verificar y deshabilitar servicios interferentes en tu sistema.

1. **Verificar Servicios Instalados**

Ejecuta el siguiente comando para listar los servicios que están escuchando en puertos de red:

```shell
sudo netstat -tulnp
```
Esto te proporcionará una lista de servicios y los puertos en los que están activos.

2. **Ubicar Servicios Interferentes**
Analiza la lista de servicios proporcionada en el Paso 1 y ubica aquellos que puedan interferir con los servicios que deseas configurar. Por ejemplo, servicios como dhcpcd, dnsmasq, vsftpd, y httpd pueden interferir con la configuración de red.

3. **Detener y Deshabilitar Servicios Interferentes**
Para detener y deshabilitar los servicios interferentes, ejecuta los siguientes comandos para cada servicio identificado en el Paso 2:

```shell
sudo systemctl stop service_name
sudo systemctl disable service_name
```
Donde service_name es el nombre del servicio que deseas detener y deshabilitar.

Para detener y deshabilitar dhcpcd:
```shell
sudo systemctl stop dhcpcd
sudo systemctl disable dhcpcd
```
Repite estos pasos para cada servicio interferente que hayas identificado.

4. **Verificar Estado Actual de Servicios**
Para verificar el estado actual de los servicios y asegurarte de que se han detenido y deshabilitado correctamente, ejecuta el siguiente comando para cada servicio:

```shell
sudo systemctl status service_name
```
Esto te mostrará el estado actual del servicio.

Además, puedes listar todos los servicios y sus estados con el siguiente comando:

```shell
systemctl list-unit-files --type=service
```
Esto proporcionará una lista completa de servicios y sus estados en tu sistema.
