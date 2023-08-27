
# Instalación de Docker en Debian (32 bits)

## Paso 1: Actualizar el sistema

Asegúrate de que tu sistema esté actualizado ejecutando los siguientes comandos en una terminal:

1.1. Abre una terminal y ejecuta los siguientes comandos para asegurarte de que el sistema esté actualizado y luego reinicia el sistema.
```shell
sudo apt update
sudo apt upgrade -y
sudo reboot
```


## Paso 2: Desinstalar paquetes Interferentes

Es recomendable desinstalar cualquier paquete previamente instalado que pueda generar conflictos con Docker.
```shell
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

![Instalacion_Docker_Paso_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/8946e855-7606-4a3f-8304-ed417f1f39e7)

## Paso 3: Actualizar el índice de paquetes e Instalar dependencias

Asegúrate de tener las dependencias necesarias instaladas. Actualiza el índice de paquetes e instala las dependencias necesarias.
```shell
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
```

![Instalacion_Docker_Paso_3](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/8d0afbc2-3a38-47e6-a47e-6f42ad3a70f6)

## Paso 4: Agregar el repositorio de Docker

Agrega la clave GPG oficial de Docker y el repositorio necesario para la instalación de Docker.
```shell
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

![Instalacion_Docker_Paso_4 1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/24962b0c-035e-4734-a283-5d3baff05cb5)

```shell
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

![Instalacion_Docker_Paso_4](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/cd64ed81-3367-4ce4-a341-103863fd4066)

## Paso 5: Instalar Docker Engine

Instala Docker Engine, que es el corazón de Docker. Asegúrate de que Docker se instale correctamente.
```shell
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
![Instalacion_Docker_Paso_5 1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/2feaeb4b-3d77-4497-8a1c-c1e7e66dea79)

```shell
sudo reboot
```
![Instalacion_Docker_Paso_5 2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/0cdc3eed-0d5c-4e72-a1f3-24d317034e74)

## Paso 6: Verificar la instalación de Docker

Para confirmar que Docker se ha instalado correctamente, puedes verificar su versión.
```shell
sudo docker --version
```
![Instalacion_Docker_Paso_6](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/732c14be-bf3b-4100-90a6-6247dc387036)


## Paso 7: Desplegar un contenedor

Para asegurarte de que Docker funciona correctamente, puedes probar desplegando el contenedor de Docker "hello-world".
```shell
sudo docker run hello-world
```

![Instalacion_Docker_Paso_7](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/ad6c8c5e-c1b0-473e-b2d3-28dbffae6e44)


## Paso 8: Verificar la instalación de Docker Compose

Si planeas usar Docker Compose, puedes verificar su instalación y versión.
```shell
sudo docker compose version
```
![Instalacion_Docker_Paso_8](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/dc605502-bcd9-469e-9490-3d90b8be905d)


