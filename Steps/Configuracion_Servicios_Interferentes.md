
# Procedimiento para Deshabilitar y Verificar Servicios Interferentes

## Paso 1: Verificar Servicios Instalados

Ejecuta el siguiente comando para listar los servicios que están escuchando en puertos de red:

```shell
sudo netstat -tulnp
```

![Paso 1 - preconfiguracion_servicios_interferentes_verificacion_servicios_activos](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/a8c04ffe-993a-4d3d-ab7c-1ddb8ba41662)


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

![Paso 3 - preconfiguracion_servicios_interferentes_deshabilitar_servicio_dhcpcd](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/fe3d55ca-6b3f-42d0-bd16-b8c0a1668028)


## Paso 4: Verificar Estado Actual de Servicios
Para verificar el estado actual del servicio DHCPCD y asegurar de que se ha detenido y deshabilitado correctamente, ejecuta el siguiente comando:

```shell
sudo systemctl status dhcpcd
```

![Paso 4 - preconfiguracion_servicios_interferentes_verificacion_servicio_dhcpcd](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/61e5260b-42df-45d6-a0c2-7c3e480b811d)


## Paso 5: Listar Estado de Servicios Actuales
Además, puedes listar todos los servicios y sus estados con el siguiente comando:

```shell
systemctl list-unit-files --type=service
```

![Paso 5 - preconfiguracion_servicios_interferentes_verificacion_estado_servicios](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/2fc313e8-24bc-4f13-8bf7-c2946708a083)
