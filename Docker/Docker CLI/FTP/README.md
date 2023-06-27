# VSFTPD

![vsftpd](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/3e59b9f8-5a7f-4e4e-babb-b1de4143cb88)

VSFTPD (Very Secure FTP Daemon) es un servidor FTP de código abierto y seguro utilizado para transferir archivos de manera eficiente y confiable sobre el protocolo FTP.

## Descripción

VSFTPD es conocido por su enfoque en la seguridad y su énfasis en ser un servidor FTP rápido y confiable. Proporciona una amplia gama de características y configuraciones para satisfacer las necesidades de los usuarios y administradores.

## Características

- **Seguridad**: VSFTPD ofrece una variedad de opciones de seguridad, como cifrado SSL/TLS, autenticación de usuarios a través de PAM (Pluggable Authentication Modules), restricciones de acceso basadas en IP, limitación de ancho de banda y más.
- **Rendimiento**: El servidor está diseñado para ser eficiente y rápido, minimizando el uso de recursos del sistema y maximizando la velocidad de transferencia de archivos.
- **Configuración flexible**: VSFTPD ofrece una amplia gama de opciones de configuración, lo que permite adaptar el servidor según las necesidades específicas de cada usuario o entorno.
- **Modos de transferencia**: Admite tanto el modo de transferencia pasiva (PASV) como el modo de transferencia activa (PORT), lo que proporciona flexibilidad en la configuración de conexiones FTP.
- **Administración remota**: Es posible administrar y configurar el servidor de forma remota a través de comandos FTP o herramientas de administración basadas en web.
- **Registro detallado**: VSFTPD registra eventos y acciones relevantes, lo que facilita el seguimiento y solución de problemas.

## Arquitectura

VSFTPD sigue una arquitectura basada en demonios (daemons). El servidor se ejecuta como un proceso en segundo plano y responde a las solicitudes FTP de los clientes. Utiliza el modelo de socket para establecer conexiones con los clientes y proporciona una interfaz de línea de comandos para la administración y configuración.

## Implementaciones

VSFTPD se puede implementar en varios escenarios, incluyendo:

- **Servidores de alojamiento web**: VSFTPD es una opción popular para servidores de alojamiento web que requieren servicios de FTP para la administración de archivos de los sitios web.
- **Transferencia de archivos interna**: Se puede implementar en entornos corporativos donde es necesario transferir archivos de manera segura y eficiente entre diferentes sistemas y ubicaciones internas.
- **Respaldo remoto**: VSFTPD se puede utilizar como parte de una solución de respaldo remoto para transferir archivos de respaldo de forma segura a un servidor de respaldo centralizado.

Puedes personalizar este archivo README.md según tus necesidades específicas, agregando más detalles o adaptando la información a tu caso particular.

# Archivos Principales de VSFTPD

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
docker run --privileged=true -dti -v ftp_logs_volumen:/var/log/vsftpd/ -v vsftpd_active_local.conf:/etc/vsftpd/vsftpd.conf --net host --name ftp_server andresye/vsftpd

```
