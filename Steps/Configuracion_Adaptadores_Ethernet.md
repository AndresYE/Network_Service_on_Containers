
# Configuración de Adaptadores USB-Ethernet


## Paso 1: Conectar Adaptadores USB-Ethernet

1. Conecta los adaptadores USB-Ethernet a la placa Raspberry Pi.

## Paso 2: Identificar la MAC del adaptador USB-Ethernet

2. Obtén la dirección MAC del adaptador USB-Ethernet. Ejecuta el siguiente comando en la terminal:

```shell
ifcofing -a
```

## Paso 3: Configurar Archivo

3. Escribe la siguiente regla udev para asociar la dirección MAC de los adaptadores USB-Ethernet con un nombre de interfaz específico en el fichero `/etc/udev/rules.d/99-usb-ethernet.rules`:

```shell
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="MAC_ADDRESS", NAME="INTERFACE_NAME"
```
Donde:
- `MAC_ADDRESS`: Dirección MAC de tu adaptador.
- `INTERFACE_NAME`: Nombre que deseas asignar a la interfaz.

Guarda el archivo y ciérralo.

## Paso 4: Aplicar Configuraciones

4. Para que las reglas udev se apliquen, utiliza el siguiente comando:

```shell
sudo udevadm control --reload-rules
```
Luego reinicia el dispositivo:

```shell
sudo reboot
```

## Paso 5: Verificar Configuración

5. Desconecta físicamente el adaptador USB-Ethernet de tu computadora y luego vuélvelo a conectar. Luego, verifica que el nombre de la interfaz permanezca estático:

```shell
ifcofing -a
```
