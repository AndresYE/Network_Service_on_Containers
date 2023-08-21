
# Asterisk

![asterisk](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/d0ac8d26-efca-41b1-8ce3-929d76ea837c)

Asterisk es un sistema de telefonía de código abierto y flexible que ofrece una amplia gama de funcionalidades de comunicación. Permite crear soluciones de telefonía personalizadas, desde pequeños sistemas PBX hasta servicios VoIP a gran escala.

## Archivos principales de Asterisk

A continuación se muestran los archivos principales utilizados en el sistema Asterisk, junto con sus descripciones:

| Archivo               | Descripción                                                                 |
| --------------------- | --------------------------------------------------------------------------- |
| extensions.conf       | Archivo de configuración principal que define las extensiones y reglas de marcado en el plan de marcado de Asterisk. |
| sip.conf              | Archivo de configuración que define los usuarios SIP y sus configuraciones en Asterisk. |
| iax.conf              | Archivo de configuración que define los usuarios IAX (Inter-Asterisk eXchange) y sus configuraciones en Asterisk. |
| voicemail.conf        | Archivo de configuración para la configuración y personalización del buzón de voz en Asterisk. |
| meetme.conf           | Archivo de configuración para configurar y administrar las salas de conferencias MeetMe en Asterisk. |
| cdr.conf              | Archivo de configuración para la configuración de registro de detalles de llamadas (CDR) en Asterisk. |
| features.conf         | Archivo de configuración para la configuración de funciones adicionales y características de llamada en Asterisk. |
| musiconhold.conf      | Archivo de configuración para la configuración de música en espera (MOH) en Asterisk. |
| queues.conf           | Archivo de configuración para la configuración de colas de llamadas y agentes de llamadas en Asterisk. |
| logger.conf           | Archivo de configuración para la configuración de registro y almacenamiento de registros en Asterisk. |
| sip_additional.conf   | Archivo generado automáticamente que contiene configuraciones SIP adicionales en Asterisk. |
| iax_additional.conf   | Archivo generado automáticamente que contiene configuraciones IAX adicionales en Asterisk. |

# Docker VoIP

## Instrucciones de Uso

A continuación se detallan los pasos para ejecutar los contenedores Docker para voip:

1. **Crear Named Volumes**:
Volumen para logs del servicio DHCP (messages):
 ```shell
docker volume create voip_logs_volumen
```

2. **Ejecuta el contenedor**:
```shell
docker run -dit --net host -v ~/asteriskconfig:/etc/asterisk -v voip_logs_volumen:/var/log/asterisk/ -v "$(pwd)"/extensions.conf:/etc/asterisk/extensions.conf -v "$(pwd)"/sip.conf:/etc/asterisk/sip.conf --name voip_server christoofar/asterisk
```
