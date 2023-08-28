
# Configuración de Adaptadores USB-Ethernet


## Paso 1: Conectar Adaptadores USB-Ethernet

Conecta los adaptadores USB-Ethernet a la placa Raspberry Pi.

## Paso 2: Identificar la MAC del adaptador USB-Ethernet

Obtén la dirección MAC del adaptador USB-Ethernet. Ejecuta el siguiente comando en la terminal:

```shell
ifcofing -a
```
![rpi_I_preconfiguracion_usbadapter_informacion_interfaces_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/cfd5ced6-7b2f-4449-86d8-b3422bba40a6)

![rpi_I_preconfiguracion_usbadapter_informacion_interfaces_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/ebb5cff3-3e77-46fe-aa1b-20138e78cd76)


## Paso 3: Configurar Archivo
Escribe la siguiente regla udev para asociar la dirección MAC de los adaptadores USB-Ethernet con un nombre de interfaz específico en el fichero `/etc/udev/rules.d/99-com.rules`:

```shell
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="MAC_ADDRESS", NAME="INTERFACE_NAME"
```
Donde:
- `MAC_ADDRESS`: Dirección MAC de tu adaptador.
- `INTERFACE_NAME`: Nombre que deseas asignar a la interfaz.

Guarda el archivo y ciérralo.

![rpi_I_preconfiguracion_usbadapter_configuration_1](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/c8e9e726-c4df-496d-91c4-2d76d28a82ab)

## Paso 4: Aplicar Configuraciones

Para que las reglas udev se apliquen, utiliza el siguiente comando:

```shell
sudo udevadm control --reload-rules
```
Luego reinicia el dispositivo:

```shell
sudo reboot
```

![rpi_I_preconfiguracion_usbadapter_configuration_2](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/d6dd60fe-8fb0-427c-a170-0d05a4be5e83)


## Paso 5: Verificar Configuración

5. Desconecta físicamente el adaptador USB-Ethernet de tu computadora y luego vuélvelo a conectar. Luego, verifica que el nombre de la interfaz permanezca estático:

```shell
ifcofing -a
```
