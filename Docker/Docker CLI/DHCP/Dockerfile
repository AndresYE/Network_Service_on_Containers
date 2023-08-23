#################################################################################################################################
#                                                                        							                            #
#						                        Servicios basados en Contenedores     	                                        #
#                                                                        							                            #
#################################################################################################################################
#					                        Universidad: Escuela Politécnica Nacional						                    #
#	                                    															                            #
#                                                                        							                            #
# 						                        Autor: Andrés Lenin Yazán Endara                                 		        #
#                                                                        							                            #
# 			                  Archivo: Dockerfile - Configuración Dockerfile para servicio DHCP                                  #
#                                                                        							                            #
# 							                                Versión: 1.0                                    			        #  
#                                                                        							                            #
# 						                            Fecha de Creación: 01/07/2023                                          		#
#                                                                        							                            #
#################################################################################################################################
################################################################################################
################################## Configuraciones Dockerfile ##################################
################################################################################################

################################################################################################
#####################################  Imagen Base ############################################# 
################################################################################################
# El servidor DHCP se implementa sobre la imagen base Alpine Linux versión 3.11
FROM alpine:3.11
################################################################################################
#####################################  Etiquetas de Imagen #####################################
################################################################################################
LABEL authors="Yazán Endara Andrés Lenin" 
LABEL build-date="01/07/2023"
LABEL version="1.0"
LABEL description="Servidor DHCP ISC sobre Contenedor Docker"
################################################################################################
################################ Instalación de dependencias ###################################
################################################################################################
# Actualización del repositorio de Alpine:  apk update
# Instalación del servidor dhcp:            apk add dhcp
# Instalar paquete envsubst para manejar variables de entorno
RUN apk update; apk add dhcp; apk add gettext
################################################################################################
##################################### Variables de Entorno #####################################
################################################################################################
################################# Variables de Entorno Generales ###############################
# Variable de entorno para establecer modo de servidor:
    # Opciones:
        # Modo Autoritario (Default):   authoritative 
        # Modo No Autoritario:          not authoritative
ENV NON_AUTHORITATIVE=authoritative
# Variable de entorno para establecer modo de Actualización DNS.
    # Opciones:
        # Estilo de sincronización (Default):   interim
ENV DNS_UPDATE_STYLE=interim
# Variable de entorno para establecer Tiempo mínimo de arrendamiento (seg).
ENV MIN_LEASE_TIME=60
# Variable de entorno para establecer Tiempo máximo de arrendamiento (seg).
ENV MAX_LEASE_TIME=3600
# Variable de entorno para establecer Tiempo por defecto de arrendamiento (seg).
ENV DEFAULT_LEASE_TIME=120

#################### Variables de Entorno para Direccionamiento DHCPv4 #########################
# Variable de entorno para establecer subred IPv4.
ENV IPV4_SUBNET=192.168.0.0
# Variable de entorno para establecer mascara de red IPv4.
ENV IPV4_NETMASK=255.255.255.0
# Variable de entorno para establecer dirección IPv4  mínima de asigación.
ENV MIN_IPV4_ADDRESS=192.168.0.10
# Variable de entorno para establecer dirección IPv4 máxima de asigación.
ENV MAX_IPV4_ADDRESS=192.168.0.254
# Variable de entorno para establecer dirección IPv4 de servidores DNS.
ENV DOMAIN_NAMES_SERVER_IPV4=192.168.0.2
# Variable de entorno para establecer dirección IPv4 de gateway.
ENV IPV4_GATEWAY=192.168.0.1
# Variable de entorno para establecer mascara de subred de gateway.
ENV IPV4_GATEWAY_MASK 255.255.255.0

#################### Variables de Entorno para Direccionamiento DHCPv6 #########################
# Variable de entorno para establecer subred y mascara IPv6.
ENV IPV6_SUBNET=2001:db8:0:1::/64
# Variable de entorno para establecer dirección IPv6  mínima de asigación.
ENV MIN_IPV6_ADDRESS=2001:db8:0:1::10
# Variable de entorno para establecer dirección IPv6 máxima de asigación.
ENV MAX_IPV6_ADDRESS=2001:db8:0:1::254
# Variable de entorno para establecer dirección IPv6 de servidores DNS.
ENV DOMAIN_NAMES_SERVER_IPV6=2001:4860:4860::8888
# Variable de entorno para establecer dirección IPv6 de gateway.
ENV IPV6_GATEWAY=2001:db8:0:1::1

