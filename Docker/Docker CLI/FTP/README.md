# VSFTPD

![vsftpd](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/3e59b9f8-5a7f-4e4e-babb-b1de4143cb88)

VSFTPD (Very Secure FTP Daemon) es un servidor FTP de código abierto y seguro utilizado para transferir archivos de manera eficiente y confiable sobre el protocolo FTP.

## Archivos Principales de VSFTPD

A continuación se muestra una tabla que describe los archivos principales utilizados en VSFTPD:

| Archivo            | Descripción                                                   |
|--------------------|---------------------------------------------------------------|
| vsftpd.conf          | Archivo de configuración principal de vsftpd. Contiene las opciones de configuración que controlan el comportamiento del servidor FTP, como puertos, usuarios permitidos, opciones de seguridad y más. |
| vsftpd.chroot_list | Archivo que lista los usuarios permitidos para la restricción de chroot |
| vsftpd.user_list   | Archivo que lista los usuarios permitidos para el acceso FTP   |
| vsftpd.pam         | Archivo de configuración para la autenticación de usuarios a través de PAM ||
| vsftpd.pid         | Archivo que contiene el ID del proceso de VSFTPD en ejecución |
| xferlog              | El archivo de registro (log) de transferencia de vsftpd. Registra información sobre las transferencias de archivos realizadas a través del servidor FTP, incluyendo detalles como las direcciones IP de origen y destino, nombres de archivos, fechas y tamaños de transferencia. Es útil para el seguimiento de actividades de transferencia. |
| vsftpd.log           | El archivo de registro general de vsftpd. Registra eventos y actividades del servidor FTP, como conexiones de clientes, errores de autenticación, comandos emitidos y otros eventos importantes. Es esencial para la monitorización y solución de problemas. |

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
docker run --restart=always --privileged=true -dti --net host -v ftp_logs_volumen:/var/log/vsftpd/ --name ftp_server andresye/vsftpd
```
