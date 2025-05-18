<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Obtener la sesión 
    session = request.getSession();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");  // Obtener el tipo de usuario
    String identificador = (String) session.getAttribute("identificador"); // Obtener el identificador (matrícula o idProfesor)
%>
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
                <li><a href="${pageContext.request.contextPath}/">Inicio</a></li>

                <%
                    if (identificador == null || tipoUsuario == null) {
                %>
                <li><a href="${pageContext.request.contextPath}/registro.jsp">Registrarse</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">Ingresar</a></li>
                <% 
                    } else if (tipoUsuario ==  "alumno"){
                %>
                <li><a href="${pageContext.request.contextPath}/alumno/misSolicitudes.jsp">Mis solicitudes</a></li>
                <li><a href="${pageContext.request.contextPath}/alumno/formSolicitud.jsp">Solicitar asesoría</a></li>
                <li><a href="<%= request.getContextPath() %>/LogoutServlet">Cerrar sesión</a> </li> 
                <% 
                  } else if (tipoUsuario ==  "profesor"){
                %>
                <li><a href="${pageContext.request.contextPath}/profesor/solicitudes.jsp">Solicitudes del profesor</a></li>
                <li><a href="${pageContext.request.contextPath}/profesor/responder.jsp">Mis respuestas</a></li>
                <li> <a href="<%= request.getContextPath() %>/LogoutServlet">Cerrar sesión</a></li>               
                <% 
                  }else {
                %>

                <li><a href="${pageContext.request.contextPath}/registro.jsp">Registrarse</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">Ingresar</a></li>
                
                <% 
                  }
                %>

            </ul>
      </nav>
    </body>
</html>
