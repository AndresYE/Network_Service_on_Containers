En el presente apartado se describe el procedimiento para la implementación de servicios de red mediante contenedores. A continuación se enlistan los pasos correspondientes.

# Preconfiguraciones

## **Instalación Raspberry OS:**
- Como primer paso se instalará el sistema operativo Raspberry OS en la placa de desarrollo Raspberry Pi 4B, en base a los pasos descritos en [Raspberry Pi Documentation](https://www.raspberrypi.com/documentation/computers/getting-started.html#installing-the-operating-system). La configuración se realizará para un sistema operativo basado en Debian 11 Bullseye arquitectura ARM de 32bits sin interfaz gráfica "RASPBERRY PI OS LITE (32-BIT)". Además, se configurará la red Wifi local y SSH, para realizar las configuraciones de manera remota. El procedimiento realizado se muestra en [Intalación de Raspberry OS](https://github.com/AndresYE/Network_Service_on_Containers/blob/195198dbbaa3d481e01358605d8de3d51a6c8db1/Implementation_steps/Instalacion_Raspberry_Pi_OS/README.md)

## **Instalación Docker y Docker Compose:** 
- Como segundo paso se instala el paquete de software Docker y sus herramientas asociadas, como Docker Compose. Para lo cual, se toma en cuenta la arquitectura y distribución de Raspberry OS dentro de la página de "Plataformas Soportadas" de Docker en [Docker Installation](https://docs.docker.com/engine/install/). Luego, se procede a la instalación de Docker para la distribución Debian 11 Bullseye descrita en [Docker Installation for Debian](https://docs.docker.com/engine/install/debian/). Posterior a ello, se instala el complemento para el despliegue Multicontenedor sobre Docker Compose, como se describe en [Docker Compose Installation](https://docs.docker.com/compose/install/linux/). El procedimiento realizado se muestra en [Intalación de Docker para Debian](https://github.com/AndresYE/Network_Service_on_Containers/tree/df30bbdbaa23c1806ddec2c73ffccc4f755376c2/Implementation_steps/Instalacion_Docker).

## **Configuración de Interfaces de Red y Direccionamiento:**
- Para agregar las interfaces de red (adaptadores USB-Ehternet) a la placa Raspberry Pi y asociar las interfaces  a un nombre especifico de interfaz mediante la MAC, se emplea la solución descrita en [Aosciación de Nombre de Interfaz de res a adaptador USB-Ethernet](https://unix.stackexchange.com/questions/388300/udev-does-not-rename-usb-ethernet-device). Donde se describe la configuración del archivo del sistema: "/etc/udev/rules.d/99-com.rules".El procedimiento realizado se muestra en [Configuración de Adaptadores Ethernet](https://github.com/AndresYE/Network_Service_on_Containers/blob/2781548ff7ee316803f6cab1c4f57f9c8e0194d6/Implementation_steps/Configuracion_Adaptadores_Ethernet/README.md), donde se adjunta los archivos de configuración para las dos placas Rasperry Pi.

- Para implementar interfaces virtuales se configuran "alias" de una interfaz, mediante el fichero "/etc/network/interfaces", de acuerdo a la solucion presentada en [Interfaces Virtuales](https://forums.raspberrypi.com/viewtopic.php?t=154471). Esta configuración aplica unicamente para la placa Raspberry PI I.

- El direccionesmianeto se lo realiza mediante la configuración de direccionamiento estático y dinámico mediante el fichero "/etc/network/interfaces", para asociar los servicios contenerizados a una dirección IP y a la interfaz virtual creada.
El direccionamiento IPv4 para la placa Raspberry PI I se presenta en la siguiente Tabla a continuación:

| Servicios de Red                | Interfaz | Dirección IPv4/Máscara | Dirección de Gateway |
|---------------------------------|----------|------------------------|-----------------------|
| SSH \| Hostap \| DHFP I         | Wlan0    | 192.168.0.1/24         | N/A                   |
| SSH \| DNS                       | Wlan0:1  | 192.168.0.2/24         | N/A                   |
| SSH \| FTP                       | Wlan0:3  | 192.168.0.4/24         | N/A                   |
| SSH \| HTTP                      | Wlan0:4  | 192.168.0.5/24         | N/A                   |
| SSH \| VoIP                      | Wlan0:5  | 192.168.0.6/24         | N/A                   |
| SSH \| Rpi-Monitor               | Wlan0:6  | 192.168.0.7/24         | N/A                   |
| SSH                             | Eth0     | (Cliente DHCP)         | (Cliente DHCP)        |
| SSH \| Routing \| DHCP II        | Eth1     | 192.168.1.1/24         | 192.168.1.1           |
| SSH \| Routing \| DHCP III       | Eth2     | 192.168.2.1/24         | 192.168.2.1           |
| SSH \| Routing                   | Eth3     | 10.0.1.1/30            | N/A                   |

PEl direccionamiento IPv4 para la placa Raspberry PI III se presenta en la siguiente Tabla a continuación:
| Servicios de Red        | Interfaz | Dirección IPv4/Máscara | Dirección de Gateway |
|-------------------------|----------|------------------------|-----------------------|
| SSH                     | Eth0     | (Cliente DHCP)         | (Cliente DHCP)        |
| SSH \| Routing \| DHCP I | Eth1     | 192.168.1.1/24         | 192.168.1.1           |
| SSH \| Routing \| DHCP II | Eth2     | 192.168.2.1/24         | 192.168.2.1           |
| SSH \| Routing           | Eth3     | 10.0.1.2/30            | N/A                   |
## **Instalación y Configuración de Servicios asociados:** 
- Instalación y configuración del driver de red Hostap para configurar un Access point en la placa Raspberry Pi. Para ello, se debe instalar el paquete de instalación Hostap siguiendo parte de la guía dada en [Hostap Installation](https://raspberrypi-guide.github.io/networking/create-wireless-access-point). Para la configuración se emplearán las especificaciones en la Tabla a continuación:

| Parámetro                                    | Descripción        |
|----------------------------------------------|--------------------|
| Interfaz                                     | Wlan0              |
| Service Set Identifier (SSID)                | RPI-DOCKER         |
| Estándar WiFi                                | IEEE 802.11n       |
| Canal                                        | 4 (2427 MHz)       |
| Red oculta                                   | No                 |
| Encriptación                                 | WPA                |
| Algoritmo de autenticación                   | WPA2               |
| Password WPA                                 | 1234567890         |
| Tipo de Autenticación                        | WPA-PSK            |
| Cifrado entre access point y dispositivos    | CCMP               |
| Cifrado entre dispositivos                   | CCMP               |

El procedimiento realizado se muestra en [Intalación y Configuración de Hostap](https://github.com/AndresYE/Network_Service_on_Containers/blob/6b12f1d63b81de2bce23cdd342b0e84be72f3497/Implementation_steps/Hostapd/README.md)


## **Servicios interferentes:** 
- Configuración de servicios interferentes asociados a servicios contenerizados, como son: DHCPCD, DNSMASQ, HTTPD. Esto se lo realiza para evitar interferencia de los servicios contenerizados con los servicios del host.Para ello, se emplea  los comandos de la Tabla a continuación, para detener, deshabilitar y verificar cada uno de los servicios que generen interferencia con los servicios contenerizados.

| Comando                                | Descripción                                           |
|---------------------------------------|-------------------------------------------------------|
| sudo netstat -tulnp                   | Mostrar los servicios y los puertos asociados.       |
| systemctl list-unit-files --type=service | Ver servicios ejecutados actualmente en el host.     |
| systemctl status service_name         | Muestra el estado del servicio.                       |
| systemctl stop service_name           | Detiene la ejecución del servicio.                    |
| systemctl disable service_name        | Deshabilita la ejecución del servicio al inicio.      |

El Procedemientos se describen en [Configuración de Servicios Interferentes](https://github.com/AndresYE/Network_Service_on_Containers/blob/c830396d7b75f31b365c386a5a2d68b509f10a54/Implementation_steps/Configuracion_Servicios_Interferentes/README.md).

**NOTA: Una vez desactivado el servicio DHCPCD se perdera la conexión obtenida de la red local conecta mediante Wlan y cualquier conexión que proporcione direccionamiento mediante DHCP, por lo que se debe configurar previamente la interfaz "eth0" en el archivo "/etc/network/interfaces" para perder el acceso al dispositivo.** 
# Implementación Individual
### Topología
La topología para implementación Individual y Conjunto mediante Docker CLI:
![Figura 2 13](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/2eb564ed-30d2-4953-a3a2-b7ad96e34c54)

Para esta primera fase, se implementará cada uno de los servicios de red de manera individual, mediante una imagen diseñada con un fichero Dockerfile, disponibles en [Docker CLI](https://github.com/AndresYE/Network_Service_on_Containers/tree/389fd8478edf6c580d836344d4b710d70477a052/Docker/Docker%20CLI).


# Pruebas Individuales

Las pruebas se las realiza considerando la topología de la Figura XXX y las herramientas descritas en la Tabla XXX. Donde cada uno de los clientes analizará el tráfico mediante la herramienta de software Wireshark. Además, en cada uno de los clientes se verificará el servicio red obtenido mediante una aplicación respectiva. A continuación, se describe el procedimiento para las pruebas.

## Pruebas de Funcionamiento

Para las pruebas de funcionamiento de cada uno de los servicios contenerizados se empleará una aplicación para obtener el recurso que cada servicio proporciona.

- **Servicio DHCP:** Verificación de direccionamiento dinámico a través de la terminal de los clientes, mediante el comando "ipconfig /all" para mostrar todas las configuraciones de red del cliente.

- **Servicio DNS:** Verificación de traducción de direcciones IP a domain names y viceversa a través de la terminal de los clientes, mediante el comando "nslookup IP_address|domain_name".

- **Servicio FTP:** Prueba de downlink y uplink de ficheros del servidor FTP, a través de la aplicación Firezilla.

- **Servicio Web:** Obtención de una página web del servidor Nginx contenerizado, a través de la aplicación de un navegador web, como puede ser Google Chrome o Firefox.

- **Servidor VoIP:** Pruebas de llamadas VoIP, a través de la aplicación móvil Liphone/Sip para realizar las llamadas de VoIP, donde se verificará la conexión al servidor y entre las extensiones configuradas.

## Pruebas de Performance

- **Pruebas de Conexión:**
Antes de llevar a cabo las pruebas de los otros servicios, se ejecuta una prueba de conexión hacia las direcciones asignadas a estos servidores. Esto se realiza una vez que se ha obtenido una dirección IPv4 del servicio DHCP para cada uno de los clientes Ethernet, como Wlan.

- Las pruebas de conexión para cada uno de los clientes se las realizarán mediante un ping desde la terminal de consola de los clientes, hacia las direcciones IP configuradas para cada uno de los servicios DHCP, DNS, FTP, Web y VoIP; de acuerdo con la tabla de direccionamiento de la Tabla XXX.

- **Pruebas de tráfico:** Mediante la herramienta Wireshark se realizará la captura de tráfico de los distintos servicios en la interfaz física conectada. Después, se realizará un filtrado para cada uno de los servicios, mediante la opción de filter de Wireshark. Las instrucciones empleadas para el filtrado de cada uno de los servicios se describen en la Tabla a continuación:

| Servicio    | Instrucción de filtrado  | Descripción                                       |
|-------------|--------------------------|---------------------------------------------------|
| DHCP        | dhcp                     | Filtrado de todo el tráfico dhcp.                 |
| DNS         | dns                      | Filtrado de todo el tráfico dns.                  |
| FTP         | ftp                      | Filtrado de todo el tráfico ftp.                  |
| HTTP        | http                     | Filtrado de todo el tráfico http.                 |

Adicionalmente, el an\'{a}lisis del tr\'{a}fico SIP proporciona una visi\'{o}n detallada de las llamadas efectuadas entre los clientes SIP. Esta informaci\'{o}n incluye aspectos como la direcci\'{o}n IP de origen de la llamada, las extensiones SIP del remitente y el destinatario, el protocolo empleado, la duraci\'{o}n de la llamada, la cantidad de paquetes enviados, el estado de la llamada y los mensajes SIP intercambiados con el servidor VoIP.
Tambi\'{e}n, con el an\'{a}lisis del tr\'{a}fico RTP se obtiene informaci\'{o}n adicional del QoS del servicio de VoIP
- **Pruebas de uso de recursos:** En el lado del host de los servidores, se emplearán las herramientas de monitoreo de recursos mediante Htop, docker stats y nmap, para monitorear los parámetros anteriormente descritos respectivamente.

Los resultados de las pruebas de cada uno de los servicios se analizan en el Capítulo III.
Para llevar a cabo un an\'{a}lisis espec\'{i}fico de los servicios contenidos en los contenedores, inicialmente se utiliza la herramienta "docker stats" para exponer las estad\'{i}sticas de uso generales de los contenedores Docker. Estos datos pueden ser cotejados adem\'{a}s con la herramienta "htop", que proporciona una visi\'{o}n global de las estad\'{i}sticas de uso del sistema.

# Implementación Docker Compose
### Topología
La topología para implementación Conjunta mediante Docker Compose:
![Figura 2 13](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/2eb564ed-30d2-4953-a3a2-b7ad96e34c54)


Una vez finalizada la fase de implementación individual, se procede al despliegue conjunto con Docker Compose. La construcción del fichero yaml que se encuentra disponible en [Docker Compose](https://github.com/AndresYE/Network_Service_on_Containers/tree/389fd8478edf6c580d836344d4b710d70477a052/Docker/Docker%20Compose) para la placa Raspberry Pi I [Archivo YAML RAPI I](https://github.com/AndresYE/Network_Service_on_Containers/tree/2370223085448122eaf9eafcdb2d4bace25d4175/Docker/Docker%20Compose/RPI%20I) y para la placa Raspberry Pi II[Archivo YAML RAPI II](https://github.com/AndresYE/Network_Service_on_Containers/tree/2370223085448122eaf9eafcdb2d4bace25d4175/Docker/Docker%20Compose/RPI%20II), junto con los archivos asociados para el despligue. 


# Pruebas Conjuntas

Para las pruebas conjuntas se empleará el mismo procedimiento de las pruebas individuales. Los resultados de las implementaciones en conjunto se analizan en el Capítulo III.
Para el an\'{a}lisis de los servicios desplegados mediante Docker Compose, se consideran los mismos par\'{a}metros que en el despliegue individual. En este contexto, se tiene en cuenta la topolog\'{i}a ilustrada en la Figura \ref{fig:Figura 2.12}


Para los resulados de funcionamiento de los servicios desplegados mediante Docker Compose, se exponen los resultados obtenidos por parte del cliente remoto, cliente 1, que establece conexiones con el Host RPI I. Estas conexiones se realizan a trav\'{e}s de los servicios de DHCP y enrutamiento desplegados mediante Docker Compose. E

Para los resulados de funcionamiento de los servicios desplegados mediante Docker Compose, se exponen los resultados obtenidos por parte del cliente remoto, cliente 1, despues de establecer conexión con el Host RPI I mediante OSPF para acceder a los servicios contenerizados. Estas conexiones se realizan a trav\'{e}s de los servicios de DHCP y enrutamiento desplegados mediante Docker Compose. En esta secci\'{o}n, se pone especial \'{e}nfasis en los resultados obtenidos para los servicios contenidos de DHCP, DNS, VoIP y enrutamiento. Cabe mencionar que los resultados para los servicios de FTP y HTTP son similares a los obtenidos previamente. A continuaci\'{o}n, se presentan los resultados detallados.
Como se puede apreciar, ambos hosts pertenecen a subredes diferentes. En detalle, el cliente 1 est\'{a} situado en la subred 192.168.5.0/24 desempe\~{n}a el papel de cliente remoto para el host RPI 2, . Por otro lado, el cliente 2 tiene la tarea de supervisar las pruebas y est\'{a} ubicado en el host RPI 1, dentro de la subred 192.168.2.0/24.


Antes de avanzar con las pruebas de los otros servicios contenidos en los contenedores, se ejecuta una evaluación de conexión hacia la red externa. Este procedimiento se realiza después de obtener una dirección IPv4 a través del servicio DHCP y de haber establecido la adyacencia OSPF en la red.

