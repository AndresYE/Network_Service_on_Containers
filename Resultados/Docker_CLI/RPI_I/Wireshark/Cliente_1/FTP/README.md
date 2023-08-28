# Tabla de Mensajes FTP y Descripciones

Esta tabla describe los mensajes FTP y su función en el proceso de transferencia de archivos y gestión de sesiones.

| Mensaje FTP       | Descripción |
| ----------------- | ----------- |
| **FTP Connect**   | El cliente FTP inicia una conexión con el servidor FTP. Normalmente, se establece una conexión en el puerto 21. |
| **FTP Login**     | El cliente proporciona credenciales (nombre de usuario y contraseña) al servidor para autenticarse y acceder a su cuenta. |
| **FTP Logout**    | El cliente se desconecta del servidor FTP y finaliza la sesión. |
| **FTP Change Directory (CWD)** | El cliente solicita cambiar el directorio actual en el servidor FTP. |
| **FTP List (LIST)** | El cliente solicita una lista de archivos y directorios en el directorio actual del servidor FTP. |
| **FTP Upload (STOR)** | El cliente envía un archivo al servidor FTP para su almacenamiento en el directorio remoto. |
| **FTP Download (RETR)** | El cliente solicita la descarga de un archivo desde el servidor FTP al cliente. |
| **FTP Delete (DELE)** | El cliente solicita eliminar un archivo en el servidor FTP. |
| **FTP Rename (RNFR y RNTO)** | El cliente solicita cambiar el nombre de un archivo o directorio en el servidor FTP. |
| **FTP Passive Mode (PASV)** | El servidor FTP cambia al modo pasivo, lo que permite que el cliente inicie la conexión de datos. |
| **FTP Active Mode (PORT)** | El cliente cambia al modo activo, especificando un puerto para que el servidor se conecte para la transferencia de datos. |
| **FTP Response**  | El servidor FTP envía respuestas a las solicitudes del cliente, incluyendo códigos de estado y mensajes descriptivos. |
