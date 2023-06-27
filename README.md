## Network Service on Containers

Este proyecto de titulación se centra en la integración de contenedores Docker en Raspberry Pi, aprovechando la flexibilidad y la portabilidad de los contenedores para implementar y gestionar servicios de red clave. A lo largo de este README, se proporcionarán instrucciones detalladas sobre cómo configurar y utilizar este entorno, junto con una descripción general de los componentes principales y sus interacciones.

## Configuración e Instalación

Para replicar este entorno en tu propio sistema, sigue los siguientes pasos:

1. **Instalación de Docker**: Comienza instalando Docker en tu Raspberry Pi. Puedes seguir las instrucciones oficiales de Docker para Raspberry Pi para obtener la versión adecuada.

2. **Configuración de Servicios**: Configurar los servicios de red que se describen más adelante. Puedes seguir las instrucciones adjuntadas en este repositorio para implementar cada uno de los servicios mediante los archivos de configuración asociados.

3.  **Diseño de ficheros Dockerfile**: Configurar los ficheros Dockerfile par construir imagenes para cada servicios de red. Los ficheros Dockerfle se adjunan con la descripción de cada una de las instrucciones que se emplean para implementar cada uno de los servicios.

5.  **Construcción de Imágenes de contenedores**: Construir las imagenes a partir de los ficheros Dockerfile diseñados par construir imagenes para cada servicios de red. Los comandos empleadas para consutrir las imágenes se adjunan en cada uno de los directorios de los servicios.

6.  **Ejecución de contenedores**: Ejecutar los contenedores Docker a partir de las imagenes construidas. Los comandos empleadas para ejecutar los servicios contenerizados se adjunan en cada uno de los directorios de los servicios.

7.  **Ejecución conjunta**: Ejecutar todos los contenedores Docker mediante Docker Compose. Los comandos empleadas para ejecutar los servicios contenerizados se adjunan en el direcotrio Docker Compose.
   
## Configuración de servicios de red

Sigue las instrucciones proporcionadas en cada subcarpeta del repositorio para configurar y desplegar los servicios de red deseados. A continuación, se muestra una breve descripción de cada servicio y su ubicación en el repositorio:

1. **Servicio DHCP**: `dhcp-service/`
   - Este servicio permite la asignación automática de direcciones IP a los dispositivos en la red. Sigue las instrucciones en la carpeta `dhcp-service` para configurar el servicio DHCP.

2. **Servicio DNS**: `dns-service/`
   - El servicio DNS se encarga de traducir nombres de dominio a direcciones IP. Accede a la carpeta `dns-service` para obtener instrucciones sobre cómo configurar y desplegar el servicio DNS.

3. **Servicio FTP**: `ftp-service/`
   - El servicio FTP proporciona un medio para transferir archivos entre dispositivos en la red. Consulta la carpeta `ftp-service` para obtener información detallada sobre la configuración y el despliegue del servicio FTP.

4. **Servicio HTTP**: `http-service/`
   - Este servicio permite la transferencia de páginas web y recursos asociados. En la carpeta `http-service`, encontrarás instrucciones sobre cómo configurar y desplegar el servicio HTTP.

5. **Servicio VoIP**: `voip-service/`
   - El servicio VoIP se utiliza para realizar llamadas de voz sobre IP. Sigue las instrucciones en la carpeta `voip-service` para configurar y desplegar este servicio.

6. **Servicio de enrutamiento**: `routing-service/`
   - El servicio de enrutamiento se encarga de dirigir el tráfico entre diferentes redes. Accede a la carpeta `routing-service` para obtener instrucciones sobre cómo configurar y desplegar el servicio de enrutamiento.

Sigue las instrucciones proporcionadas en cada carpeta para configurar y desplegar los servicios de red deseados en tu entorno.

## Topología
La topología a implementar es la siguiente:
![Figura 2 13](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/2eb564ed-30d2-4953-a3a2-b7ad96e34c54)

# Características de Servicios y Contenedores

A continuación se muestra una tabla con los servicios, las etiquetas de imagen, los nombres de contenedor y los nombres de los volúmenes con nombre correspondientes:

| Servicio | Nombre de etiqueta de imagen | Nombre de contenedor | Nombre de volumen              |
|----------|------------------------------|---------------------|---------------------------------------|
| DHCP 0   | andresye/dhcpd               | dhcp_server_wlan0   | dhcp_wlan0_leasess_volumen <br>dhcp_wlan0_logs_volumen       |
| DHCP 1   | andresye/dhcpd               | dhcp_server_eth0    | dhcp_eth0_leasess_volumen <br>dhcp_eth0_logs_volumen        |
| DHCP 2   | andresye/dhcpd               | dhcp_server_eth1    | dhcp_eth1_leasess_volumen <br>dhcp_eth1_logs_volumen        |
| DHCP 3   | andresye/dhcpd               | dhcp_server_eth2    | dhcp_eth2_leasess_volumen <br>dhcp_eth2_logs_volumen        |
| DNS      | andresye/bind                | dns_server          | dns_logs_volumen                      |
| FTP      | andresye/vsftpd              | ftp_server          | ftp_logs_volumen                      |
| HTTP     | andresye/nginx               | http_server         | http_logs_volumen                     |
| VoIP     | christoofar/asterisk         | voip_server         | voip_logs_volumen <br>voip_qos_volumen   |
| Routing  | frrouting/frr:v7.5.1         | routing_server      | routing_config_volumen                  |



## Recursos adicionales

Aquí hay algunos enlaces útiles relacionados con los temas cubiertos en este proyecto:

- [Documentación oficial de Docker](https://docs.docker.com)
- [Documentación de Raspberry Pi](https://www.raspberrypi.org/documentation/)
- [Tutorial de Docker en Raspberry Pi](https://www.docker.com/blog/happy-pi-day-docker-raspberry-pi/)
- [Tutorial de Docker Compose](https://docs.docker.com/compose/gettingstarted/)
- [Tutorial de redes en Docker](https://docs.docker.com/network/)


---
