
En el presente apartado se describe el procedimiento para la implementación de servicios de red mediante contenedores. A continuación se enlistan los pasos correspondientes.

# Preconfiguraciones

## **Instalación Raspberry OS:**
- Como primer paso se instalará el sistema operativo Raspberry OS en la placa de desarrollo Raspberry Pi 4B, en base a los pasos descritos en [Raspberry Pi Documentation](https://www.raspberrypi.com/documentation/computers/getting-started.html#installing-the-operating-system). La configuración se realizará para un sistema operativo basado en Debian 11 Bullseye arquitectura ARM de 32bits sin interfaz gráfica "RASPBERRY PI OS LITE (32-BIT)". Además, se configurará la red Wifi local y SSH, para realizar las configuraciones de manera remota. El procedimiento realizado se muestra en [Instalación de Raspberry OS](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/Instalacion_Raspberry_Pi_OS.md)

## **Instalación Docker y Docker Compose:** 
- Como segundo paso se instala el paquete de software Docker y sus herramientas asociadas, como Docker Compose. Para lo cual, se toma en cuenta la arquitectura y distribución de Raspberry OS dentro de la página de "Plataformas Soportadas" de Docker en [Instalación Docker](https://docs.docker.com/engine/install/). Luego, se procede a la instalación de Docker para la distribución Debian 11 Bullseye descrita en [Docker Instalación Docker para Debian](https://docs.docker.com/engine/install/debian/). Posterior a ello, se instala el complemento para el despliegue multicontenedor sobre Docker Compose, como se describe en [Instalación Docker Compose](https://docs.docker.com/compose/install/linux/). El procedimiento realizado se muestra en [Instalación de Docker para Debian](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/Instalacion_Docker.md).

## **Configuración de Interfaces de Red y Direccionamiento:**
- **Adaptadores USB-Ethernet:** Para agregar las interfaces de red (adaptadores USB-Ethernet) a la placa Raspberry Pi y asociar las interfaces  a un nombre especifico de interfaz mediante la MAC, se emplea la solución descrita en [Asociación de Nombre de Interfaz de red a adaptador USB-Ethernet](https://unix.stackexchange.com/questions/388300/udev-does-not-rename-usb-ethernet-device). Donde se describe la configuración mediante el fichero del sistema: "/etc/udev/rules.d/99-com.rules". El procedimiento realizado se muestra en [Configuración de Adaptadores Ethernet](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/Configuracion_Adaptadores_Ethernet.md), donde se adjunta los archivos de configuración para las dos placas Raspberry Pi.

- **Interfaces de Red Virtuales:** Para implementar interfaces virtuales se configuran mediante "alias" de la interfaz "wlan0", mediante el fichero "/etc/network/interfaces", de acuerdo a la solución presentada en [Interfaces Virtuales](https://forums.raspberrypi.com/viewtopic.php?t=154471).

**NOTA:  Esta configuración aplica unicamente para la placa Raspberry Pi RPI-I, donde se realiza el despliegue de los servicios contenerizados.**

- **Direccionamiento:** El direccionamiento empleado será de tipo estático y dinámico, el cual se configura mediante el fichero "/etc/network/interfaces". Las direcciones IP estáticas, que son asociadas a las interfaces virtuales previamente configuradas, son las que se emplean para los servicios contenerizados. Por otro lado, el direccionamiento IP dinámico empleado para conectarse a la red local, se emplea para la configuración del equipo.
El direccionamiento IPv4 para la placa Raspberry Pi RPI I se presenta en la siguiente tabla:

| Servicios de Red                | Interfaz | Dirección IPv4/Máscara |
|---------------------------------|----------|------------------------|
| SSH \| Hostap \| DHFP I         | Wlan0    | 192.168.0.1/24          |
| SSH \| DNS                       | Wlan0:1  | 192.168.0.2/24         | 
| SSH \| FTP                       | Wlan0:3  | 192.168.0.4/24         |
| SSH \| HTTP                      | Wlan0:4  | 192.168.0.5/24         | 
| SSH \| VoIP                      | Wlan0:5  | 192.168.0.6/24         | 
| SSH \| Rpi-Monitor               | Wlan0:6  | 192.168.0.7/24         |
| SSH                             | Eth0     | (Cliente DHCP)         | 
| SSH \| Routing \| DHCP II        | Eth1     | 192.168.1.1/24         | 
| SSH \| Routing \| DHCP III       | Eth2     | 192.168.2.1/24         | 
| SSH \| Routing                   | Eth3     | 10.0.1.1/30            | 

El direccionamiento IPv4 para la placa Raspberry Pi RPI II se presenta en la siguiente tabla:
| Servicios de Red        | Interfaz | Dirección IPv4/Máscara |
|-------------------------|----------|------------------------|
| SSH                     | Eth0     | (Cliente DHCP)         | 
| SSH \| Routing \| DHCP I | Eth1     | 192.168.1.1/24         |
| SSH \| Routing \| DHCP II | Eth2     | 192.168.2.1/24         | 
| SSH \| Routing           | Eth3     | 10.0.1.2/30            | 

El procedimiento realizado para la placa RPI-I  y para la placa RPI-I se muestra en [Direccionamiento](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/Direccionamiento.md).

## **Instalación y Configuración de Servicios asociados:** 
### **HOSTAPD**
- Instalación y configuración del driver de red Hostap para configurar un Access point en la placa Raspberry Pi. Para ello, se debe instalar el paquete de instalación Hostap siguiendo parte de la guía dada en [Instalación Hostap](https://raspberrypi-guide.github.io/networking/create-wireless-access-point). Para la configuración se emplearán las especificaciones en la tabla descrita a continuación:

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

El procedimiento realizado se muestra en [Instalación y Configuración de Hostap](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/Hostapd.md).

## **Instalación y Configuración de software de Monitoreo**
### **HTOP**
- Instalación y configuración del software de monitoreo para sistemas Linux HTOP. Para ello, se debe instalar el paquete de instalación Hostap siguiendo la guía dada en [Instalación HTOP](). El procedimiento realizado se muestra en [Instalación y Configuración de HTOP](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/HTOP.md).
### **RPI-MONITOR**
- Instalación y configuración del software de monitoreo de placas Raspberry Pi RPI-MONITOR. Para ello, se debe instalar el paquete de instalación Rpi-Monitor siguiendo la guía dada en [Instalación RPI-MONITOR Oficial](https://xavierberger.github.io/RPi-Monitor-docs/11_installation.html) o en la guía [Instalación RPI-MONITOR](https://rivas.cloud/2022/11/20/instalar-rpi-monitor-en-nuestra-raspberry/). El procedimiento realizado se muestra en [Instalación y Configuración de RPI-MONITOR](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/Rpi-Monitor.md).

## **Servicios interferentes:** 
- Configuración y detención de servicios asociados a los servicios contenerizados que pueden generar interferencia, como son: DHCPCD, DNSMASQ y HTTPD. Esto se lo realiza para evitar interferencia de los servicios contenerizados con los servicios del host. Para ello, se emplea  los comandos de la tabla a continuación, para detener, deshabilitar y verificar cada uno de los servicios interferentes. En la tabla que se muestra a continuación, se describen algunos de los comandos se emplean para este proceso.

| Comando                                | Descripción                                           |
|---------------------------------------|-------------------------------------------------------|
| sudo netstat -tulnp                   | Mostrar los servicios y los puertos asociados.       |
| systemctl list-unit-files --type=service | Ver servicios ejecutados actualmente en el host.     |
| systemctl status service_name         | Muestra el estado del servicio.                       |
| systemctl stop service_name           | Detiene la ejecución del servicio.                    |
| systemctl disable service_name        | Deshabilita la ejecución del servicio al inicio.      |

El Procedimientos realizado se describen en [Configuración de Servicios Interferentes](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/Configuracion_Servicios_Interferentes.md). 

**NOTA: Una vez desactivado el servicio DHCPCD se perderá la conexión obtenida de la red local conecta mediante Wlan y cualquier conexión que proporcione direccionamiento mediante DHCP, por lo que se debe configurar previamente la interfaz "eth0" en el archivo "/etc/network/interfaces" para perder el acceso al dispositivo.**

# Implementación Individual

La topología para la implementación Individual se muestra en la siguiente figura, donde se muestra la distribución lógica de los contenedores en la placa Raspberry PI.

![Prototipo_I](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/15c8e671-6d8f-49fc-9e2c-8c5e85983492)


Para esta primera fase, se implementa cada uno de los servicios de red de manera individual mediante el diseño de un fichero Dockerfile y el depliegue usando Docker CLI. Los archivos Dockerfile y los comandos para cada uno de los servicios se encuentran entran en el siguiente apartado [Ficheros Dockerfile](https://github.com/AndresYE/Network_Service_on_Containers/tree/main/Docker/Docker%20CLI).

# Implementación Conjunta mediante Docker CLI

La topología para la implementación mediante Docker CLI se muestra en la siguiente figura, donde se muestra la conexión de los clientes 1, 2 y 3 a la placa Raspberry PI - RPI-I.

![Topologia_I](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/1bddef91-c0bf-4a6d-8c36-285ea3b1eedc)


El procedimiento realizado se muestra en [Implementación Docker CLI](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/Implementacion_Docker_CLI.md)
## Pruebas de Funcionamiento

Una vez realizada la implementación y antes de realizar las pruebas de funcionamiento, se debe iniciar la captura de Wireshark en cada uno de los clientes. Esto para monitorear el tráfico de red capturado durante todo el proceso de las pruebas:

1. Ejecutar Wireshark en cada uno de los clientes.
Captura de tráfico de servicios contenerizados mediante la herramienta Wireshark.
2. Seleccionar la interfaz de captura de tráfico conectadas a las interfaces del servidor "eth1", "eth2" y "wlan0" respectivas.
3. Conectar el equipo del cliente mediante un cable Ethernet de 1metro de longitud, a cada uno de los puertos que están dispuestos para el servicio DHCP, dispuestos en la Topología I estos son: "eth1" y "eth2"
4. Conectar el equipo del cliente mediante conexión WiFi al Access Point configurado en el equipo RPI-I, tomando en cuenta el SSID de la red configurados y la contraseña de acceso a la red. Este procedimiento se lo realiza a 1 metro de  distancia entre el cliente y el equipo host RPI-I.

**NOTA: Una vez finalizada las pruebas de funcionamiento, finalizar la captura del tráfico.**


### Servicio DHCP

Verificar la información de red obtenida mediante el comando:

 ```shell
ipconfig /all
```

### Pruebas de Conexión

Verificar la conexión de los clientes con las direcciones IP asociadas a los servidores contenerizados, mediante el comando "ping".
  
```shell
ping ns1.tic2023.com
ping dhcp.tic2023.com
ping ftp.tic2023.com
ping www.tic2023.com
ping web1.tic2023.com
ping web2.tic2023.com
ping voip.tic2023.com
ping monitor.tic2023.com
```

### Servicio DNS

1. Verificar la traducción de direcciones IP a domain names y viceversa, mediante el comando "nslookup".
   
```shell
nslookup ns1.tic2023.com
nslookup dhcp.tic2023.com
nslookup ftp.tic2023.com
nslookup www.tic2023.com
nslookup web1.tic2023.com
nslookup web2.tic2023.com
nslookup voip.tic2023.com
nslookup monitor.tic2023.com
```

2. Verificar la traducción de direcciones IP a domain names, mediante el comando "nslookup".

```shell
nslookup 192.168.0.2
nslookup 192.168.0.3
nslookup 192.168.0.4
nslookup 192.168.0.5
nslookup 192.168.0.6
nslookup 192.168.0.7
```

### Servicio FTP
Prueba de Downlink del fichero del servidor FTP contenerizado, a través de la aplicación Firezilla.

1. Ingresar mediante las credenciales creadas en el archivo Dockerfile, estas son:
  - **Dirección IP | Nombre de Dominio del servidor:** 192.168.0.4 | ftp.tic2023.com
  - **Usuario:** admin
  - **Contraseña:** admin 
2. Descargar el fichero "Admin.txt" al almacenamiento local.
3. Cerrar sesión FTP.
4. Repetir los pasos 1 al 3.

**NOTA:** Realizar más de una prueba de transferencia FTP, para verificar el servicio.

### Servicio Web
Obtener una página web del servidor Nginx contenerizado, a través de la aplicación de un navegador web, como puede ser Google Chrome o Firefox.

1. Ingresar mediante el navegador web a la dirección del servidor web por defecto "www.tic2023.com".
2. Ingresar mediante el navegador web a la dirección del primer servidor web virtual "web1.tic2023.com".
3. Ingresar mediante el navegador web a la dirección del segundo servidor web virtual "web2.tic2023.com".

- **Servidor VoIP:** Pruebas de llamadas VoIP, a través de la aplicación de escritorio Liphone para realizar las llamadas de VoIP entre dos clientes VoIP/SIP.
  
1. Descargar la aplicación de escritorio de la página oficial de Liphone [Aplicación de Escritorio Windows](https://www.linphone.org/)
2. Ingresar a la aplicación.
3. Seleccionar configurar cuenta SIP.
4. Agregar información de las 2 cuentas Sip configuradas:

**Cliente 1:**
  - **Usuario:** 2001
  - **Dirección  Servidor SIP:** voip.tic2023.com
  - **Contraseña:** TIC2023
  - **Tipo de Trasporte:** UDP

**Cliente 2:**
  - **Usuario:** 2002
  - **Dirección Servidor SIP:** voip.tic2023.com
  - **Contraseña:** TIC2023
  - **Tipo de Trasporte:** UDP
  
6. Verificar la conexión de la extensión al servidor Voip.
7. Realizar una llamada entre la extensión del cliente 1 "2001" a la extensión del cliente 2 "2002".
8. Terminar la llamada
9. Realizar una llamada entre la la extensión del cliente 2 "2002" a la extensión del cliente 1 "2001".
10. Terminar la llamada
11. Repetir los pasos 6 al 9, 3 veces.

**NOTA:** Realizar más de una prueba de llamadas VoIP, para verificar el servicio.

## Pruebas de Rendimiento

### Análisis de tráfico
1. Filtrar la información de red obtenida por cada uno de los clientes, mediante el servicio relacionado. Esto se realiza mediante la opción de "filter" de Wireshark, se emplea los siguientes comandos de filtrado para obtener información de cada uno de los servicios DHCP, DNS, FTP y HTTP.

| Servicio    | Instrucción de filtrado                     | Descripción                                       |
|-------------|---------------------------------------------|---------------------------------------------------|
| DHCP        | `dhcp`                                      | Filtrado de todo el tráfico dhcp.                 |
| DNS         | `dns`                                       | Filtrado de todo el todo el tráfico dns.          |
| FTP         | `ftp`                                       | Filtrado de todo el tráfico ftp.                  |
| HTTP        | `http`                                      | Filtrado de todo el tráfico http.                 |

-**NOTA: Para filtrar el tráfico específico generado por las pruebas emplear el siguiente comando.***

```shell
dns.qry.name == "2.0.168.192.in-addr.arpa" || dns.qry.name == "3.0.168.192.in-addr.arpa" || dns.qry.name == "4.0.168.192.in-addr.arpa" || dns.qry.name == "5.0.168.192.in-addr.arpa" || dns.qry.name == "6.0.168.192.in-addr.arpa" || dns.qry.name == "7.0.168.192.in-addr.arpa" || dns.qry.name == "ns1.tic2023.com" || dns.qry.name == "dhcp.tic2023.com" || dns.qry.name == "ftp.tic2023.com" || dns.qry.name == "www.tic2023.com" || dns.qry.name == "web1.tic2023.com" || dns.qry.name == "web2.tic2023.com" || dns.qry.name == "voip.tic2023.com" || dns.qry.name == "monitor.tic2023.com"
```

2. Obtener información del tráfico SIP y RTP del servicio de VoIP, empleando la herramienta "Telephony" para obtener información de las llamadas VoIP realizadas mediante la opción "VoIP calls" e información RTP de las llamadas mediante la opción "RTP>RTP Secuency". A través de estas opciones se obtiene la siguiente información:
   
-**VoIP calls:**
- **Dirección IP de Origen:** La dirección IP desde la cual se origina la llamada.
- **Extensiones SIP:** Las extensiones SIP del remitente y el destinatario de la llamada.
- **Protocolo Empleado:** El protocolo utilizado para la llamada SIP.
- **Duración de la Llamada:** El tiempo que duró la llamada.
- **Cantidad de Paquetes Enviados:** La cantidad de paquetes de datos enviados durante la llamada.
- **Estado de la Llamada:** El estado de la llamada (por ejemplo, completada, fallida, etc.).
- **Mensajes SIP:** Los mensajes SIP intercambiados con el servidor VoIP.

-**RTP Secuency:**
- **Dirección IP de Origen**: La dirección IP de origen de la llamada.
- **Pérdidas de Paquete**: La cantidad de paquetes de audio perdidos durante la transmisión.
- **Retardos**: El tiempo de retardo experimentado durante la transmisión de audio.
- **Jitter**: La variabilidad en el retardo de la transmisión.

### Análisis de uso de recursos:

Obtener datos de uso de recursos de CPU, memoria, tráfico y almacenamiento, mediante las herramientas de monitoreo de recursos Htop, docker stats y RPI-Monitor.
1. Conectar vía SSH al cliente 3 (monitor) con el servidor RPI-I, mediante 2 terminales a través de la aplicación "Putty".
2. Iniciar sesión como super usuario "sudo".
3. Ejecutar las aplicaciones "HTOP" y "docker stats"
   
**NOTA: El análisis mediante HTOP y Docker Stats debe ser permanente para obtener los datos de los servicios al momento de ejecutarse las pruebas. Esto debido a que los datos obtenidos en las pruebas no pueden ser exportados.**

#### HTOP
  
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
| VoIP        |          `asterisk`      | Filtrado de todos los procesos de asterisk.       |
| Routing     |          `frr`           | Filtrado de todos los procesos de Frrouting.      |

3. Revisar la variación de las estadísticas de uso de los procesos.

#### Docker Stats

1. Abrir en una terminal SSH la aplicación Docker Stats mediante el comando:

```shell
docker stats
```
2. Revisar la variación de las estadísticas de uso de los contenedores.

#### RPI-Monitor

1. Ingresar a la dirección "monitor.tic2023.com:8888" a través de un navegar web.
2. Ingresar a las estadísticas de uso seleccionando la pestaña "Stadistics" de la pagina web.
3. Seleccionar el recurso del host a analizar: Load CPU Average, Memory Usage y Temperature.
4. Seleccionar el periodo de tiempo de análisis.

**NOTA: Emplear el periodo de 24horas, el cual permite visualizar el rango de 24 horas con muestras de 1segundo a 10segundos.**  

# Implementación Conjunta mediante Docker Compose

La topología para implementación Conjunta mediante Docker Compose se muestra en la siguiente figura, donde se muestra la conexión de los clientes 1 y 2 a las placas Raspberry PI RPI-I y RPI-II.

![topologia_II](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/6bc74fe0-dc4f-45a3-baff-5da842ec05ea)


Para esta fase, se implementan los servicios de red mediante el diseño de un fichero "YAML" y ejecutados mediante Docker Compose para cada una de las dos placas Raspberry Pi. Los ficheros se encuentran en el apartado de [Docker Compose]() para la placa Raspberry Pi I [Archivo YAML RAPI I]() y para la placa Raspberry Pi II[Archivo YAML RAPI II](), junto con los archivos asociados para el despliegue. 
El procedimiento realizado para la placa RPI-I y RPI-II se muestra en [Implementación Conjunta Docker Compose RPI-I](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/Implementacion_Docker_Compose_RPI_I.md) y [Implementación Conjunta Docker Compose RPI-II](https://github.com/AndresYE/Network_Service_on_Containers/blob/main/Steps/Implementacion_Docker_Compose_RPI_II.md) respectivamente.

## Pruebas de Funcionamiento

Una vez realizada la implementación y antes de realizar las pruebas de funcionamiento, se debe iniciar la captura de Wireshark en cada uno de los clientes. Esto para monitorear el tráfico de red capturado durante todo el proceso de las pruebas:

1. Ejecutar Wireshark en cada uno de los clientes.
Captura de tráfico de servicios contenerizados mediante la herramienta Wireshark.
2. Seleccionar la interfaz de captura de tráfico conectadas a las interfaces del servidor "eth1", "eth2" y "wlan0" respectivas.
3. Conectar el equipo del cliente mediante un cable Ethernet de 1 metro de longitud, a cada uno de los puertos que están dispuestos para el servicio DHCP, dispuestos en la Topología I estos son: "eth1" y "eth2"
4. Conectar las placas RPI-I y RPI-II mediante el cable Ethernet de 2 metros de longitud, entre los puerto "eth3".  

Para las pruebas de funcionamiento se emplea los mismos procedimientos que en la prueba anterior. Sin embargo, para las pruebas de conexión se agrega una prueba de extremo a extremo entre el cliente 1 y el cliente 2. También se realiza el trazado de la ruta entre clientes. Por otro lado, para las pruebas de enrutamiento se revisa las tablas de enrutamiento generadas por los contenedores de Routing.

### Pruebas de Conexión

1. Verificar la conexión entre los clientes mediante "ping" a la dirección IPv4 obtenida del direccionamiento DHCP.
   
- **Conexión desde el Cliente 1 al Cliente 2**
```shell
ping ip_address_cliente_2
```

- **Conexión desde el Cliente 2 al Cliente 1**
```shell
ping ip_address_cliente_1
```
2. Verificar el trazado de la ruta seguida por los clientes en la red.

- **Trazado de la ruta desde el Cliente 1 al Cliente 2**
```shell
tracert ip_address_cliente_2
```

- **Trazado de la ruta desde el Cliente 2 al Cliente 1**
```shell
tracert ip_address_cliente_1
```

### Pruebas de Enrutamiento

Verificar el enrutamiento entre los equipos RPI I y RPI II.

1. Ingresar al router contenerizado mediante el comando:
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
