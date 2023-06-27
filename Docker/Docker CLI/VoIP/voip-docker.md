# Docker VoIP

## Instrucciones de Uso

A continuación se detallan los pasos para ejecutar los contenedores Docker para voip:

# ASTERISK
1. **Crear Named Volumes**:
Volumen para logs del servicio DHCP (messages):
 ```shell
docker volume create voip_logs_volumen
```

2. **Ejecuta el contenedor**:
```shell
docker run -dit --net host -v ~/asteriskconfig:/etc/asterisk -v	voip_logs_volumen:/var/log/asterisk/ -v extensions.conf:/etc/asterisk/extensions.conf -v sip.conf:/etc/asterisk/sip.conf --name voip_server christoofar/asterisk
```
