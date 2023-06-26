# Docker DHCPd


## Instrucciones de Uso

A continuación se detallan los pasos para construir la imagen y ejecutar el contenedor Docker de DHCPd:
1. **Construye la imagen**:
```shell
docker build -t andresye/dhcpd .
```
2. **Ejecuta el contenedor**:
```shell
docker run -d --name dhcpd-server dhcpd
```
Asegúrate de ajustar los comandos y configuraciones según tus necesidades específicas. Puedes modificar el archivo `dhcpd.conf` en el repositorio para personalizar la configuración del servidor DHCPd antes de construir la imagen.
