
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
docker run -dit -v dns_logs_volumen:/var/log/bind/named.log --net=host --name dns_server andresye/bind
```
