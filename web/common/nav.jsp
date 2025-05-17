<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navegación</title>
        <link rel="stylesheet" href="css/nav.css" />
    </head>
    <body>
        <nav>       
            <ul>
                <li><a href="index.jsp">Inicio</a></li>
                <li><a href="${pageContext.request.contextPath}/alumno/formSolicitud.jsp">Solicitar asesoría</a></li>
                <li><a href="${pageContext.request.contextPath}/profesor/solicitudes.jsp">Solicitudes del profesor</a></li>
                <li><a href="${pageContext.request.contextPath}/registro.jsp">Registrarse</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">Ingresar</a></li>

            </ul>
      </nav>
    </body>
</html>
