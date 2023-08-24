
En el presente apartado se describe el procedimiento para la implementación de servicios de red mediante contenedores. A continuación se enlistan los pasos correspondientes.

# Preconfiguraciones

## **Instalación Raspberry OS:**
- Como primer paso se instalará el sistema operativo Raspberry OS en la placa de desarrollo Raspberry Pi 4B, en base a los pasos descritos en [Raspberry Pi Documentation](https://www.raspberrypi.com/documentation/computers/getting-started.html#installing-the-operating-system). La configuración se realizará para un sistema operativo basado en Debian 11 Bullseye arquitectura ARM de 32bits sin interfaz gráfica "RASPBERRY PI OS LITE (32-BIT)". Además, se configurará la red Wifi local y SSH, para realizar las configuraciones de manera remota. El procedimiento realizado se muestra en [Intalación de Raspberry OS](https://github.com/AndresYE/Network_Service_on_Containers/blob/195198dbbaa3d481e01358605d8de3d51a6c8db1/Implementation_steps/Instalacion_Raspberry_Pi_OS/README.md)

## **Instalación Docker y Docker Compose:** 
- Como segundo paso se instala el paquete de software Docker y sus herramientas asociadas, como Docker Compose. Para lo cual, se toma en cuenta la arquitectura y distribución de Raspberry OS dentro de la página de "Plataformas Soportadas" de Docker en [Docker Installation](https://docs.docker.com/engine/install/). Luego, se procede a la instalación de Docker para la distribución Debian 11 Bullseye descrita en [Docker Installation for Debian](https://docs.docker.com/engine/install/debian/). Posterior a ello, se instala el complemento para el despliegue multicontenedor sobre Docker Compose, como se describe en [Docker Compose Installation](https://docs.docker.com/compose/install/linux/). El procedimiento realizado se muestra en [Intalación de Docker para Debian](https://github.com/AndresYE/Network_Service_on_Containers/tree/df30bbdbaa23c1806ddec2c73ffccc4f755376c2/Implementation_steps/Instalacion_Docker).

## **Configuración de Interfaces de Red y Direccionamiento:**
- **Adaptadores USB-Ethernet:** Para agregar las interfaces de red (adaptadores USB-Ehternet) a la placa Raspberry Pi y asociar las interfaces  a un nombre especifico de interfaz mediante la MAC, se emplea la solución descrita en [Aosciación de Nombre de Interfaz de res a adaptador USB-Ethernet](https://unix.stackexchange.com/questions/388300/udev-does-not-rename-usb-ethernet-device). Donde se describe la configuración mediante el fichero del sistema: "/etc/udev/rules.d/99-com.rules". El procedimiento realizado se muestra en [Configuración de Adaptadores Ethernet](https://github.com/AndresYE/Network_Service_on_Containers/blob/2781548ff7ee316803f6cab1c4f57f9c8e0194d6/Implementation_steps/Configuracion_Adaptadores_Ethernet/README.md), donde se adjunta los archivos de configuración para las dos placas Rasperry Pi.

- **Interfaces de Red Virtuales:** Para implementar interfaces virtuales se configuran mediante "alias" de la interfaz "wlan0", mediante el fichero "/etc/network/interfaces", de acuerdo a la solucion presentada en [Interfaces Virtuales](https://forums.raspberrypi.com/viewtopic.php?t=154471).

**NOTA:  Esta configuración aplica unicamente para la placa Raspberry Pi RPI-I, donde se realiza el despligue de los servicios contenerizados.**

- **Direccionamiento:** El direccionamiento empleado sera de tipo estático y dinámico, el cual se configura mediante el fichero "/etc/network/interfaces". Las direcciones IP estáticas, que son asociadas a las interfaces virtuales previamentes configuradas, son las que se emplean para los servicios contenerizados. Por otro lado, el direccionamiento IP dinámico empleado para conectarse a la red local, se emplea para la configuración del equipo.
El direccionamiento IPv4 para la placa Raspberry Pi RPI I se presenta en la siguiente tabla:

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

El direccionamiento IPv4 para la placa Raspberry Pi RPI II se presenta en la siguiente tabla:
| Servicios de Red        | Interfaz | Dirección IPv4/Máscara | Dirección de Gateway |
|-------------------------|----------|------------------------|-----------------------|
| SSH                     | Eth0     | (Cliente DHCP)         | (Cliente DHCP)        |
| SSH \| Routing \| DHCP I | Eth1     | 192.168.1.1/24         | 192.168.1.1           |
| SSH \| Routing \| DHCP II | Eth2     | 192.168.2.1/24         | 192.168.2.1           |
| SSH \| Routing           | Eth3     | 10.0.1.2/30            | N/A                   |

El procedimiento realizado para la placa RPI-I se muestra en [Configuración Network RPI-I](https://github.com/AndresYE/Network_Service_on_Containers/tree/52dfc6fd513b5b0d6714aa753f5546fbbe14b475/Implementation_steps/Network/RPI_I) y para la placa RPI-I se muestra en [Configuración Network RPI-II](https://github.com/AndresYE/Network_Service_on_Containers/tree/52dfc6fd513b5b0d6714aa753f5546fbbe14b475/Implementation_steps/Network/RPI_II).

## **Instalación y Configuración de Servicios asociados:** 
### **HOSTAPD**
- Instalación y configuración del driver de red Hostap para configurar un Access point en la placa Raspberry Pi. Para ello, se debe instalar el paquete de instalación Hostap siguiendo parte de la guía dada en [Hostap Installation](https://raspberrypi-guide.github.io/networking/create-wireless-access-point). Para la configuración se emplearán las especificaciones en la tabla descrita a continuación:

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

El procedimiento realizado se muestra en [Intalación y Configuración de Hostap](https://github.com/AndresYE/Network_Service_on_Containers/blob/6b12f1d63b81de2bce23cdd342b0e84be72f3497/Implementation_steps/Hostapd/README.md).

## **Servicios interferentes:** 
- Configuración y detención de servicios asociados a los servicios contenerizados que pueden generar interferencia, como son: DHCPCD, DNSMASQ y HTTPD. Esto se lo realiza para evitar interferencia de los servicios contenerizados con los servicios del host. Para ello, se emplea  los comandos de la tabla a continuación, para detener, deshabilitar y verificar cada uno de los servicios interferentes. En la tabla que se muestra a continuación, se describen algunos de los comandos se emplean para este proceso.

| Comando                                | Descripción                                           |
|---------------------------------------|-------------------------------------------------------|
| sudo netstat -tulnp                   | Mostrar los servicios y los puertos asociados.       |
| systemctl list-unit-files --type=service | Ver servicios ejecutados actualmente en el host.     |
| systemctl status service_name         | Muestra el estado del servicio.                       |
| systemctl stop service_name           | Detiene la ejecución del servicio.                    |
| systemctl disable service_name        | Deshabilita la ejecución del servicio al inicio.      |

El Procedemientos se describen en [Configuración de Servicios Interferentes](https://github.com/AndresYE/Network_Service_on_Containers/blob/c830396d7b75f31b365c386a5a2d68b509f10a54/Implementation_steps/Configuracion_Servicios_Interferentes/README.md). El procedimiento realizado se muestra en [Intalación y Configuración de Hostap](https://github.com/AndresYE/Network_Service_on_Containers/blob/6b12f1d63b81de2bce23cdd342b0e84be72f3497/Implementation_steps/Hostapd/README.md).

**NOTA: Una vez desactivado el servicio DHCPCD se perdera la conexión obtenida de la red local conecta mediante Wlan y cualquier conexión que proporcione direccionamiento mediante DHCP, por lo que se debe configurar previamente la interfaz "eth0" en el archivo "/etc/network/interfaces" para perder el acceso al dispositivo.**
## **Instalación y Configuración de software de Monitoreo**
### **HTOP**
- Instalación y configuración del software de monitoreo para sistemas Linux HTOP. Para ello, se debe instalar el paquete de instalación Hostap siguiendo la guía dada en [Installation HTOP](). El procedimiento realizado se muestra en [Intalación y Configuración de HTOP]().
### **RPI-MONITOR**
- Instalación y configuración del software de monitoreo de placas Raspberry Pi RPI-MONITOR. Para ello, se debe instalar el paquete de instalación Rpi-Monitor siguiendo la guía dada en [Installation RPI-MONITOR Oficial](https://xavierberger.github.io/RPi-Monitor-docs/11_installation.html) o en la guia [Installation RPI-MONITOR](https://rivas.cloud/2022/11/20/instalar-rpi-monitor-en-nuestra-raspberry/). El procedimiento realizado se muestra en [Intalación y Configuración de RPI-MONITOR](https://github.com/AndresYE/Network_Service_on_Containers/tree/99552922048f066ddbb6ae2e3b1d7c43ad541d77/Implementation_steps/Rpi-Monitor).

# Implementación Individual
## Topología
La topología para la implementación Individual se muestra en la figura a continuación, donde se muesestra la distribución lógica de los contenedores en la placa Raspberry PI.
![Prototipo_I](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/72c7de45-2a90-4b13-aaa2-cec7a261c3de)

Para esta primera fase, se implementa cada uno de los servicios de red de manera individual mediante el diseño de un fichero Dockerfile y el depligue usando Docker CLI. Los archivos Dockerfile y los comandos para cada uno de los servicios se encuentran entran en el siguiente apartado [Ficheros Dockerfile](https://github.com/AndresYE/Network_Service_on_Containers/files/12414235/topologia_II.pdf).

# Implementación Conjunta mediante Docker CLI
## Topología
La topología para la implementación mediante Docker CLI se muestra en la figura a continuación, donde se muesestra la conexión de los clientes 1, 2 y 3 a la placa Raspberry PI - RPI-I.
![Topologia_I](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/9cf04412-7687-46f9-a52b-30fe38c5b038)

El procedimiento realizado se muestra en [Implementación Docker CLI](https://github.com/AndresYE/Network_Service_on_Containers/tree/5e599b045373ef6ae4a66fd9853b2af0836ef169/Implementation_steps/Implementacion_Docker_CLI)
## Pruebas de Funcionamiento
Para las pruebas de funcionamiento se intenta obtener el recurso que cada servicio proporciona. Esto puede ser medainte una aplicación o software específico para la mayoría de los servicios.

- **Servicio DHCP:** Verificar el direccionamiento dinámico obtenido mediante los siguientes pasos: 
Esto para mostrar todas las configuraciones de red del cliente. Mediante los 
  1. Conectar el equipo del cliente mediante un cable Ethernet de 1metro de longitud, a cada uno de los puertos que estan dispustos para el servicio DHCP, estos son: "eth1" y "eth2"
  2. Verificar la información de red obtenida mediante el comando:
 ```shell
ipconfig /all
```
  3.  Conectar el equipo del cliente mediante conexión WiFi al Access Point configurado en el equipo RPI-I, tomando en cuenta el SSID de la red configurados y la contraseña de acceso a la red. Este procedimiento se lo realiza a 1 metro de  distancia entre el cliente y el equipo host RPI-I.
  4.  Verificar la información de red obtenida mediante el comando:
 ```shell
ipconfig /all
```
- **Pruebas de Conexión:** Verificar la conexión de los clientes con los servidores contenerizados, a través de sus domain names. Emplear los siguientes comandos para cada uno de los servicios contenerizados:
  -Conexión a la interfaz del servidor DNS contenerizado:
```shell
ping ns1.tic2023.com
```
  -Conexión a la interfaz del servidor DHCP contenerizado:
```shell
ping dhcp.tic2023.com
```
  -Conexión a la interfaz del servidor FTP contenerizado:
```shell
ping ftp.tic2023.com
```
  -Conexión a la interfaz del servidor HTTP página web 1 contenerizado:
```shell
ping www.tic2023.com
```
  -Conexión a la interfaz del servidor HTTP página web 2 contenerizado:
```shell
ping web1.tic2023.com
```
  -Conexión a la interfaz del servidor HTTP página web 3 contenerizado:
```shell
ping web2.tic2023.com
```
  -Conexión a la interfaz del servidor VoIP contenerizado:
```shell
ping voip.tic2023.com
```
  -Conexión a la interfaz del servidor web del servicio de Monitoreo RPI-Monitor:
```shell
ping monitor.tic2023.com
```

- **Servicio DNS:** Verificación de traducción de direcciones IP a domain names y viceversa.
1. Verificar la traducción de domain names a direcciones IP:
  -Traducir de domain names a direcciones IP asociado al servidor DNS contenerizado:
```shell
nslookup ns1.tic2023.com
```
  -Traducir de domain names a direcciones IP asociado al servidor DHCP contenerizado:
```shell
nslookup dhcp.tic2023.com
```
  -Traducir de domain names a direcciones IP asociado al servidor FTP contenerizado:
```shell
nslookup ftp.tic2023.com
```
  -Traducir de domain names a direcciones IP asociado al servidor HTTP página web 1 contenerizado:
```shell
nslookup www.tic2023.com
```
  -Traducir de domain names a direcciones IP asociado al servidor HTTP página web 2 contenerizado:
```shell
nslookup web1.tic2023.com
```
  -Traducir de domain names a direcciones IP asociado al servidor HTTP página web 3 contenerizado:
```shell
nslookup web2.tic2023.com
```
  -Traducir de domain names a direcciones IP asociado al servidor VoIP contenerizado:
```shell
nslookup voip.tic2023.com
```
  -Traducir de domain names a direcciones IP asociado alservicio de Monitoreo RPI-Monitor:
```shell
nslookup monitor.tic2023.com
```
2. Verificar la traducción de direcciones IP a domain names:
  -Traducir de direcciones IP a domain names asociado al servidor DNS contenerizado:
```shell
nslookup 192.168.0.2
```
  -Traducir de direcciones IP a domain names asociado al servidor DHCP contenerizado:
```shell
nslookup 192.168.0.3
```
  -Traducir de direcciones IP a domain names asociado al servidor FTP contenerizado:
```shell
nslookup 192.168.0.4
```
  -Traducir de direcciones IP a domain names asociado al servidor HTTP contenerizado:
```shell
nslookup 192.168.0.5
```
  -Traducir de direcciones IP a domain names asociado al servidor VoIP contenerizado:
```shell
nslookup 192.168.0.6
```
  -Traducir de direcciones IP a domain names asociado al servicio de Monitoreo RPI-Monitor:
```shell
nslookup 192.168.0.7
```

- **Servicio FTP:** Prueba de Downlink del fichero del servidor FTP contenerizado, a través de la aplicación Firezilla.
1. Ingresar mediante las credenciales creadas en el archivo Dockerfile, estas son:
  - **Dirección IP | Nombre de Dominio del servidor:** 192.168.0.4 | ftp.tic2023.com
  - **Usuario:** admin
  - **Contraseña:** admin 
2. Descargar el fichero "Admin.txt" al almacenamiento local.
3. Cerrar sesión FTP.
4. Repetir los pasos 1 al 3.
**NOTA:** Realizar más de una prueba de transferencia FTP, para verificar el servicio.

- **Servicio Web:** Obtención de una página web del servidor Nginx contenerizado, a través de la aplicación de un navegador web, como puede ser Google Chrome o Firefox.
1. Ingresar mediante el navegador web a la dirección del servidor web por defecto "www.tic2023.com".
2. Ingresar mediante el navegador web a la dirección del primer servidor web virtual "web1.tic2023.com".
3. Ingresar mediante el navegador web a la dirección del primer servidor web virtual "web2.tic2023.com".

- **Servidor VoIP:** Pruebas de llamadas VoIP, a través de la aplicación de escritorio Liphone para realizar las llamadas de VoIP entre dos clientes VoIP/SIP.
1. Descargar la aplicación de escritorio de la página oficial de Liphone [Aplicación de Escritorio Windows](https://www.linphone.org/)
2. Ingresar a la aplicación.
3. Seleccionar configurar cuenta SIP.
4. Agrear infomación de las 2 cuentas Sip configuradas:
**Cliente 1:**
  -**Usuario:** 2001
  -**Dirección  Servidor SIP:** voip.tic2023.com
  -**Contraseña:** TIC2023
  -**Tipo de Trasporte:** UDP
**Cliente 2:**
  -**Usuario:** 2002
  -**Dirección Servidor SIP:** voip.tic2023.com
  -**Contraseña:** TIC2023
  -**Tipo de Trasporte:** UDP
5. Verificar la conexión de la extension al servidor Voip.
6. Realizar una llamada entre la la extensión del cliente 1 "2001" a la extensión del cliente 2 "2002".
7. Terminar la llamada
8. Realizar una llamada entre la la extensión del cliente 2 "2002" a la extensión del cliente 1 "2001".
9. Terminar la llamada
10. Repetir los pasos 6 al 9.
**NOTA:** Realizar más de una prueba de llamadas VoIP, para verificar el servicio.

### Pruebas de Performance
[topologia_I.pdf](https://github.com/AndresYE/Network_Service_on_Containers/files/12414234/topologia_I.pdf)
- **Pruebas de Conexión:** Verificar la el retardo de los "pings" de conexión entre los clientes con los servidores contenerizados, a través de sus domain names.
  **Análisis de tráfico:** Captura de trádico de servicios contenerizados mediante Wireshark.
Mediante la herramienta Wireshark ejecutada en cada uno de los clientes, monitorear el tráfico de red capturado durante todo el proceso de las pruebas:
1. Ejecutar Wireshark en cada uno de los clientes.
2. Seleccionar la interfaz de captura de tráfico conectadas a las interfaces del servidor "eth1", "eth2" y "wlan0" respectivas.
3. Una vez finalizada las pruebas de funcionamiento, finalizar la captura del tráfico.
4. Filtrar la información de red obtenida por cada uno de los clientes, mediante el servicio relacionado. Esto se realiza mediante la opcion de "filter" de Wireshark, se emplea los siguientes comandos de filtrado para obtener información de cada uno de los servicios.

| Servicio    | Instrucción de filtrado  | Descripción                                       |
|-------------|--------------------------|---------------------------------------------------|
| DHCP        |          `dhcp `         | Filtrado de todo el tráfico dhcp.                 |
| DNS         |           `dns`          | Filtrado de todo el todo el tráfico dns.          |
| DNS         | `dns.qry.name == "2.0.168.192.in-addr.arpa" || dns.qry.name == "3.0.168.192.in-addr.arpa" || dns.qry.name == "4.0.168.192.in-addr.arpa" || dns.qry.name == "5.0.168.192.in-addr.arpa" || dns.qry.name == "6.0.168.192.in-addr.arpa" || dns.qry.name == "7.0.168.192.in-addr.arpa" || dns.qry.name == "ns1.tic2023.com" || dns.qry.name == "dhcp.tic2023.com" || dns.qry.name == "ftp.tic2023.com" 	|| dns.qry.name == "www.tic2023.com" || dns.qry.name == "web1.tic2023.com" || dns.qry.name == "web2.tic2023.com" || dns.qry.name == "voip.tic2023.com" || dns.qry.name == "monitor.tic2023.com"` | Filtrado de tráfico dns generado.          |
| FTP         |           `ftp`          | Filtrado de todo el tráfico ftp.                  |
| HTTP        |          `http`          | Filtrado de todo el tráfico http.                 |
5. Obtener información del tráfico SIP y RTP del servicio de VoIP, empleando la herramienta "Telephony" para obtener información de las llamadas VoIP realizadas mediante la opción "VoIP calls" e información RTP de las llamadas mediante la opción "RTP>RTP Secuency". A través de estas opciones se obtiene la siguiente información:
-**VoIP calls:**
- **Dirección IP de Origen**: La dirección IP desde la cual se origina la llamada.
- **Extensiones SIP**: Las extensiones SIP del remitente y el destinatario de la llamada.
- **Protocolo Empleado**: El protocolo utilizado para la llamada SIP.
- **Duración de la Llamada**: El tiempo que duró la llamada.
- **Cantidad de Paquetes Enviados**: La cantidad de paquetes de datos enviados durante la llamada.
- **Estado de la Llamada**: El estado de la llamada (por ejemplo, ompletada, fallida, etc.).
- **Mensajes SIP**: Los mensajes SIP intercambiados con el servidor VoIP.

-**RTP Secuency:**
- **Dirección IP de Origen**: La dirección IP desde la cual ssale la llamada.
- **Pérdidas de Paquete**: La cantidad de paquetes de audio perdidos durante la transmisión.
- **Retardos**: El tiempo de retardo experimentado durante la transmisión de audio.
- **Jitter**: La variabilidad en el retardo de la transmisión.

- **Analisis de uso de recursos:** Obtención de datos de uso de recursos de CPU, memoria, tráfico y almacenamiento.
- Emplear las herramientas de monitoreo de recursos mediante Htop, docker stats y RPI-Monitor, para monitorear los parámetros de CPU, memoria y almacenamiento.
1. Conectar via SSH al cliente 3 (monitor) con el servidor RPI-I, mediante 2 terminales a través de la aplicación "Putty".
2. Logearse como super usuario "sudo".
3. Ejecutar las aplicaciones "HTOP" y "docker stats"
**NOTA: El analisis mediante HTOP y Docker Stats debe ser permanente para obtener los datos de los servicios al momento de ejcutarse las pruebas.**
- **HTOP**
1. Abrir en una terminal SSH la aplicación HTOP mediante el comando:
```shell
htop
```
2.Aplicar el filtrado de los procesos respectivos para cada uno de los servicios contenerizados, mediante la opción de "filter" de la aplicación. Los procesos de filtrados asociados se muestran a continuación.
| Servicio    | Instrucción de filtrado  | Descripción                                       |
|-------------|--------------------------|---------------------------------------------------|
| DHCP        |          `dhcpd`         | Filtrado de todos los procesos de dhcpd.          |
| DNS         |          `named`         | Filtrado de todos los procesos de bind.           |
| FTP         |          `vsftpd`        | Filtrado de todos los procesos de vsftpd.         |
| HTTP        |          `nginx`         | Filtrado de todos los procesos de nginx.          |
| VoIP        |          `Asterisk`      | Filtrado de todos los procesos de asterisk.       |
| Routing     |          `Frr`           | Filtrado de todos los procesos de Frrouting.      |
3. Revisa la variación de las estadísticas de uso de los procesos.

- **docker stats**
1. Abrir en una terminal SSH la aplicación Docker Stats mediante el comando:
```shell
docker stats
```
2. Revisar la variación de las estadísticas de uso de los contenedores.

- **RPI-Monitor** 
1. Ingresar a la dirección "monitor.tic2023.com" a través de un navegar web.
2. Ingresar a las estadísticas de uso seleccionando la pestaña "Stadistics" de la pagina web.
3. Seleccionar el recurso del host a analizar: Load CPU Average, Memory Usage y Temperature.
4. Seleccionar el periodo de tiempo de análisis.

**NOTA: Emplear el periodo de 24horas dado que permite visualizar el rango de 24 horas con muestras de 1segundo a 10segundos.**  

# Implementación Conjunta mediante Docker Compose
## Topología
La topología para implementación Conjunta mediante Docker Compose se muestra en la figura a continuación, donde se muestra la conexión de los clientes 1 y 2 a las placas Raspberry PI  RPI-I y RPI-II.
![topologia_II](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/293e3022-0146-44be-b389-1f2c1cfd9780)

Para esta fase, se implementan los servicios de red mediante el diseño de un fichero "YAML" y ejecutados mediante Docker Compose para cada una de las dos placas Raspberry Pi. Los ficheros se encuentran en el apartado de [Docker Compose](https://github.com/AndresYE/Network_Service_on_Containers/tree/33579aed3de68574530db912394c112d29c42c1b/Docker/Docker%20Compose) para la placa Raspberry Pi I [Archivo YAML RAPI I](https://github.com/AndresYE/Network_Service_on_Containers/tree/2370223085448122eaf9eafcdb2d4bace25d4175/Docker/Docker%20Compose/RPI%20I) y para la placa Raspberry Pi II[Archivo YAML RAPI II](https://github.com/AndresYE/Network_Service_on_Containers/tree/2370223085448122eaf9eafcdb2d4bace25d4175/Docker/Docker%20Compose/RPI%20II), junto con los archivos asociados para el despligue. 

https://github.com/AndresYE/Network_Service_on_Containers/tree/3531dd8c8e5e8a069560789e5d73efb856296afc/Implementation_steps/Implementacion_Docker_Compose

### Pruebas de Funcionamiento
Para las pruebas de funcionamiento se emplea los mismos procedimientos que en la prueba anterior. Sin embargo, para las pruebas de conexión se agrega una prueba para la conexión extremo a extremo entre el cliente 1 y el cliente 2. También se realiza el trazado de la ruta entre clientes. Por otro lado, para las pruebas de enrutamiento se revisa las tablas de enrutamiento generadas por los contenedores de Routing.

- **Pruebas de Conexión:** Verificar la conexión entre los clientes mediante la dirección IPv4 obtenida del direccionamiento DHCP.
1. **Conexión desde el Cliente 1 al Cliente 2**
```shell
ping ip_address_cliente_2
```

2. **Conexión desde el Cliente 2 al Cliente 1**
```shell
ping ip_address_cliente_1
```

3. **Trazado de la ruta desde el Cliente 1 al Cliente 2**
```shell
tracert ip_address_cliente_2
```

4. **Trazado de la ruta desde el Cliente 2 al Cliente 1**
```shell
tracert ip_address_cliente_1
```

- **Pruebas de Enrutamiento:** Verificar el enrutamiento entre los equipos RPI I y RPI II.
1. Ingresar al router contenerizado en el equipo RPI I mediante el comando:
```shell
docker exec -it routing_server_compose sh
```
2. Ingresar a la interfaz VTY de FRR mediante el comando:
```shell
vtysh
```
3. Mostrar la tabla de enrutamiento general.
```shell
show ip route
```
5. Mostrar la tabla de enrutamiento ospf.
```shell
show ip route ospf
```
