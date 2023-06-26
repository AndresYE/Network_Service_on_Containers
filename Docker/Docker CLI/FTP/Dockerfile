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
# 			                        Archivo: Dockerfile - Configuración Dockerfile para servicio FTP                            #
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
# El servidor FTP se implementa sobre la imagen base Alpine Linux versión 3.11
FROM alpine:3.11
################################################################################################
########################################### Etiqueta ###########################################
################################################################################################
LABEL authors="Yazán Endara Andrés Lenin" 
LABEL build-date="01/07/2023"
LABEL version="1.0"
LABEL description="Servidor FTP(vsftpd) sobre Contenedor Docker"
################################################################################################
################################ Instalación de dependencias ###################################
################################################################################################
#Actualizamos el repositorio de Alpine mediante apk update
#Instalamos el servidor ftp mediante apk add vsftpd
RUN apk update; apk add vsftpd

################################################################################################
##################################### Variables de Entorno #####################################
################################################################################################
############################# Variables de Entorno para servicio FTP ###########################
# Variable de entorno para establecer Archivo de configuración FTP
    # Opciones:
        # Archivo de configuración FTP (defualt):                       /etc/vsftpd/vsftpd.conf
ENV FTP_CONF_FILE /etc/vsftpd/vsftpd.conf
# Variable de entorno para establecer Archivo de Registro FTP Xferlog
    # Opciones:
        # Archivo de configuración FTP (defualt):    /var/log/vsftpd/xferlog
ENV FTP_XLOG_FILE /var/log/vsftpd/xferlog
# Variable de entorno para establecer Archivo de Registro FTP Xferlog
    # Opciones:
        # Archivo de configuración FTP (defualt):    /var/log/vsftpd/vsftpd.log
ENV FTP_LOG_FILE /var/log/vsftpd/vsftpd.log

#################### Variables de Entorno para Usuario Local Admin #########################
# Variable de Entorno para Ruta de carpera Chroot para usuarios anónimos
ENV FTP_LOCAL_USER_PATH /usr/vsftpd/Anon-Public
# Variable de Entorno para nombre de Usuario Administrador
ENV FTP_ADMIN_USER_NAME admin
# Variable de Entorno para password de Usuario Administrador
ENV FTP_ADMIN_USER_PASS admin

#################### Variables de Entorno para Usuario Local #########################
# Variable de Entorno para grupo de Usuario Local
ENV FTP_LOCAL_USER_GROUP    users
# Variable de Entorno para nombre de Usuario Local
ENV FTP_LOCAL_USER_NAME     user1
# Variable de Entorno para password de Usuario Local
ENV FTP_LOCAL_USER_PASSW    pass

######################### Configuración Usuarios Virtuales ##################################
##Configuración Usuarios Virtuales
# Variable de Entorno para grupo de Usuario Virtual
ENV FTP_VUSER_GROUP     vsftp
# Variable de Entorno para nombre de Usuario Virtual
ENV FTP_VUSER_NAME      vsftp
# Variable de Entorno para password de Usuario Virtual
ENV FTP_VUSER_PASSW     vpass

