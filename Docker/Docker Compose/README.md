## Implementación Docker Compose
A continuación se muestra una tabla con los servicios, las etiquetas de imagen, los nombres de contenedor y los nombres de los volúmenes con nombre correspondientes para la implemetación mediante Docker Compose para RPI I y RPI II:
| Servicio   | Nombre de etiqueta de imagen  | Nombre de contenedor        | Nombre de volumen                              |
|------------|------------------------------|-----------------------------|-------------------------------------------------|
| DHCP I     | andresye/dhcpd               | dhcp_server_wlan0_compose   | dhcp_wlan0_leasess_volumen_compose <br> dhcp_wlan0_logs_volumen_compose       |
| DHCP II    | andresye/dhcpd               | dhcp_server_eth1_compose    | dhcp_eth1_leasess_volumen_compose <br> dhcp_eth1_logs_volumen_compose        |
| DHCP III   | andresye/dhcpd               | dhcp_server_eth2_compose    | dhcp_eth2_leasess_volumen_compose <br> dhcp_eth2_logs_volumen_compose        |
| DNS        | andresye/bind                | dns_server_compose          | dns_logs_volumen_compose                        |
| FTP        | andresye/vsftpd              | ftp_server_compose          | ftp_logs_volumen_compose                        |
| HTTP       | andresye/nginx               | http_server_compose         | http_logs_volumen_compose                       |
| VoIP       | christoofar/asterisk         | voip_server_compose         | voip_logs_volumen_compose                       |
| Routing    | frrouting/frr:v7.5.1         | routing_server_compose      | routing_config_volumen_compose                  |


| Servicio | Nombre de etiqueta de imagen | Nombre de contenedor | Nombre de volumen              |
|----------|------------------------------|---------------------|---------------------------------------|
| DHCP I   | andresye/dhcpd               | dhcp_server_eth1_compose    | dhcp_eth1_leasess_volumen <br>dhcp_eth1_logs_volumen_compose        |
| DHCP II   | andresye/dhcpd               | dhcp_server_eth2_compose    | dhcp_eth2_leasess_volumen <br>dhcp_eth2_logs_volumen_compose        |
| Routing  | frrouting/frr:v7.5.1         | routing_server_compose      | routing_config_volumen_compose                  |
