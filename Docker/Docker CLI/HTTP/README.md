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
| /var/log/nginx/error.log            | Archivo de registro de errores de Nginx. Registra mensajes de error y eventos relacionados con el funcionamiento de Nginx. Es útil para la solución de problemas y diagnóstico de errores. |
| /var/run/nginx.pid                  | Archivo que almacena el PID (identificador de proceso) del proceso principal de Nginx. Se utiliza para controlar y administrar el servidor Nginx. |
| /etc/nginx/conf.d/                  | Directorio que contiene archivos de configuración adicionales para Nginx. Se utiliza comúnmente para separar la configuración en archivos individuales para facilitar la gestión y la organización. |
| /etc/nginx/vconf.d/                 | Directorio que almacena configuraciones de sitios virtuales para Nginx. Los archivos aquí pueden definir configuraciones específicas para diferentes sitios web alojados en el servidor. |
| /var/log/nginx/access.log           | Archivo de registro de acceso de Nginx. Registra solicitudes HTTP recibidas por el servidor, incluyendo detalles como las direcciones IP de los clientes, las páginas solicitadas y los códigos de respuesta. |
| /etc/nginx/default.d/               | Directorio que contiene configuraciones adicionales para la configuración global de Nginx. Similar a /etc/nginx/conf.d/, se utiliza para organizar y gestionar configuraciones adicionales. |
| /usr/share/nginx/html/www.TIC2023.com | Directorio que almacena los archivos y recursos estáticos del sitio web "www.TIC2023.com" servido por Nginx. |
| /var/log/nginx/www.TIC2023.com-access.log | Archivo de registro de acceso específico para el sitio web "www.TIC2023.com". Registra las solicitudes y accesos a este sitio en particular. |
| /var/log/nginx/www.TIC2023.com-error.log | Archivo de registro de errores específico para el sitio web "www.TIC2023.com". Registra errores relacionados con este sitio en particular. |
| /usr/share/nginx/html/web1.TIC2023.com | Directorio que almacena los archivos y recursos estáticos del sitio web "web1.TIC2023.com" servido por Nginx. |
| /var/log/nginx/web1.TIC2023.com-access.log | Archivo de registro de acceso específico para el sitio web "web1.TIC2023.com". Registra las solicitudes y accesos a este sitio en particular. |
| /var/log/nginx/web1.TIC2023.com-error.log | Archivo de registro de errores específico para el sitio web "web1.TIC2023.com". Registra errores relacionados con este sitio en particular. |
| /usr/share/nginx/html/web2.TIC2023.com    | Directorio que almacena los archivos y recursos estáticos del sitio web "web2.TIC2023.com" servido por Nginx. |
| /var/log/nginx/web2.TIC2023.com-access.log | Archivo de registro de acceso específico para el sitio web "web2.TIC2023.com". Registra las solicitudes y accesos a este sitio en particular. |
| /var/log/nginx/web2.TIC2023.com-error.log  | Archivo de registro de errores específico para el sitio web "web2.TIC2023.com". Registra errores relacionados con este sitio en particular. |

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
