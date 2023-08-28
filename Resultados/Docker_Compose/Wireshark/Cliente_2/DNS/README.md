# Tabla de Mensajes DNS y Descripciones

Esta tabla describe los mensajes DNS y su función en el proceso de resolución de consultas en una red.

| Mensaje DNS | Descripción |
| ----------- | ----------- |
| **DNS Query** | El cliente envía una consulta DNS al servidor DNS para buscar la dirección IP asociada a un nombre de dominio (por ejemplo, www.ejemplo.com). |
| **DNS Response** | El servidor DNS responde a una consulta DNS con una respuesta que incluye la dirección IP asociada al nombre de dominio solicitado. |
| **DNS Query (Recursive)** | Cuando un cliente no tiene la dirección IP del nombre de dominio en caché, envía una consulta DNS recursiva al servidor DNS. El servidor DNS realiza consultas adicionales a otros servidores DNS para encontrar la respuesta. |
| **DNS Response (Recursive)** | El servidor DNS responde a una consulta recursiva con la dirección IP solicitada, obtenida tras realizar consultas a otros servidores DNS si es necesario. |
| **DNS Query (Iterative)** | En lugar de realizar consultas recursivas, el servidor DNS puede responder con una lista de servidores DNS autoritativos para el dominio consultado. El cliente realiza consultas adicionales a estos servidores para encontrar la dirección IP. |
| **DNS Response (Iterative)** | El servidor DNS proporciona una lista de servidores DNS autoritativos para el dominio, permitiendo que el cliente realice consultas adicionales para obtener la dirección IP deseada. |
| **DNS Update** | Se utiliza para actualizar registros DNS, como la asociación entre una dirección IP y un nombre de dominio, en el servidor DNS. |
| **DNS Notify** | El servidor DNS maestro envía una notificación a los servidores secundarios para informarles sobre cambios en la zona de dominio. |
| **DNS Zone Transfer** | Se utiliza para transferir toda la información de una zona de dominio desde un servidor DNS maestro a un servidor DNS secundario. |
# Tabla de Tipos de Registros DNS y Descripciones

Esta tabla describe los tipos de registros DNS más comunes y su función en el sistema de nombres de dominio (DNS).

| Tipo de Registro DNS | Descripción |
| -------------------- | ----------- |
| **A (Address)** | El registro A se utiliza para mapear un nombre de dominio a una dirección IPv4. Permite la resolución de nombres a direcciones IP. Por ejemplo, "www.ejemplo.com" podría estar mapeado a "192.168.1.1". |
| **AAAA (IPv6 Address)** | El registro AAAA es similar al registro A, pero se utiliza para mapear un nombre de dominio a una dirección IPv6. Permite la resolución de nombres a direcciones IPv6. |
| **CNAME (Canonical Name)** | El registro CNAME se utiliza para crear alias de nombres de dominio. Redirige un nombre de dominio a otro nombre de dominio canónico. Por ejemplo, "www" podría ser un CNAME para "ejemplo.com". |
| **PTR (Pointer)** | El registro PTR se utiliza en la resolución inversa de DNS. Convierte una dirección IP en un nombre de dominio. Se utiliza para buscar el nombre de dominio asociado a una dirección IP. |
