
# Instalación de Docker en Debian (32 bits)

## Paso 1: Actualizar el sistema

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

<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/7b0f80da-1c26-4dc0-9987-04842280dc39" alt="Paso 2">
  </kbd>
</p>

## Paso 3: Actualizar el índice de paquetes e Instalar dependencias

Asegúrate de tener las dependencias necesarias instaladas. Actualiza el índice de paquetes e instala las dependencias necesarias.
```shell
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
```

<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/e6e7d131-365a-4ed0-a6c5-4763a66b3bce" alt="Paso 3">
  </kbd>
</p>

## Paso 4: Agregar el repositorio de Docker

Agrega la clave GPG oficial de Docker y el repositorio necesario para la instalación de Docker.
```shell
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```


```shell
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/413955dd-7930-42a6-b335-fe3e410ec940" alt="Paso 4">
  </kbd>
</p>


## Paso 5: Instalar Docker Engine

Instala Docker Engine, que es el corazón de Docker. Asegúrate de que Docker se instale correctamente.
```shell
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo reboot
```

<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/0eca1c0f-03a3-4c9a-b695-74ebb64671a6" alt="Paso 5.1">
  </kbd>
</p>

<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/17c393a9-3b03-4dd8-bc7d-8e51cc5f335b" alt="Paso 5.2">
  </kbd>
</p>


## Paso 6: Verificar la instalación de Docker

Para confirmar que Docker se ha instalado correctamente, puedes verificar su versión.
```shell
sudo docker --version
```

<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/25c53f7e-6a3c-48e0-85b6-ed8268a4ff74" alt="Paso 6">
  </kbd>
</p>



## Paso 7: Desplegar un contenedor

Para asegurarte de que Docker funciona correctamente, puedes probar desplegando el contenedor de Docker "hello-world".
```shell
sudo docker run hello-world
```

<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/8ad681c2-2b3b-49a0-a5d4-8a825867129d" alt="Paso 7">
  </kbd>
</p>

## Paso 8: Verificar la instalación de Docker Compose

Si planeas usar Docker Compose, puedes verificar su instalación y versión.
```shell
sudo docker compose version
```

<p align="center">
  <kbd>
    <img src="https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/92a3c070-37fe-419b-afb4-a601de12d428" alt="Paso 8">
  </kbd>
</p>

