# BIND ISC (Berkeley Internet Name Domain)

![bind9](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/bb1e3955-2edd-4767-ad8f-da0fbe6bef90)

BIND ISC es un servidor DNS (Domain Name System) de código abierto ampliamente utilizado en Internet. Proporciona la capacidad de traducir nombres de dominio en direcciones IP y viceversa, lo que permite la resolución de nombres y el funcionamiento de Internet.

## Archivos principales de Bind9

A continuación se muestran los archivos principales utilizados en el servicio Bind9, junto con sus descripciones:

| Archivo        | Descripción                                           |
| -------------- | ----------------------------------------------------- |
| named.conf     | Archivo de configuración principal del servidor Bind9. |
| named.conf.options   | Archivo de opciones de configuración global del servidor Bind9. |
| named.conf.local  | Archivo de configuración de zonas locales para el servidor Bind9. |
| named.conf.default-zones | Archivo de configuración de las zonas predeterminadas del servidor Bind9. |
| named.conf.log | Archivo de configuración de registros de log del servidor Bind9. |
| named.conf.options.local | Archivo de configuración de opciones locales adicionales del servidor Bind9. |
| named.conf.default | Archivo de configuración predeterminada del servidor Bind9. |
| named.conf.local.template | Plantilla de archivo de configuración de zonas locales para el servidor Bind9. |
| named.conf.options.template | Plantilla de archivo de opciones de configuración global del servidor Bind9. |
| named.conf.named-cache.template | Plantilla de archivo de configuración de caché del servidor Bind9. |
| named.conf.recursion-template | Plantilla de archivo de configuración de recursión del servidor Bind9. |
| named.conf.logging-template | Plantilla de archivo de configuración de registros de log del servidor Bind9. |

# Docker Bind

## Instrucciones de Uso

A continuación se detallan los pasos para construir la imagen y ejecutar los contenedores Docker para dns:
1. **Construye la imagen**:
```shell
docker build -t andresye/bind .
```
# BIND
1. **Crear Named Volumes**:
Volumen para logs del servicio DHCP (named.log):
 ```shell
docker volume create dns_logs_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run -dit -v dns_logs_volumen:/var/log/bind/ --net=host --name dns_server andresye/bind
```
