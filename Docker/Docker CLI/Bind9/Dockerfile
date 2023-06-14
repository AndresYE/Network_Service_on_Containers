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
# 			                  Archivo: Dockerfile - Configuración Dockerfile para servicio DNS                                  #
#                                                                        							                            #
# 							                                Versión: 1.0                                    			        #  
#                                                                        							                            #
# 						                            Fecha de Creación: 01/07/2023                                          		#
#                                                                        							                            #
#################################################################################################################################
################################## Configuraciones Dockerfile ##################################
################################################################################################

################################################################################################
#####################################  Imagen Base ############################################# 
################################################################################################
# El servidor DNS se implementa sobre la imagen base Alpine Linux versión 3.11.
FROM alpine:3.11
################################################################################################
########################################### Etiqueta ###########################################
################################################################################################
LABEL authors="Yazán Endara Andrés Lenin" 
LABEL build-date="01/07/2023"
LABEL version="1.0"
LABEL description="Servidor DNS(Bind9) sobre Contenedor Docker"
################################################################################################
################################ Instalación de dependencias ###################################
################################################################################################
#Actualizamos el repositorio de Alpine mediante apk update.
#Instalamos el servidor dns mediante apk add bind.
#Instalamos herramientas dns mediante apk add bind-tools.
#Instalamos bash en Alpine Linux mediante apk add bash.
RUN apk update; apk add bind; apk add bind-tools; apk add bash
################################################################################################
##################################### Variables de Entorno #####################################
################################################################################################
#################### Variable de entorno para establecer zona horaria ##########################
ENV TZ UTC 
################### Variables de Entorno para comando de Ejecución DNS ########################
# Variable de entorno para establecer Archivo de configuración DNS.
    # Opciones:
        # Archivo de configuración BIND (Default):    /etc/bind/named.conf
ENV DNS_CONF_FILE /etc/bind/named.conf
# Variable de entorno para establecer Nombre de archivo de configuración DNS.
    # Opciones:
        # Modo DNS para IPv4 (Default):    4
        # Modo DNS para IPv6:              6
ENV DNS_MOD 4
# Variable de entorno para puerto de escucha de peticiones.
    # Opciones:
        # Puerto udp DNS para IPv4 (Default) :    53/udp
        # Puerto udp DNS para IPv6 :    
ENV DNS_PORT 53
################################################################################################
############################## Archivos de Configuración #######################################
################################################################################################
############################### Archivos de configuración BIND ################################
# Creación de carpeta "/var/lib/bind" para el almacenamiento de las zonas DNS.
RUN mkdir /var/lib/bind
# Copiar archivo de Zonas Directas a la ruta del contenedor "/var/lib/bind".
COPY TIC2023.com.db /etc/bind/
# Copiar archivo de Zonas Inversas a la ruta del contenedor "/var/lib/bind".
COPY 0.168.192.rev /etc/bind/
# Cambio a propietario root de carpeta "/var/lib/bind".
RUN chown -R root:root /var/lib/bind
# Cambio de permisos de carpeta "/var/lib/bind".
RUN chmod 0700 /var/lib/bind

# Creación de carpeta de registros "/var/log/bind" para el almacenamiento de los registros Bind.
RUN mkdir /var/log/bind
#Creación de archivo de registro de bind "named.log".
RUN touch /var/log/bind/named.log
# Cambio de permisos de carpeta de registros "/var/log/bind".
RUN chown -R root:root /var/log/bind
# Cambio a propietario root de carpeta de registros "/var/log/bind".
RUN chmod -R 0700 /var/log/bind

# Creación de carpeta "/var/cache/bind" para el almacenamiento de datos en caché de consultas DNS.
RUN mkdir /var/cache/bind
# Cambio de permisos de carpeta "/var/cache/bind".
RUN chown -R root:root /var/cache/bind
# Cambio a propietario root de carpeta "/var/cache/bind".
RUN chmod -R 0700 /var/cache/bind

# Copiar archivo de configuracipon bind "named.conf" a la ruta del contenedor "/etc/bind/".
COPY named.conf /etc/bind/
# Cambio a propietario root de archivo de carpeta "/etc/bind/".
RUN chown -R root:root /etc/bind/
# Cambio de permisos de carpeta "/var/lib/bind".
RUN chmod -R 0700 /etc/bind/
################################################################################################
################################### Directorio de Trabajo ######################################
################################################################################################
#Establecemos el directorio de trabajo en el direcotrio raiz "/".
WORKDIR ./
################################################################################################
#################################### EXPONER PUERTOS ###########################################
################################################################################################
# Exponemos los puertos requeridos para las respuestas del servidor dns.
EXPOSE 53/tcp 53/udp
################################################################################################
####################################### ENTRYPOINT #############################################
################################################################################################
## Comando de Ejecución
# Configuramos comandos para el despligue del servicio named en el contenedor.
    #Ejecutar servicio named:
        #/usr/sbin/named
    # Opciones de Ejecución:
        #-4: DNS con direccionamiento IPv4.
        #-6: DNS con direccionamiento IPv6.
        #-c: Archivo de configuración DNS alternativo (named.conf).
        #-d: Modo Depuración.
        #-f: Ejcutar named como Proceso de Primer plano (Foreground) (Background Default).
        #-g: Forzar ejecución en primer plano.
        #-p: Puerto UDP DNS (53/udp Default).
    # Opiciones adicionales:
        #-E Uso de Criptografía OpenSSL.
        #-m: uso de memoria.
        #-s: Estadisticas de uso de memoria en stdout.
        #-t: encerrar directorio mediante chroot.
        #-u:  Colocar UID para completar procesos privilegiados.
ENTRYPOINT /usr/sbin/named -$DNS_MOD  -c $DNS_CONF_FILE -f -g -p $DNS_PORT
