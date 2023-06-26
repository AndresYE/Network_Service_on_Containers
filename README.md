# Network_Service_on_Containers
# Proyecto de Titulación: Contenedores Docker en Raspberry Pi y Servicios de Red

Este proyecto de titulación se centra en la integración de contenedores Docker en Raspberry Pi, aprovechando la flexibilidad y la portabilidad de los contenedores para implementar y gestionar servicios de red clave. A lo largo de este README, se proporcionarán instrucciones detalladas sobre cómo configurar y utilizar este entorno, junto con una descripción general de los componentes principales y sus interacciones.

## Descripción General

En la actualidad, la virtualización y la automatización son fundamentales para optimizar la eficiencia y la flexibilidad de las infraestructuras de TI. En este proyecto, se exploró la combinación de contenedores Docker, Raspberry Pi y servicios de red esenciales como DHCP, DNS, FTP, HTTP, VoIP y enrutamiento.

El objetivo principal de este proyecto es demostrar cómo los contenedores Docker pueden desempeñar un papel fundamental en la implementación y gestión de servicios de red en entornos de bajo costo y consumo energético como Raspberry Pi. Al combinar la versatilidad de los contenedores con la accesibilidad de Raspberry Pi, se proporciona una solución escalable y adaptable para entornos domésticos, pequeñas empresas y proyectos de IoT.

## Configuración e Instalación

Para replicar este entorno en tu propio sistema, sigue los siguientes pasos:

1. **Instalación de Docker**: Comienza instalando Docker en tu Raspberry Pi. Puedes seguir las instrucciones oficiales de Docker para Raspberry Pi para obtener la versión adecuada.

2. **Clonación del repositorio**: Clona este repositorio en tu Raspberry Pi utilizando el siguiente comando:

   ```bash
   git clone https://github.com/tu-usuario/proyecto-titulacion.git
```
   ## Configuración de servicios de red

Sigue las instrucciones proporcionadas en cada subcarpeta del repositorio para configurar y desplegar los servicios de red deseados. A continuación, se muestra una breve descripción de cada servicio y su ubicación en el repositorio:

1. **Servicio DHCP**: `dhcp-service/`
   - Este servicio permite la asignación automática de direcciones IP a los dispositivos en la red. Sigue las instrucciones en la carpeta `dhcp-service` para configurar el servicio DHCP.

2. **Servicio DNS**: `dns-service/`
   - El servicio DNS se encarga de traducir nombres de dominio a direcciones IP. Accede a la carpeta `dns-service` para obtener instrucciones sobre cómo configurar y desplegar el servicio DNS.

3. **Servicio FTP**: `ftp-service/`
   - El servicio FTP proporciona un medio para transferir archivos entre dispositivos en la red. Consulta la carpeta `ftp-service` para obtener información detallada sobre la configuración y el despliegue del servicio FTP.

4. **Servicio HTTP**: `http-service/`
   - Este servicio permite la transferencia de páginas web y recursos asociados. En la carpeta `http-service`, encontrarás instrucciones sobre cómo configurar y desplegar el servicio HTTP.

5. **Servicio VoIP**: `voip-service/`
   - El servicio VoIP se utiliza para realizar llamadas de voz sobre IP. Sigue las instrucciones en la carpeta `voip-service` para configurar y desplegar este servicio.

6. **Servicio de enrutamiento**: `routing-service/`
   - El servicio de enrutamiento se encarga de dirigir el tráfico entre diferentes redes. Accede a la carpeta `routing-service` para obtener instrucciones sobre cómo configurar y desplegar el servicio de enrutamiento.

Sigue las instrucciones proporcionadas en cada carpeta para configurar y desplegar los servicios de red deseados en tu entorno.

## Contribución

¡Las contribuciones son bienvenidas! Si tienes alguna sugerencia, idea o mejora para este proyecto, siéntete libre de abrir un problema o enviar una solicitud de extracción.

## Recursos adicionales

Aquí hay algunos enlaces útiles relacionados con los temas cubiertos en este proyecto:

- [Documentación oficial de Docker](https://docs.docker.com)
- [Documentación de Raspberry Pi](https://www.raspberrypi.org/documentation/)
- [Tutorial de Docker en Raspberry Pi](https://www.docker.com/blog/happy-pi-day-docker-raspberry-pi/)
- [Tutorial de Docker Compose](https://docs.docker.com/compose/gettingstarted/)
- [Tutorial de redes en Docker](https://docs.docker.com/network/)

## Licencia

Este proyecto está bajo la licencia [MIT](LICENSE).

---
Espero que este README proporcione una guía clara sobre cómo configurar y desplegar los servicios de red en tu proyecto de titulación. Recuerda personalizarlo y adaptarlo según tus necesidades y requisitos específicos. ¡Buena suerte con tu trabajo de titulación!
