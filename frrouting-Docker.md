
# Docker Routing

## Instrucciones de Uso

A continuación se detallan los pasos para ejecutar los contenedores Docker para routing:

# FRRouting
1. **Crear Named Volumes**:
Volumen para las configuraciones del servicio Routing (messages):
 ```shell
docker volume create routing_config_volumen 
```

2. **Ejecuta el contenedor**:
```shell
docker run --privileged -v routing_config_volumen:/etc/frr/ -dit --net host  --name routing_server frrouting/frr:v7.5.1
```
