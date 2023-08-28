# Tabla de Mensajes DHCP y Descripciones

Esta tabla describe los mensajes DHCP y su función en el proceso de asignación de direcciones IP en una red.

| Mensaje DHCP | Descripción |
| ------------ | ----------- |
| **DHCPDISCOVER** | El cliente envía este mensaje para descubrir servidores DHCP disponibles en la red. |
| **DHCPOFFER** | El servidor DHCP responde a un DHCPDISCOVER con un DHCPOFFER, ofreciendo una dirección IP al cliente. |
| **DHCPREQUEST** | El cliente selecciona una oferta de dirección IP y envía un DHCPREQUEST al servidor para solicitar esa dirección. |
| **DHCPACK** | El servidor confirma la solicitud del cliente enviando un DHCPACK, que incluye la dirección IP asignada y otros parámetros de configuración. |
| **DHCPNAK** | Si el servidor no puede conceder la solicitud del cliente, envía un DHCPNAK para indicar que la solicitud ha sido denegada. |
| **DHCPRELEASE** | El cliente utiliza este mensaje para liberar una dirección IP cuando ya no la necesita o está desconectando de la red. |
| **DHCPDECLINE** | Si el cliente detecta que la dirección IP ofrecida ya está en uso en la red, envía un DHCPDECLINE para rechazar la oferta. |
| **DHCPINFORM** | El cliente utiliza DHCPINFORM para obtener información de configuración adicional, pero ya tiene una dirección IP asignada. |
