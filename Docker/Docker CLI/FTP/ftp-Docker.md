# Docker Vsftpd

## Instrucciones de Uso

A continuación se detallan los pasos para construir la imagen y ejecutar los contenedores Docker para ftp:
1. **Construye la imagen**:
```shell
docker build -t andresye/vsftpd .
```
# VSFTPD
1. **Crear Named Volumes**:
Volumen para logs del servicio DHCP (vsftpd.log y xferlog):
 ```shell
docker volume create ftp_logs_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run --privileged=true -dti -v ftp_logs_volumen:/var/log/vsftpd/ -v vsftpd_active_local.conf:/etc/vsftpd/vsftpd.conf --net host --name ftp_server andresye/vsftpd

```
