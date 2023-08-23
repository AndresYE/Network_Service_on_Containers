#!/bin/bash

envsubst < ./etc/dhcp/dhcpd.env.conf  > ./etc/dhcp/dhcpd.conf
envsubst < ./etc/dhcp/dhcpd6.env.conf > ./etc/dhcp/dhcpd6.conf

## Comando de Ejecución
# Configuración comandos para el despligue del servicio dhcpd en el contenedor
#Ejecutar servicio dhcpd
    #/usr/sbin/dhcpd
# Opciones de Ejecución:
    #-4: DHCP con direccionamiento IPv4.
    #-6: DHCP con direccionamiento IPv6.
    #-f: Ejecutar dhcpd como Proceso de Primer plano (Foreground) (Background Default).
    #-p: Puerto UDP DHCP (67/udp Default).
    #-d: Registro de standar errors.
    #-cf: Archivo de configuración DHCP alternativo (dhcpd.conf Default).
    #-lf: Archivo de arrendamiento DHCP alternativo (dhcpd.leases Default).
    #-pf: Archivo de proceso DHCP alternativo (dhcpd.pid Default).
    #-q: Omitir mensaje de inicio DHCP.
    #-T: Pueba de base de datos de arrendamientos.
/usr/sbin/dhcpd -$DHCP_MOD -f -d -p ${IPV4_DHCP_PORT} -cf $DHCP_CONF_FILE -lf $DHCP_LEASES_FILE -user $DHCP_USER -group $DHCP_GROUP $IFDHCP 