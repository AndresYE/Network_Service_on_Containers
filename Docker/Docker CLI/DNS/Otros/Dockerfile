################################# Escuela Politécnica Nacional #################################
#######################  Tema: Servicios de Red Basado en Contenedores #########################
# Autor: Andrés Lenin Yazán Endara 
# Servicio: DNS
# Archivo: Dockerfile 
################################## Configuraciones Dockerfile ##################################
## Imagen Base
# El servidor DNS se implementa sobre la imagen base Alpine Linux versión 3.11
FROM alpine:3.11

#####################################   Etiqueta ##################################### 
LABEL authors="Yazán Endara Andrés Lenin" 
LABEL build-date="13/03/2023"
LABEL version="1.0"
LABEL description="Servidor DNS(Bind9) sobre Contenedor Docker"

##################################### Instalación de dependencias #####################################
#Actualizamos el repositorio de Alpine mediante apk update
#Instalamos el servidor dns mediante apk add bind
#Instalamos herramientas dns mediante apk add bind-tools
#Instalamos bash en Alpine Linux mediante apk add bash
RUN apk update; apk add bind; apk add bind-tools; apk add bash

##################################### Variables de Entorno #####################################
# Variable de entorno para establecer zona horaria
ENV TZ UTC 

####################################### Crear Archivos de Configuración #######################################
##Carpetas  bind
# Creación carpeta /var/lib/bind
RUN mkdir /var/lib/bind
#Permisos Carpeta Lib
RUN chown -R root:root /var/lib/bind
RUN chmod 0755 /var/lib/bind

# Creación carpeta /var/log/bind
RUN mkdir /var/log/bind
#Creación de archvio log
RUN touch /var/log/bind/named.log
#Permisos carpeta log
RUN chown -R root:root /var/log/bind
RUN chmod -R 0700 /var/log/bind

# Creación carpeta /var/cache/bindd
RUN mkdir /var/cache/bind
#Permisos carpeta cache
RUN chown -R root:root /var/cache/bind
RUN chmod -R 0700 /var/cache/bind

####################################### Archivos de Configuración #######################################
# Copiar archivo named.conf
COPY ./etc/bind/named.conf /etc/bind/
# Copiar archivo Zone
COPY ./etc/bind/TIC2023.com.db /etc/bind/
# Copiar archivo Reverse Zone
COPY ./etc/bind/0.168.192.rev /etc/bind/
# Cambio a propietario root de archivo de configuración:   named.conf
RUN chown -R root:root /etc/bind/
RUN chmod -R 0700 /etc/bind/

## Directorio de Trabajo
#Establecemos el directorio de trabajo en el direcotrio raiz /
WORKDIR ./

######################################## EXPONER PUERTOS ##############################################
# Exponemos los puertos requeridos para las respuestas del servidor dns
EXPOSE 53/tcp 53/udp
#################### Variables de Entorno para comando de Ejecución DHCP #########################
# Variable de entorno para establecer Archivo de configuración DHCP
    # Opciones:
        # Archivo de configuración DHCPv4 (Default):    /etc/dhcp/dhcpd.conf
        # Archivo de configuración DHCPv6:              /etc/dhcp/dhcpd6.conf
ENV DNS_CONF_FILE /etc/bind/named.conf
# Variable de entorno para establecer Nombre de archivo de Configuración DHCP
    # Opciones:
        # Modo DNS para IPv4 (Default):    4
        # Modo DNS para IPv6:              6
ENV DNS_MOD 4
# Variable de entorno para puerto de escucha de peticiones
    # Opciones:
        # Puerto udp DNS para IPv4 (Default) :    53
        # Puerto udp DNS para IPv6 :    
ENV DNS_PORT 53
########################################  ENTRYPOINT ######################################## 
## Comando de Ejecución
# Configuramos comandos para el despligue del servicio dhcpd en el contenedor
    #Ejecutar servicio named
        #/usr/sbin/named

    # Opciones de Ejecución:
        #-4: DNS con direccionamiento IPv4
        #-6: DNS con direccionamiento IPv6
        #-c: Archivo de configuración DNS alternativo (named.conf)
        #-d: Modo Depuración
        #-E Uso de Criptografía OpenSSL 
        #-f: Ejcutar named como Proceso de Primer plano (Foreground) (Background Default)
        #-g: Forzar ejecución en primer plano
        #-m: uso de memoria
        #-p: Puerto UDP DNS (53/udp Default)
        #-s: Estadisticas de uso de memoria en stdout
        #-t: encerrar directorio mediante chroot
        #-u:  Colocar UID para completar procesos privilegiados

ENTRYPOINT /usr/sbin/named -$DNS_MOD  -c $DNS_CONF_FILE -f -g -p $DNS_PORT


