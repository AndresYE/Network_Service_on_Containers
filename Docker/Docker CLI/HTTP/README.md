# NGINX

![NGINX](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/2fae52ce-51fa-4b69-ad75-2114d4b0debb)

NGINX es un servidor web y proxy inverso de código abierto conocido por su alto rendimiento, escalabilidad y capacidad de manejar una carga significativa de tráfico web. Es ampliamente utilizado en la industria para alojar sitios web y aplicaciones web de alto tráfico.

## Descripción

NGINX es un servidor web ligero pero poderoso que puede actuar como un servidor web independiente o como un proxy inverso frente a otros servidores web. Es conocido por su capacidad de respuesta, eficiencia en el consumo de recursos y manejo eficiente de conexiones concurrentes.

## Características

- **Alto rendimiento**: NGINX está diseñado para manejar una gran cantidad de solicitudes concurrentes con un uso eficiente de los recursos del sistema.
- **Escalabilidad**: Puede escalarse horizontalmente agregando más instancias de NGINX y distribuyendo la carga de tráfico de manera equilibrada.
- **Proxy inverso**: NGINX puede actuar como un proxy inverso para distribuir solicitudes a servidores backend, mejorando el rendimiento y la capacidad de respuesta.
- **Balanceo de carga**: Puede realizar el equilibrio de carga entre varios servidores backend para distribuir el tráfico de manera eficiente.
- **TLS/SSL**: Soporta conexiones seguras a través de HTTPS mediante la configuración de certificados TLS/SSL.
- **Reescritura de URL**: Permite reescribir las URL de las solicitudes entrantes para redirigirlas o ajustarlas según las necesidades.
- **Cache**: Proporciona funcionalidades de almacenamiento en caché para acelerar la entrega de contenido estático y reducir la carga en los servidores backend.
- **Administración de conexiones**: Puede gestionar grandes cantidades de conexiones concurrentes con configuraciones flexibles para controlar el comportamiento y los límites.
- **Compatibilidad con módulos**: NGINX se puede extender con módulos para agregar funcionalidades adicionales según los requisitos específicos.

## Arquitectura

NGINX sigue una arquitectura de eventos impulsada por un bucle de eventos que permite manejar eficientemente múltiples solicitudes simultáneas con un uso mínimo de recursos. Utiliza un enfoque asíncrono y no bloqueante para manejar conexiones de red, lo que mejora la capacidad de respuesta y la escalabilidad.

## Tipos de implementaciones

NGINX se puede implementar en varios escenarios, incluyendo:

1. **Servidor web independiente**: NGINX se puede utilizar como un servidor web independiente para alojar sitios web y aplicaciones web.
2. **Proxy inverso**: Puede funcionar como un proxy inverso para equilibrar la carga y distribuir las solicitudes a servidores backend.
3. **Servidor de archivos estáticos**: NGINX puede servir contenido estático directamente sin pasar la solicitud a servidores backend.
4. **Servidor de caché**: Puede configurarse como un servidor de caché para almacenar en caché contenido estático y reducir la carga en los servidores backend.
5. **Servidor de equilibrio de carga**: Puede distribuir el tráfico de manera equilibrada entre varios servidores backend para mejorar la disponibilidad y el rendimiento.
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
docker run -dit -v http_logs_volumen:/var/log/nginx/  -v "$(pwd)"/www.TIC2023.com:/usr/share/nginx/html/ -v "$(pwd)"/web1.TIC2023.com:/usr/share/nginx/html/  -v "$(pwd)"/web2.TIC2023.com:/usr/share/nginx/html/ --net=host --name http_server andresye/nginx
```
