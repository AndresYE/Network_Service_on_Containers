
# Instalación de Docker en Debian 32 bits

Este es un tutorial paso a paso sobre cómo instalar Docker en una distribución Debian de 32 bits.

## Requisitos

Antes de comenzar, asegúrate de tener los siguientes elementos:

- Una computadora con Debian de 32 bits instalado.
- Acceso a Internet.

## Pasos

Sigue estos pasos para instalar Docker en tu sistema Debian de 32 bits:

1. **Actualizar el sistema**

   Abre una terminal y ejecuta los siguientes comandos para asegurarte de que el sistema esté actualizado:

   ```sudo apt update
   sudo apt upgrade -y´´´
  2. **Instalar dependencias**
```Instala las dependencias necesarias:
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common´´

4. **Agregar el repositorio de Docker**
Agrega la clave GPG oficial de Docker y el repositorio:
```curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ´´´
5. **Instalar Docker Engine**
Actualiza el índice de paquetes e instala Docker:
```sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
´´´
6. **Iniciar y habilitar Docker**
Inicia el servicio Docker y habilítalo para que se inicie automáticamente en el arranque del sistema:
```
sudo systemctl start docker
sudo systemctl enable docker
´´´
7. **Verificar la instalación**
Para asegurarte de que Docker se haya instalado correctamente, ejecuta el siguiente comando:
```
sudo docker --version
´´´
8. ** **
```

´´´

´´´
