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
# 			                        Archivo: Dockerfile - Configuración Dockerfile para servicio HTTP                           #
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
# El servicio de nginx se implementara sobre una imagen base Nginx basada en Alpine Linux
FROM nginx:1.22.1-alpine
################################################################################################
########################################### Etiqueta ###########################################
################################################################################################
LABEL authors="Yazán Endara Andrés Lenin" 
LABEL build-date="01/07/2023"
LABEL version="1.0"
LABEL description="Servidor WEB(Nginx) sobre Contenedor Docker"
################################################################################################
############################## Archivos de Configuración #######################################
################################################################################################
############################### Archivos de configuración NGINX ################################
# Copiar archivo de configuración "nginx.conf" a la ruta del contenedor "/etc/nginx/nginx.conf".
COPY nginx.conf ./etc/nginx/nginx.conf
#Copiar carpeta  de configuraciones de sitios de servidores virtuales.
COPY vconf.d ./etc/nginx/vconf.d

#Copiar carpeta de paginas HTML de servidor Nginx y servidores virtuales web1 y web2
COPY html ./usr/share/nginx/html
# Cambio a propietario root de carpeta compartida de Nginx "/usr/share/nginx"
RUN chown -R root:root /usr/share/nginx
# Cambio de permisos de carpeta compartida de Nginx "/usr/share/nginx"
RUN chmod -R 0755 /usr/share/nginx

#Copiar archivos de registros de nginx
COPY logs ./var/log/nginx
# Cambio a propietario nginx de carpeta de registros de Nginx "/var/log/nginx"
RUN chown -R nginx:nginx /var/log/nginx
# Cambio de permisos de carpeta de registros de Nginx "/var/log/nginx"
RUN chmod -R 0755 /var/log/nginx
################################################################################################
################################### Directorio de Trabajo ######################################
################################################################################################
#Establecemos el directorio de trabajo en el direcotrio raiz "/"
WORKDIR ./
################################################################################################
#################################### EXPONER PUERTOS ###########################################
################################################################################################
# Exponemos los puertos requeridos para las respuestas del servidor nginx
EXPOSE 80/tcp 80/udp 443/tcp 443/udp 
################################################################################################
####################################### ENTRYPOINT #############################################
################################################################################################
## Comando de Ejecución Nginx 
ENTRYPOINT nginx -c /etc/nginx/nginx.conf -g "daemon off;"
