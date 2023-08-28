
# Procedimiento para Deshabilitar y Verificar Servicios Interferentes

## Verificar Servicios Instalados

Ejecuta el siguiente comando para listar los servicios que están escuchando en puertos de red:

```shell
sudo netstat -tulnp
```

![verificacion_servicios_activos](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/62fa6805-ac03-4578-ba51-b27e744daea3)

2. **Ubicar Servicios Interferentes**
Analiza la lista de servicios proporcionada en el Paso 1 y ubica aquellos que puedan interferir con los servicios que deseas configurar. Por ejemplo, servicios como dhcpcd, dnsmasq, vsftpd, y httpd pueden interferir con la configuración de red.

3. **Detener y Deshabilitar Servicios Interferentes**
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

![configuracion_servicios_asociados](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/1525f854-3e6a-4a00-a2e1-d819d13b475b)


4. **Verificar Estado Actual de Servicios**
Para verificar el estado actual del servicio DHCPCD y asegurar de que se ha detenido y deshabilitado correctamente, ejecuta el siguiente comando:
```shell
sudo systemctl status dhcpcd
```
![verificacion_servicio_dhcpcd](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/af535c04-b3c2-4cdb-b98c-277295d4d0dc)


Además, puedes listar todos los servicios y sus estados con el siguiente comando:

```shell
systemctl list-unit-files --type=service
```

![verificacion_estado_servicios](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/c1b5a433-6217-418e-b148-0553264cb70e)
