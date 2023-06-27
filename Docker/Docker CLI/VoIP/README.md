
# Asterisk

![asterisk](https://github.com/AndresYE/Network_Service_on_Containers/assets/113482367/d0ac8d26-efca-41b1-8ce3-929d76ea837c)

Asterisk es un sistema de telefonía de código abierto y flexible que ofrece una amplia gama de funcionalidades de comunicación. Permite crear soluciones de telefonía personalizadas, desde pequeños sistemas PBX hasta servicios VoIP a gran escala.

## Descripción

Asterisk proporciona una plataforma para construir y gestionar sistemas de telefonía IP y tradicionales. Ofrece capacidades avanzadas de enrutamiento de llamadas, servicios de conferencia, grabación de llamadas, IVR (respuesta de voz interactiva), distribución automática de llamadas y mucho más. Al ser un proyecto de código abierto, Asterisk permite a los desarrolladores personalizar y extender sus funcionalidades según las necesidades específicas.

## Características

- Enrutamiento de llamadas: Asterisk ofrece flexibilidad para enrutar llamadas entrantes y salientes según reglas personalizadas y avanzadas, incluyendo enrutamiento basado en horarios, rutas preferidas, reglas de costos, entre otros.
- Protocolos de comunicación: Admite una amplia variedad de protocolos de comunicación, como SIP (Protocolo de inicio de sesión), IAX (Inter-Asterisk Exchange) y más, lo que permite la interoperabilidad con diferentes proveedores y sistemas telefónicos.
- Funcionalidades avanzadas: Asterisk ofrece una amplia gama de funcionalidades, como conferencias telefónicas, grabación de llamadas, IVR personalizado, distribución automática de llamadas (ACD), integración con bases de datos y aplicaciones externas, entre otros.
- Escalabilidad: Puede adaptarse a diferentes tamaños de implementación, desde sistemas PBX simples hasta infraestructuras VoIP a gran escala con alta disponibilidad y redundancia.
- Integración con servicios externos: Asterisk permite integrar servicios externos como bases de datos, servicios web y aplicaciones de terceros, lo que facilita la creación de soluciones de comunicación personalizadas.
- Desarrollo de aplicaciones: Los desarrolladores pueden utilizar el lenguaje de scripting Asterisk Dialplan para crear aplicaciones personalizadas, controlar llamadas, realizar acciones condicionales y manipular variables.

## Arquitectura

Asterisk sigue una arquitectura modular y se compone de diferentes componentes clave:

- Core: El núcleo de Asterisk se encarga de la gestión de llamadas, enrutamiento y control del flujo de voz.
- Channel Drivers: Los controladores de canal proporcionan la interfaz para diferentes protocolos de comunicación, como SIP o IAX.
- Applications: Las aplicaciones de Asterisk implementan funcionalidades específicas, como conferencias, IVR, distribución automática de llamadas, etc.
- APIs: Asterisk ofrece APIs para permitir la integración con otras aplicaciones y servicios externos.
- Módulos: Los módulos agregan funcionalidades adicionales al sistema, como soporte para codecs de audio, servicios de grabación, integración con bases de datos, etc.

## Tipos de implementaciones

Asterisk puede ser implementado en diversos escenarios, incluyendo:

1. PBX empresariales: Asterisk puede utilizarse como una solución PBX completa para empresas de

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

# ASTERISK
1. **Crear Named Volumes**:
Volumen para logs del servicio DHCP (messages):
 ```shell
docker volume create voip_logs_volumen
```

2. **Ejecuta el contenedor**:
```shell
docker run -dit --net host -v ~/asteriskconfig:/etc/asterisk -v voip_logs_volumen:/var/log/asterisk/ -v "$(pwd)"/extensions.conf:/etc/asterisk/extensions.conf -v "$(pwd)"/sip.conf:/etc/asterisk/sip.conf --name voip_server christoofar/asterisk
```
