# FRRouting

FRRouting, también conocido como FRR, es un conjunto de protocolos de enrutamiento de código abierto y de alta calidad que se utilizan para construir redes de área amplia (WAN) y redes de área local (LAN) de tamaño mediano a grande.

## Descripción

FRRouting es una implementación robusta y escalable de protocolos de enrutamiento como BGP, OSPF, IS-IS, RIP y EIGRP. Está diseñado para ser compatible con los estándares de enrutamiento y ofrecer un rendimiento óptimo en entornos de red complejos.

## Características

- **Protocolos de enrutamiento**: FRRouting admite una amplia gama de protocolos de enrutamiento, incluyendo BGP, OSPF, IS-IS, RIP y EIGRP, lo que permite construir redes complejas y flexibles.
- **Escalabilidad**: FRRouting está diseñado para manejar redes de cualquier tamaño, desde pequeñas LAN hasta WAN de gran escala, garantizando un rendimiento óptimo y una administración eficiente.
- **Alta disponibilidad**: FRRouting proporciona características de alta disponibilidad, como enrutamiento redundante, enlaces de respaldo y capacidades de conmutación por error, para garantizar la continuidad de la red.
- **Enrutamiento basado en políticas**: Permite configurar políticas de enrutamiento avanzadas para controlar la forma en que se toman las decisiones de enrutamiento y gestionar el tráfico de manera eficiente.
- **Enrutamiento IPv6**: FRRouting ofrece un soporte completo para enrutamiento IPv6, permitiendo la implementación de redes basadas en el protocolo de próxima generación.
- **Integración con otras soluciones**: FRRouting se integra fácilmente con otras soluciones de red, como sistemas de monitorización y administración, para facilitar la gestión centralizada y el monitoreo de la red.

## Arquitectura

FRRouting sigue una arquitectura modular y flexible, donde cada protocolo de enrutamiento se implementa como un módulo independiente. Estos módulos interactúan entre sí a través de una capa de abstracción común para proporcionar un enrutamiento coherente y unificado en toda la red.

## Implementaciones

FRRouting se puede implementar en una variedad de escenarios, incluyendo:

- **Redes de proveedores de servicios**: FRRouting es ampliamente utilizado por proveedores de servicios para construir y administrar redes de área amplia y ofrecer servicios de conectividad a sus clientes.
- **Redes empresariales**: FRRouting se puede implementar en redes empresariales para establecer un enrutamiento eficiente y confiable entre las distintas ubicaciones y servicios.
- **Redes de data center**: FRRouting es una opción popular para construir redes de data center y proporcionar enrutamiento entre los servidores y los diferentes componentes de la infraestructura.

# Archivos Principales de FRRouting

A continuación se muestra una tabla que describe los archivos principales utilizados en FRRouting:

| Archivo       | Descripción                                           |
|---------------|-------------------------------------------------------|
| frr.conf      | Archivo de configuración principal de FRRouting        |
| daemons       | Archivo que especifica los módulos y protocolos a cargar por FRRouting |
| vtysh.conf    | Archivo de configuración para el shell de administración de FRRouting (vtysh) |
| zebra.conf    | Archivo de configuración para el daemon Zebra          |
| ospfd.conf    | Archivo de configuración para el daemon OSPF           |
| bgpd.conf     | Archivo de configuración para el daemon BGP            |
| isisd.conf    | Archivo de configuración para el daemon IS-IS          |
| ripd.conf     | Archivo de configuración para el daemon RIP            |
| eigrpd.conf   | Archivo de configuración para el daemon EIGRP          |
| pimd.conf     | Archivo de configuración para el daemon PIM            |
| nfsv3.conf    | Archivo de configuración para el daemon NFSv3          |
| nfsv4.conf    | Archivo de configuración para el daemon NFSv4          |
| ripngd.conf   | Archivo de configuración para el daemon RIPng          |
| vrrpd.conf    | Archivo de configuración para el daemon VRRP           |
| ldpd.conf     | Archivo de configuración para el daemon LDP            |
| pbrd.conf     | Archivo de configuración para el daemon PBR            |
| ospf6d.conf   | Archivo de configuración para el daemon OSPFv3         |
| bgpvpn.conf   | Archivo de configuración para el daemon BGP VPN        |
| lldpd.conf    | Archivo de configuración para el daemon LLDP           |
| ptpd.conf     | Archivo de configuración para el daemon PTP            |

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
docker run --privileged -v routing_config_volumen:/etc/frr/ -dit --net host  --name routing_server frrouting/frr:v7.5.1
```
