<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Asesoria" %>

<%
    List<Asesoria> lista = (List<Asesoria>) request.getAttribute("listaSolicitudes");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../css/styles.css" />
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />

        <h2>Mis Solicitudes de Asesoría</h2>

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

        <a href="formSolicitud.jsp">Nueva Solicitud</a> | 
        <a href="<%= request.getContextPath() %>/LogoutServlet">Cerrar sesión</a>

        <jsp:include page="../common/footer.jsp" />
    </body>
</html>
