# FRRouting

![frrouting](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/612c644b-c415-432c-9636-9944b957b3fc)

FRRouting, también conocido como FRR, es un conjunto de protocolos de enrutamiento de código abierto y de alta calidad que se utilizan para construir redes de área amplia (WAN) y redes de área local (LAN) de tamaño mediano a grande.

## Archivos Principales de FRRouting

A continuación se muestra una tabla que describe los archivos principales utilizados en FRRouting:

| Archivo                | Descripción                                           |
| -----------------------| ----------------------------------------------------- |
| daemons                | Archivo de configuración que define qué demonios (procesos) de FRRouting se ejecutarán y qué no. Permite habilitar o deshabilitar protocolos de enrutamiento como OSPF, BGP, RIP, entre otros. |
| ospfd.conf             | Archivo de configuración específico para el demonio OSPF (Open Shortest Path First) en FRRouting. Contiene ajustes y parámetros de configuración para el protocolo OSPF. |
| ospfd.conf.sav         | Archivo de respaldo (backup) del archivo de configuración de OSPF. Usualmente se crea cuando se realiza una modificación en la configuración original. |
| staticd.conf           | Archivo de configuración específico para el demonio Staticd en FRRouting. Staticd se utiliza para configurar rutas estáticas. Este archivo contiene rutas estáticas definidas por el usuario. |
| staticd.conf.sav       | Archivo de respaldo (backup) del archivo de configuración de Staticd. Similar a ospfd.conf.sav, se crea cuando se realiza una modificación en la configuración original. |
| zebra.conf             | Archivo de configuración específico para el demonio Zebra en FRRouting. Zebra es responsable de la administración de rutas en el sistema operativo. Este archivo contiene ajustes y parámetros para la administración de rutas. |
| zebra.conf.sav         | Archivo de respaldo (backup) del archivo de configuración de Zebra. Al igual que otros archivos .sav, se crea al modificar la configuración original de Zebra. |


# Docker Routing

## Instrucciones de Uso

A continuación se detallan los pasos para ejecutar los contenedores Docker para routing:

# FRRouting
1. **Crear Named Volumes**:
Volumen para las configuraciones del servicio Routing (/etc/frr/):
 ```shell
docker volume create routing_config_volumen 
```

2. **Ejecuta el contenedor**:
```shell
docker run --restart=always --privileged=true -dit --net host -v routing_config_volumen:/etc/frr/ --name routing_server frrouting/frr:v8.4.0
```
