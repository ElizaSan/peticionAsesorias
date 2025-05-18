<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Asesoria" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.DAO.AsesoriaDAO" %>



<%
    // Obtener la sesión
    AsesoriaDAO asesoriaDAO =  new AsesoriaDAO(); 
    session = request.getSession();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");  // Obtener el tipo de usuario
    String identificador = (String) session.getAttribute("identificador"); // Obtener el identificador (matrícula o idProfesor)
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Solicitudes del profesor</title>
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
        
        
        
        
        
        <h2>Solicitudes del profesor</h2>
        
        

        <table border="1" cellpadding="5" cellspacing="0">
          <tr>
            <th>ID</th>
            <th>Alumno (Matrícula)</th>
            <th>Asignatura</th>
            <th>Fecha</th>
            <th>Hora</th>
            <th>Asunto</th>
            <th>Es alumno suyo</th>
            <th>Estado</th>
            <th>Acciones</th>
          </tr>
          <%
            List<Asesoria> lista = asesoriaDAO.getAsesoriasByProfesor(Integer.parseInt(identificador));
            if (lista != null && !lista.isEmpty()) {
              for (Asesoria a : lista) {
          %>
            <tr>
              <td><%= a.getIdAsesoria() %></td>
              <td><%= a.getMatricula() %></td>
              <td><%= a.getIdAsignatura() %></td>
              <td><%= a.getFecha() %></td>
              <td><%= a.getHora() %></td>
              <td><%= a.getAsunto() %></td>
              <td><%= a.isAlumnoEsProfesor() ? "Sí" : "No" %></td>
              <td><%= a.getStatus() %></td>
              <td>
                  
                <form action="${pageContext.request.contextPath}/ResponderSolicitudServlet" method="post">
                  <input type="hidden" name="idAsesoria" value="<%= a.getIdAsesoria() %>" />
                  <select name="status" required>
                    <option value="">Responder</option>
                    <option value="aceptada">Aceptar</option>
                    <option value="denegada">Denegar</option>
                  </select>
                  <br/>
                  <textarea name="comentario" rows="2" cols="20" placeholder="Comentario..." required></textarea><br/>
                  <button type="submit">Enviar</button>
                </form>
              </td>
            </tr>
          <%
              }
            } else {
          %>
            <tr><td colspan="9">No tienes solicitudes pendientes.</td></tr>
          <%
            }
          %>
        </table>

        <a href="<%= request.getContextPath() %>/LogoutServlet">Cerrar sesión</a>

        <jsp:include page="../common/footer.jsp" />
    <% } %>
    </body>
</html>
