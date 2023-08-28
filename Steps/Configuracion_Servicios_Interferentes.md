
# Procedimiento para Deshabilitar y Verificar Servicios Interferentes

## Paso 1: Verificar Servicios Instalados

Ejecuta el siguiente comando para listar los servicios que están escuchando en puertos de red:

```shell
sudo netstat -tulnp
```


## Paso 2: Ubicar Servicios Interferentes
Analiza la lista de servicios proporcionada en el Paso 1 y ubica aquellos que puedan interferir con los servicios que deseas configurar. Por ejemplo, servicios como dhcpcd, dnsmasq, vsftpd, y httpd pueden interferir con la configuración de red.

## Paso 3: Detener y Deshabilitar Servicios Interferentes
Para detener y deshabilitar los servicios interferentes, ejecuta los siguientes comandos para cada servicio identificado en el Paso 2, en este caso DHCPCD que interfiere con el servicio DHCP:
- Vericamos servicio DHCPCD
```shell
sudo systemctl status dhcpcd
```
- Deshabilitamos del Inicio el servicio DHCPCD
```shell
sudo systemctl disable dhcpcd
```
- Detemos servicio DHCPCD
Para detener y deshabilitar dhcpcd:
```shell
sudo systemctl stop dhcpcd
```



## Paso 4: Verificar Estado Actual de Servicios
Para verificar el estado actual del servicio DHCPCD y asegurar de que se ha detenido y deshabilitado correctamente, ejecuta el siguiente comando:

```shell
sudo systemctl status dhcpcd
```


Además, puedes listar todos los servicios y sus estados con el siguiente comando:

```shell
systemctl list-unit-files --type=service
```

