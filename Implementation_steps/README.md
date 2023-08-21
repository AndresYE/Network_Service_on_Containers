En el presente apartado se describe el procedimiento para la implementación de servicios de red mediante contenedores. A continuación se enlistan los pasos correspondientes.

## Preconfiguraciones

- **Instalación Raspberry OS:** Como primer paso se instalará el sistema operativo Raspberry OS en la placa de desarrollo Raspberry Pi 4B, en base a los pasos descritos en [Raspberry Pi Documentation](https://www.raspberrypi.com/documentation/computers/getting-started.html#installing-the-operating-system). La configuración se realizará para un sistema operativo basado en Debian 11 Bullseye arquitectura ARM de 32bits sin interfaz gráfica "RASPBERRY PI OS LITE (32-BIT)". Además, se configurará la red Wifi local y SSH, para realizar las configuraciones de manera remota. Las configuraciones realizada se muestra en .

- **Instalación Docker y Docker Compose:** Como segundo paso se instala el paquete de software Docker y sus herramientas asociadas, como Docker Compose. Para lo cual, se toma en cuenta la arquitectura y distribución de Raspberry OS dentro de la página de "Plataformas Soportadas" de Docker en [Docker Installation](URL). Luego, se procede a la instalación de Docker para la distribución Debian 11 Bullseye descrita en [Docker Installation for Debian](URL). Posterior a ello, se instala el complemento para el despliegue Multicontenedor sobre Docker Compose, como se describe en [Docker Compose Installation](URL).

- **Servicios asociados:** Instalación y configuración del driver de red Hostap para configurar un Access point en la placa Raspberry Pi. Para ello, se debe instalar el paquete de instalación Hostap siguiendo parte de las guías dadas en [Gentoo Hostap](URL) y [Hostap Installation](URL). Para la configuración se emplearán las especificaciones en la Tabla a continuación:

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

- **Direccionamiento:** Configuración de direccionamiento estático mediante fichero "/etc/network/interfaces", para asociar los servicios contenerizados a una dirección IP de escucha, de acuerdo a la topología de la Figura XXX y la Tabla a continuación:

| Servicio    | Dirección IP  |
|-------------|---------------|
| Servicio 1  | xxx.xxx.xxx.1 |
| Servicio 2  | xxx.xxx.xxx.2 |
| Servicio 3  | xxx.xxx.xxx.3 |
| ...         | ...           |

- **Servicios interferentes:** Configuración de servicios interferentes asociados a servicios contenerizados, establecidos en la Tabla a continuación. Esto se lo realiza para evitar interferencia de los servicios contenerizados con los servicios del host. Para ello, mediante la shell de Raspian OS se emplea los comandos de la Tabla a continuación, los cuales se deben emplearse para detener, deshabilitar y verificar cada uno de los servicios que generen interferencia en los servicios contenerizados.

| Comando                                | Descripción                                           |
|---------------------------------------|-------------------------------------------------------|
| sudo netstat -tulnp                   | Mostrar los servicios y los puertos asociados.       |
| systemctl list-unit-files --type=service | Ver servicios ejecutados actualmente en el host.     |
| systemctl status service_name         | Muestra el estado del servicio.                       |
| systemctl stop service_name           | Detiene la ejecución del servicio.                    |
| systemctl disable service_name        | Deshabilita la ejecución del servicio al inicio.      |

## Implementación Individual Dockerfile

Para esta primera fase, se implementará cada uno de los servicios de red de manera individual, mediante una imagen diseñada con un fichero Dockerfile, basadas en la Tabla XXX y posterior a ello se ejecutará el contenedor para cada servicio mediante Docker CLI de la Tabla XXX.

El fichero Dockerfile diseñado para cada uno de los servicios (DHCP, DNS, FTP, Web, VoIP y routing), se encuentran en el repositorio público de GitHub del [Anexo I](URL) donde se describe más a detalle cada una de las líneas de los ficheros. Además, de la descripción de cada uno de los servicios contenerizados, implementaciones y archivos de configuración asociados que se emplean en la implementación.

Como siguiente paso se realiza el despliegue de los contenedores Docker mediante Docker CLI, de acuerdo con los comandos de las Tablas a continuación:

| Comando Docker CLI                      | Descripción                                  |
|----------------------------------------|----------------------------------------------|
| docker run -d --name container_name    | Descripción del comando                      |
| ...                                    | ...                                          |

## Pruebas Individuales

Las pruebas se las realiza considerando la topología de la Figura XXX y las herramientas descritas en la Tabla XXX. Donde cada uno de los clientes analizará el tráfico mediante la herramienta de software Wireshark. Además, en cada uno de los clientes se verificará el servicio red obtenido mediante una aplicación respectiva. A continuación, se describe el procedimiento para las pruebas.

### Pruebas de Funcionamiento

Para las pruebas de funcionamiento de cada uno de los servicios contenerizados se empleará una aplicación para obtener el recurso que cada servicio proporciona.

- **Servicio DHCP:** Verificación de direccionamiento dinámico a través de la terminal de los clientes, mediante el comando "ipconfig /all" para mostrar todas las configuraciones de red del cliente.

- **Servicio DNS:** Verificación de traducción de direcciones IP a domain names y viceversa a través de la terminal de los clientes, mediante el comando "nslookup IP_address|domain_name".

- **Servicio FTP:** Prueba de downlink y uplink de ficheros del servidor FTP, a través de la aplicación Firezilla.

- **Servicio Web:** Obtención de una página web del servidor Nginx contenerizado, a través de la aplicación de un navegador web, como puede ser Google Chrome o Firefox.

- **Servidor VoIP:** Pruebas de llamadas VoIP, a través de la aplicación móvil Liphone/Sip para realizar las llamadas de VoIP, donde se verificará la conexión al servidor y entre las extensiones configuradas.

### Pruebas de Performance

- **Pruebas de Conexión:** Las pruebas de conexión para cada uno de los clientes se las realizarán mediante un ping desde la terminal de consola de los clientes, hacia las direcciones IP configuradas para cada uno de los servicios DHCP, DNS, FTP, Web y VoIP; de acuerdo con la tabla de direccionamiento de la Tabla XXX.

- **Pruebas de tráfico:** Mediante la herramienta Wireshark se realizará la captura de tráfico de los distintos servicios en la interfaz física conectada. Después, se realizará un filtrado para cada uno de los servicios, mediante la opción de filter de Wireshark. Las instrucciones empleadas para el filtrado de cada uno de los servicios se describen en la Tabla a continuación:

| Servicio    | Instrucción de filtrado  | Descripción                                       |
|-------------|--------------------------|---------------------------------------------------|
| DHCP        | dhcp                     | Filtrado de todo el tráfico dhcp.                 |
| DNS         | dns                      | Filtrado de todo el tráfico dns.                  |
| FTP         | ftp                      | Filtrado de todo el tráfico ftp.                  |
| HTTP        | http                     | Filtrado de todo el tráfico http.                 |

- **Pruebas de uso de recursos:** En el lado del host de los servidores, se emplearán las herramientas de monitoreo de recursos mediante Htop, docker stats y nmap, para monitorear los parámetros anteriormente descritos respectivamente.

Los resultados de las pruebas de cada uno de los servicios se analizan en el Capítulo III.

## Implementación Docker Compose

Una vez finalizada la fase de implementación individual, se procede al despliegue conjunto con Docker Compose. La construcción del fichero yaml se la realiza en base a la Tabla XXX y XXX.

Para la ejecución de los servicios mediante Docker Compose se emplean los comandos descritos en la Tabla a continuación:

| Comando Docker Compose                  | Descripción                                  |
|----------------------------------------|----------------------------------------------|
| docker-compose up -d                   | Descripción del comando                      |
| ...                                    | ...                                          |

## Pruebas Conjuntas

Para las pruebas conjuntas se empleará el mismo procedimiento de las pruebas individuales. Los resultados de las implementaciones en conjunto se analizan en el Capítulo III.
