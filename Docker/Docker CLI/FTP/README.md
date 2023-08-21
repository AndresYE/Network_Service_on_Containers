# VSFTPD

![vsftpd](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/3e59b9f8-5a7f-4e4e-babb-b1de4143cb88)

VSFTPD (Very Secure FTP Daemon) es un servidor FTP de código abierto y seguro utilizado para transferir archivos de manera eficiente y confiable sobre el protocolo FTP.

## Archivos Principales de VSFTPD

A continuación se muestra una tabla que describe los archivos principales utilizados en VSFTPD:

| Archivo            | Descripción                                                   |
|--------------------|---------------------------------------------------------------|
| vsftpd.conf        | Archivo de configuración principal de VSFTPD                  |
| vsftpd.chroot_list | Archivo que lista los usuarios permitidos para la restricción de chroot |
| vsftpd.user_list   | Archivo que lista los usuarios permitidos para el acceso FTP   |
| vsftpd.pam         | Archivo de configuración para la autenticación de usuarios a través de PAM |
| vsftpd.log         | Archivo de registro de eventos y acciones de VSFTPD           |
| vsftpd.pid         | Archivo que contiene el ID del proceso de VSFTPD en ejecución |
| vsftpd.banner      | Archivo que contiene el mensaje de bienvenida del servidor     |

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
docker run --privileged=true -dti -v ftp_logs_volumen:/var/log/vsftpd/ -v "$(pwd)"/vsftpd_active_local.conf:/etc/vsftpd/vsftpd.conf --net host --name ftp_server andresye/vsftpd

```
