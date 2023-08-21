## Implementación Docker Compose
A continuación se muestra una tabla con los servicios, las etiquetas de imagen, los nombres de contenedor y los nombres de los volúmenes con nombre correspondientes para la implemetación mediante Docker Compose:
| Servicio | Nombre de etiqueta de imagen | Nombre de contenedor | Nombre de volumen              |
|----------|------------------------------|---------------------|---------------------------------------|
| DHCP I   | andresye/dhcpd               | dhcp_server_eth1_compose    | dhcp_eth1_leasess_volumen <br>dhcp_eth1_logs_volumen        |
| DHCP II   | andresye/dhcpd               | dhcp_server_eth2_compose    | dhcp_eth2_leasess_volumen <br>dhcp_eth2_logs_volumen        |
| Routing  | frrouting/frr:v7.5.1         | routing_server_compose      | routing_config_volumen                  |