################################################################################################
############################## Archivos de Configuración #######################################
################################################################################################
# Copiar archivo vsftpd.conf
COPY ./vsftpd.conf /etc/vsftpd/
#######################################  Archivos de Registro ####################################### 
# Crear Carpeta vsftpd
RUN mkdir /var/log/vsftpd
# Crear archivo  de registros FTP xferlog
RUN touch ${FTP_XLOG_FILE}
# Crear archivo  de registros FTP vsftpd.log
RUN touch ${FTP_LOG_FILE}
# Cambio a propietario ftp de carpeta de registros de FTP "/var/log/vsftpd/"
RUN chown -R ftp:ftp /var/log/vsftpd/
# Cambio de permisos de registros de FTP "/var/log/vsftpd/"
RUN chmod -R 777 /var/log/vsftpd/
#####################################################################################################
###################################### Usuarios Anónimos  ###########################################
#####################################################################################################
#################### Variables de Entorno Generales para Usuario Anónimo #########################
# Variable de Entorno para Ruta de carpera Chroot para usuarios anónimos
ENV ANON_USER_PATH /usr/vsftpd/Anon-Public
######################### Configuración Usuarios Anónimos ##############################
# Crear carpeta Chroot para usuarios anónimos.
RUN mkdir -p "/usr/vsftpd/"
# Crear carpeta compartida para usuarios anónimos.
RUN mkdir -p ${ANON_USER_PATH}
# Copiar archivos a compartir para carpera de usuarios anónimos.
COPY ./Anon.txt .${ANON_USER_PATH}
# Cambio a propietario nobody de carpeta Chroot para usuarios anónimos.
RUN chown -R nobody:nogroup "/usr/vsftpd"
# Cambio de permisos de carpeta Chroot para usuarios anónimos.
RUN chmod -R 777 "${ANON_USER_PATH}"
####################################################################################################
###################################### Usuarios Locales ############################################
####################################################################################################
############################## Configuración Usuarios Locales-Administrador ###########################
# Configuración Usuarios Admin
# Crear carpeta para usuario local Admin
RUN mkdir -p /home/${FTP_ADMIN_USER_NAME}
# Copiar Archivos a compartir de usuario local Admin
COPY ./Admin.txt ./home/${FTP_ADMIN_USER_NAME}
# Agregar directorio de usuario Admin.
RUN adduser -h /home/${FTP_ADMIN_USER_NAME} -s "/sbin/nologin" -D ${FTP_ADMIN_USER_NAME}
# Agregar usuario y contraseña en el sistema.
RUN echo "${FTP_ADMIN_USER_NAME}:${FTP_ADMIN_USER_PASS}" | /usr/sbin/chpasswd
# Agregar usuario a grupo root en el sistema.
RUN adduser ${FTP_ADMIN_USER_NAME} root
# Cambio a propietario root de carpeta Chroot para usuario Admin.
RUN chown -R root:root "/home/${FTP_ADMIN_USER_NAME}"
# Cambio de permisos de carpeta Chroot para usuario Admin.
RUN chmod -R 777 /home/${FTP_ADMIN_USER_NAME}

############################## Configuración Usuarios Locales ###########################
# Carpeta usuario local
RUN mkdir -p /home/${FTP_LOCAL_USER_NAME}
## Copiar Archivos a compartir de usuario local
COPY ./User.txt ./home/${FTP_LOCAL_USER_NAME} 
# Agregar directorio de usuario local.
RUN adduser -h /home/${FTP_LOCAL_USER_NAME} -s "/sbin/nologin" -D ${FTP_LOCAL_USER_NAME}
# Agregar usuario y contraseña en el sistema.
RUN echo "${FTP_LOCAL_USER_NAME}:${FTP_LOCAL_USER_PASSW}" | /usr/sbin/chpasswd
# Agregar usuario a grupo GROUP
RUN adduser ${FTP_LOCAL_USER_NAME} ${FTP_LOCAL_USER_GROUP}
# Cambio a propietario localuser de carpeta Chroot para usuario local.
RUN chown -R ${FTP_LOCAL_USER_NAME}:${FTP_LOCAL_USER_GROUP} "/home/${FTP_LOCAL_USER_NAME}"
# Cambio de permisos de carpeta Chroot para usuario local.
RUN chmod -R 777 /home/${FTP_LOCAL_USER_NAME}

################################################################################################
################################### Directorio de Trabajo ######################################
################################################################################################
#Establecemos el directorio de trabajo en el direcotrio raiz /
WORKDIR ./
################################################################################################
#################################### EXPONER PUERTOS ###########################################
################################################################################################
# Exponemos los puertos requeridos para las respuestas del servidor ftp 
EXPOSE 20/udp 20/tcp 21/udp 21/tcp 21000-21110
################################################################################################
####################################### ENTRYPOINT #############################################
################################################################################################ 
ENTRYPOINT /usr/sbin/vsftpd ${FTP_CONF_FILE}


