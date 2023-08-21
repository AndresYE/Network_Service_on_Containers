# Características de Servicios y Contenedores
## Implementación Docker CLI
A continuación se muestra una tabla con los servicios, las etiquetas de imagen, los nombres de contenedor y los nombres de los volúmenes con nombre correspondientes para la implemetación mediante Docker CLI:

| Servicio | Nombre de etiqueta de imagen | Nombre de contenedor | Nombre de volumen              |
|----------|------------------------------|---------------------|---------------------------------------|
| DHCP I   | andresye/dhcpd               | dhcp_server_wlan0   | dhcp_wlan0_leasess_volumen <br>dhcp_wlan0_logs_volumen       |
| DHCP II   | andresye/dhcpd               | dhcp_server_eth1    | dhcp_eth1_leasess_volumen <br>dhcp_eth1_logs_volumen        |
| DHCP III   | andresye/dhcpd               | dhcp_server_eth2    | dhcp_eth2_leasess_volumen <br>dhcp_eth2_logs_volumen        |
| DNS      | andresye/bind                | dns_server          | dns_logs_volumen                      |
| FTP      | andresye/vsftpd              | ftp_server          | ftp_logs_volumen                      |
| HTTP     | andresye/nginx               | http_server         | http_logs_volumen                     |
| VoIP     | christoofar/asterisk         | voip_server         | voip_logs_volumen <br>voip_qos_volumen   |
| Routing  | frrouting/frr:v7.5.1         | routing_server      | routing_config_volumen                  |
