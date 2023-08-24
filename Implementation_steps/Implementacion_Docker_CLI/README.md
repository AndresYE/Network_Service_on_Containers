# Implementación
## Construcción de Imagenes Docker
1. Como primer paso de la implementación se emplea el software WinSCP, el cual usa para la transferencia de los ficheros Dockerfile mediante conexión SSH.
2. Crear un directorio "Docker" en la ruta "/home/pi/"".
3. Colocar los ficheros Dockerfile y dependencias en un directorio con el nombre del servicio.
4. Iniciar conexión SSH empleando el software Putty.
5. Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker build" respectivos para contruir las imagenes de los contenedores a partir de los ficheros Dockerfile y sus dependencias asociadas.
6. Verificar las imagenes creadas mediante el comando.
```shell
docker images
```
o
```shell
docker image ls
```
## Desplegar Conenedores de Imagenes Docker
1. Ingresar a cada uno de los directorios de cada uno de los servicios y ejecutar los comandos "docker run" respectivos para instancias las imagenes creadas y ejecutar los contenedores.
2. Verificar los contenedores en ejecución mediante el comando:
```shell
docker ps
```
3. Verificar los volumes de contenedores en ejecución mediante el comando:
```shell
docker volume ls
```
## Subir Imagenes a Registro Docker Hub
1. Iniciar sesión en Docker Hub con usuario y contraseña previamente creados, mediante los comandos:
```shell
docker login -u user_name
```
Donde:
- **user_name:** Es el nombre de usuario de Docker Hub.
2. Subir las imagenes de contenedores creadas mediante los comandos:
```shell
docker push  repository[:tag]
```
Donde:
- ** repository:** Es el nombre del repositorio y la etiquete de la imagen.

**NOTA: Se debe crear una cuenta en Docker Hub previamente y solicitar un Token para poder iniciar sesión y subir imagenes de contenedores docker.
