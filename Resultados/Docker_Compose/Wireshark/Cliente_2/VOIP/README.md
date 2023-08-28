# Tabla de Mensajes SIP/RTP y Descripciones para Llamadas VoIP

Esta tabla describe los mensajes SIP (Session Initiation Protocol) y RTP (Real-time Transport Protocol) utilizados en el proceso de una llamada de voz sobre IP (VoIP), junto con sus descripciones.

| Mensaje          | Protocolo | Descripción |
| ---------------- | --------- | ----------- |
| **INVITE**       | SIP       | El mensaje INVITE se utiliza para iniciar una llamada. El cliente SIP invita al destinatario a unirse a la llamada. |
| **TRYING**       | SIP       | Respuesta provisional que indica que la solicitud INVITE está siendo procesada. |
| **RINGING**      | SIP       | Respuesta provisional que indica que la llamada está siendo alertada en el destinatario. |
| **200 OK**       | SIP       | Respuesta exitosa que indica que la llamada ha sido aceptada. Incluye información de negociación de medios. |
| **ACK**          | SIP       | El mensaje ACK se utiliza para confirmar la recepción de una respuesta 200 OK. |
| **BYE**          | SIP       | El mensaje BYE se utiliza para finalizar una llamada. |
| **CANCEL**       | SIP       | El mensaje CANCEL se utiliza para cancelar una solicitud INVITE pendiente. |
| **OPTIONS**      | SIP       | El mensaje OPTIONS se utiliza para obtener información sobre las capacidades del servidor SIP. |
| **RTP Data**     | RTP       | Los datos de audio y video se transmiten utilizando el protocolo RTP durante una llamada VoIP. |
| **RTCP Control** | RTP       | El protocolo RTCP (Real-time Transport Control Protocol) se utiliza para monitorear y controlar la calidad de la llamada. |
