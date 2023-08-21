
# Instalación de Docker en Debian 32 bits

Este es un tutorial paso a paso sobre cómo instalar Docker en una distribución Debian de 32 bits.

## Requisitos

1. **Actualizar el sistema**
Abre una terminal y ejecuta los siguientes comandos para asegurarte de que el sistema esté actualizado y luego reinicie el sistema:
```shell
sudo apt update
sudo apt upgrade -y
sudo reboot
```


2. **Desinstalar paquetes Interferentes**
Desisntalar paquetes previamente instalados, que generen conflictos con el paquete de instalación de Docker.
```shell
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
```



4. ** Actualiza el índice de paquetes e Instalar dependencias**
Actualiza el índice de paquetes e instala las dependencias necesarias:
```shell
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
```


5. **Agregar el repositorio de Docker**
Agrega la clave GPG oficial de Docker y el repositorio:
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

6. **Instalar Docker Engine**
Actualiza el índice de paquetes, instala Docker con sus dependencias y luego reinicie el sistema:
```shell
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo reboot
```

7. **Verificar la instalación de Docker**
Para asegurarte de que Docker se haya instalado correctamente, ejecuta el siguiente comando:
```shell
sudo docker --version
´´´

8. **Desplegar un contenedor**
Verificar la instalación y funcionamiento de Docker, mediante el despliegue del contenedor de Docker "hello-word".
```shell
sudo docker run hello-world
```
   
10. **Verificar la instalación de Docker Compose**
Para asegurarte de que Docker se haya instalado correctamente, ejecuta el siguiente comando:
```shell
sudo docker compose version
```
   

