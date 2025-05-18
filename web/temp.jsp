<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utils.ConexionBD"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Prueba de Conexión</title>
    </head>
    <body>
        <h1>Prueba de Conexión a la Base de Datos</h1>

        <%
            // Llamamos al método para probar la conexión
            ConexionBD.probarConexion();
        %>

        
    </body>
</html>