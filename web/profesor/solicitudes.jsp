<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Asesoria" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.DAO.AsesoriaDAO" %>
<%@ page import="model.DAO.AlumnoDAO" %>
<%@ page import="model.Alumno" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    LocalDate fechaHoy = LocalDate.now();
    LocalTime horaActual = LocalTime.now();
    DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    DateTimeFormatter formatoHora = DateTimeFormatter.ofPattern("HH:mm");
%>



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
        AlumnoDAO alumnoDAO = new AlumnoDAO();
        
        String nombreCompleto = (String) session.getAttribute("nombreCompleto");
    %>
        <p><%= nombreCompleto%></p>
              
        
        
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
            <th>Matrícula del alumno</th>
            <th>Nombre completo</th>
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
              <td><%= alumnoDAO.getAlumnoByMatricula(a.getMatricula()).getNombreCompleto()
                  %></td>
              <td><%= a.getIdAsignatura() %></td>
              <td><%= a.getFecha() %></td>
              <td><%= a.getHora() %></td>
              <td><%= a.getAsunto() %></td>
              <td><%= a.isAlumnoEsProfesor() ? "Sí" : "No" %></td>
              <td 
    <% if (a.getStatus().equalsIgnoreCase("aceptada")) { %>
        style="color:green"
    <% } else if (a.getStatus().equalsIgnoreCase("denegada")) { %>
        style="color:red"
    <% } %>>
                  <%= a.getStatus().toUpperCase().replace('_', ' ') %>
</td>

              <td>
  <%
    LocalDate fechaAsesoria = LocalDate.parse(a.getFecha(), formatoFecha);
    LocalTime horaAsesoria = LocalTime.parse(a.getHora(), formatoHora);

    boolean vencida = false;
    if (fechaAsesoria.isBefore(fechaHoy)) {
        vencida = true;
    } else if (fechaAsesoria.isEqual(fechaHoy) && horaAsesoria.isBefore(horaActual)) {
        vencida = true;
    }

    if (vencida) {
  %>
      <p style="color:gray;">No se puede cambiar el estado</p>
  <%
    } else {
  %>
      <form action="${pageContext.request.contextPath}/ResponderSolicitudServlet" method="post">
        <input type="hidden" name="idAsesoria" value="<%= a.getIdAsesoria() %>" />
        <select name="status" required>
          <option value="">Seleccionar respuesta</option>
          <option value="aceptada">Aceptar</option>
          <option value="denegada">Denegar</option>
        </select><br/>
        <textarea name="comentario" rows="2" cols="20" placeholder="Comentario..." required></textarea><br/>
        <button type="submit">Enviar</button>
      </form>
  <%
    }
  %>
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