#################### Variables de Entorno para comando de Ejecución DHCP #########################
# Variable de entorno para establecer Archivo de configuración DHCP.
    # Opciones:
        # Archivo de configuración DHCPv4 (Default):    /etc/dhcp/dhcpd.conf
        # Archivo de configuración DHCPv6:              /etc/dhcp/dhcpd6.conf
ENV DHCP_CONF_FILE /etc/dhcp/dhcpd.conf
# Variable de entorno para establecer Archivo de Arrendamiento DHCP.
    # Opciones:
        # Archivo de Arrendamiento  DHCPv4 (Default):    /var/lib/dhcp/dhcpd.leases
ENV DHCP_LEASES_FILE /var/lib/dhcp/dhcpd.leases
# Variable de entorno para establecer Nombre de archivo de Configuración DHCP.
    # Opciones:
        # Modo DHCPv4 (Default):    4
        # Modo DHCPv6:              6
ENV DHCP_MOD 4
# Variable de entorno para interfaz de escucha de peticiones.
ENV IFDHCP  ''
# Variable de entorno para puerto de escucha de peticiones IPv4.
    # Opciones:
        # Puerto udp DHCPv4 (Default) :    67/udp
ENV IPV4_DHCP_PORT 67
# Variable de entorno para puerto de escucha de peticiones IPv6.
    # Opciones:
        # Puerto udp DHCPv6 (Default):     547/udp
ENV IPV6_DHCP_PORT 547
# Variable de entorno para definir usuario DHCP
    # Opciones:
        # Usuario DHCP (Default):   root
ENV DHCP_USER root
# Variable de entorno para definir grupo DHCP
    # Opciones:
        # GrupoDHCP (Default):  root
ENV DHCP_GROUP root

################################################################################################
############################## Archivos de Configuración #######################################
################################################################################################
############################### Archivos de configuración DHCPD ################################
## Copiar archivo de configuración DHCPv4 a carpeta "/etc/dhcp/".
COPY dhcpd.env.conf  /etc/dhcp/
## Copiar archivo de configuración DHCPv6 a carpeta "/etc/dhcp/".
COPY dhcpd6.env.conf /etc/dhcp/
# Creación de archivo de arrendamientos DHCP "dhcpd.leases".
RUN touch /var/lib/dhcp/dhcpd.leases
# Cambio a propietario root de archivo de arrendamientos DHCP "dhcpd.leases".
RUN chown -R root:root /var/lib/dhcp/dhcpd.leases
#################### Archivo .sh para configuración de servicio DHCP #################### 
# Copiar archivo .sh para la ejecución del servicio DHCP.
COPY run-dhcpd.sh ./usr/sbin/
# Cambio de permisos de ejecución de archivo de cofiguración .sh.
RUN chmod +x ./usr/sbin/run-dhcpd.sh 
# Cambio a propietario root de archivo .sh.
RUN chown root:root ./usr/sbin/run-dhcpd.sh 
################################################################################################
################################### Directorio de Trabajo ######################################
################################################################################################
#Establecer el directorio de trabajo en el direcotrio raiz "/".
WORKDIR ./
################################################################################################
#################################### EXPONER PUERTOS ###########################################
################################################################################################
## Puertos de Escucha de Contenedor
# Establecer los puertos de Escucha requeridos para las respuestas y solicitudes de del servidor dhcpv4 y dhcpv6.
    # Puertos DHCPv4 servidor-cliente: 67/udp 
    # Puertos DHCPv6 servidor-cliente: 547/udp
EXPOSE ${IPV4_DHCP_PORT}/udp  ${IPV6_DHCP_PORT}/udp
################################################################################################
####################################### ENTRYPOINT #############################################
################################################################################################
# Ejecución de archivo sh para ejecuación del servicio DHCP.
ENTRYPOINT /bin/sh /usr/sbin/run-dhcpd.sh 
