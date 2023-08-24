# BIND ISC (Berkeley Internet Name Domain)

![bind9](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/bb1e3955-2edd-4767-ad8f-da0fbe6bef90)

BIND ISC es un servidor DNS (Domain Name System) de código abierto ampliamente utilizado en Internet. Proporciona la capacidad de traducir nombres de dominio en direcciones IP y viceversa, lo que permite la resolución de nombres y el funcionamiento de Internet.

## Archivos principales de Bind9

A continuación se muestran los archivos principales utilizados en el servicio Bind9, junto con sus descripciones:

| Archivo        | Descripción                                           |
| -------------- | ----------------------------------------------------- |
| named.conf                  | Archivo de configuración principal del servidor DNS BIND9. Contiene la configuración global, zonas y opciones de funcionamiento del servidor DNS. |
| /var/log/bind/named.log     | Archivo de registro que almacena eventos, mensajes y registros de actividad generados por el servidor DNS BIND9. Es útil para el diagnóstico y seguimiento del funcionamiento del servidor. |
| /TIC2023.com.db             | Archivo de zona de resolución directa (forward lookup zone) para el dominio "TIC2023.com". Contiene registros de recursos que mapean nombres de host a direcciones IP en la zona "TIC2023.com". |
| /0.168.192.rev              | Archivo de zona de resolución inversa (reverse lookup zone) para la red 192.168.0.0. Contiene registros de recursos que mapean direcciones IP a nombres de host en la red 192.168.0.0. |
| /var/cache/bind             | Directorio utilizado por BIND9 para almacenar en caché registros DNS. Este directorio ayuda a acelerar las consultas DNS al guardar temporalmente los resultados de consultas previas. |


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
docker run -dit --restart=always --net=host -v dns_logs_volumen:/var/log/bind/ --name dns_server andresye/bind
```
