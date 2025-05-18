<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Asesoria" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    List<Asesoria> lista = (List<Asesoria>) request.getAttribute("listaSolicitudes");
%>

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
        <title>Mis solicitudes</title>
        <link rel="stylesheet" href="../css/styles.css" />
    </head>
    
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/nav.jsp" />
      
        <%
            // Verificar si el usuario ha iniciado sesión
            if (identificador == null || tipoUsuario == null) {
        %>
            <!-- Si no ha iniciado sesión, mostrar el mensaje de inicio de sesión o registro -->
            
            <h3>Debes iniciar sesión para ver tus solicitudes.</h3>
            
        <% 
            } else {
        %>
            
        
        
        <!-- Si está logueado, mostrar la tabla de solicitudes -->
        <h2>Mis Solicitudes</h2>
        
            <a href="formSolicitud.jsp">Nueva Solicitud</a> |
            <a href="<%= request.getContextPath() %>/LogoutServlet">Cerrar sesión</a>
            
            <table border="1" cellpadding="5" cellspacing="0">
                <tr>
                    <th>ID</th>
                    <th>Asignatura</th>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Asunto</th>
                    <th>Estado</th>
                    <th>Comentario del Profesor</th>
                </tr>
                <%
                    if (lista != null && !lista.isEmpty()) {
                        for (Asesoria a : lista) {
                %>
                        <tr>
                            <td><%= a.getIdAsesoria() %></td>
                            <td><%= a.getIdAsignatura() %></td>
                            <td><%= a.getFecha() %></td>
                            <td><%= a.getHora() %></td>
                            <td><%= a.getAsunto() %></td>
                            <td><%= a.getStatus() %></td>
                            <td><%= a.getComentarioProfesor() != null ? a.getComentarioProfesor() : "-" %></td>
                        </tr>
                <%
                        }
                    } else {
                %>
                    <tr><td colspan="7">No tienes solicitudes registradas.</td></tr>
                <%
                    }
                %>
            </table>
        <% 
            }
        %>

        

        <jsp:include page="../common/footer.jsp" />

    </body>
</html>
