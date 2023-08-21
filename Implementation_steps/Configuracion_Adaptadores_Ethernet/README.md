# Configuración de Adaptadores USB-Ethernet para Asociar MAC con Nombre de Interfaz

##  Configuración de Adaptadores USB-Ethernet

Sigue estos pasos para configurar tus adaptadores USB-Ethernet:
1. **Conectar Adaptadores USB-Ethernet**
- Conectamos los adaptadores USB-Ethenet a la placa Raspberry Pi.
2. **Identificar la MAC del adaptador USB-Ethernet**
- Obtener la dirección MAC del adaptador USB-Ethernet. Ejecuta el siguiente comando en la terminal:
```shell
ifcofing -a
```

3. **Configurar Archivo**
- Crea un archivo de reglas udev en el directorio /etc/udev/rules.d/ utilizando un nombre descriptivo, como 99-usb-ethernet.rules:
```shell
sudo nano /etc/udev/rules.d/99-usb-ethernet.rules
```
Escribir la siguiente regla udev para asociar la dirección MAC de los adaptadores USB-Ethernet con un nombre de interfaz específico. 
´´´shell
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="MAC_ADDRESS", NAME="INTERFACE_NAME"
´´´

Donde:
MAC_ADDRESS: Dirección MAC de tu adaptador.
INTERFACE_NAME: Nombre que deseas asignar a la interfaz.
Guarda el archivo y ciérralo.
4. **Aplicar Configuraciones**
Para que las reglas udev se apliquen, recárgalas con el siguiente comando:
´´´shell
sudo udevadm control --reload-rules
´´´

5. **Verificar Configuración**
Desconecta físicamente el adaptador USB-Ethernet de tu computadora y luego vuélvelo a conectar. Despues de ello verificar que el nombre de la interfaz permanezca estático.
```shell
ifcofing -a
´´´
