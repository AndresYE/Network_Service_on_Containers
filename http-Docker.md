# Docker Http

## Instrucciones de Uso

A continuación se detallan los pasos para construir la imagen y ejecutar los contenedores Docker para http:
1. **Construye la imagen**:
```shell
docker build -t andresye/nginx .
```
# BIND
1. **Crear Named Volumes**:
Volumen para logs del servicio DHCP (vsftpd.log y xferlog):
 ```shell
docker volume create http_logs_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run -dit -v http_logs_volumen:/var/log/nginx/  -v ./www.TIC2023.com:/usr/share/nginx/html/ -v ./web1.TIC2023.com:/usr/share/nginx/html/  -v ./web2.TIC2023.com:/usr/share/nginx/html/ --net=host --name http_server andresye/nginx
```
