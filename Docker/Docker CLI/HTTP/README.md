# NGINX

![NGINX](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/2fae52ce-51fa-4b69-ad75-2114d4b0debb)

NGINX es un servidor web y proxy inverso de código abierto conocido por su alto rendimiento, escalabilidad y capacidad de manejar una carga significativa de tráfico web. Es ampliamente utilizado en la industria para alojar sitios web y aplicaciones web de alto tráfico.

## Archivos Principales de NGINX

A continuación se muestra una tabla que describe los archivos principales utilizados en NGINX:

| Archivo             | Descripción                                                     |
|---------------------|-----------------------------------------------------------------|
| nginx.conf          | Archivo de configuración principal de NGINX                      |
| mime.types          | Archivo que mapea las extensiones de archivo a los tipos MIME    |
| fastcgi_params      | Archivo de configuración para los parámetros de FastCGI          |
| proxy_params        | Archivo de configuración para los parámetros del proxy           |
| ssl_certificate    | Certificado SSL utilizado para habilitar el cifrado HTTPS        |
| ssl_certificate_key | Clave privada correspondiente al certificado SSL                 |
| sites-available    | Directorio que contiene los archivos de configuración de sitios disponibles |
| sites-enabled      | Directorio que contiene los enlaces simbólicos a los sitios activos |
| conf.d              | Directorio utilizado para almacenar archivos de configuración adicionales |

# Docker Http

## Instrucciones de Uso

A continuación se detallan los pasos para construir la imagen y ejecutar los contenedores Docker para http:
1. **Construye la imagen**:
```shell
docker build -t andresye/nginx .
```
# NGINX
1. **Crear Named Volumes**:
Volumen para logs del servicio HTTP (nginx.log):
 ```shell
docker volume create http_logs_volumen
```
2. **Ejecuta el contenedor**:
```shell
docker run --restart=always -dit --net=host -v ./html/:/usr/share/nginx/html/ -v http_logs_volumen:/var/log/nginx/ --name http_server andresye/nginx
```
