<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Asignatura" %>
<%@ page import="model.Profesor" %>

<%
    // Asumiremos que los datos de profesores y asignaturas se cargan aquí
    // para que el formulario tenga los select llenos.
    List<Asignatura> asignaturas = (List<Asignatura>) request.getAttribute("asignaturas");
    List<Profesor> profesores = (List<Profesor>) request.getAttribute("profesores");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formato de solicitud de asesoría</title>
        <link rel="stylesheet" href="../css/styles.css" />
    </head>
    <body>
        <jsp:include page="common/header.jsp" />
        <jsp:include page="common/nav.jsp" />
        
        <h1>Formato de solicitud de asesoría</h1>
        <form action="${pageContext.request.contextPath}/SolicitudServlet" method="post">
          <label>Nombre Completo:</label><br/>
          <input type="text" name="nombreCompleto" required /><br/><br/>

          <label>Matrícula:</label><br/>
          <input type="text" name="matricula" required /><br/><br/>

          <label>Programa Educativo:</label><br/>
          <select name="programaEducativo" required>
            <option value="ICC">ICC</option>
            <option value="LCC">LCC</option>
            <option value="ITI">ITI</option>
          </select><br/><br/>

          <label>Asignatura:</label><br/>
          <select name="idAsignatura" required>
            <% for(Asignatura a : asignaturas) { %>
              <option value="<%= a.getIdAsignatura() %>"><%= a.getNombre() %></option>
            <% } %>
          </select><br/><br/>

          <label>Profesor:</label><br/>
          <select name="idProfesor" required>
            <% for(Profesor p : profesores) { %>
              <option value="<%= p.getIdProfesor() %>"><%= p.getNombreCompleto() %></option>
            <% } %>
          </select><br/><br/>

          <label>¿Eres alumno de este profesor?</label><br/>
          <input type="radio" name="alumnoEsProfesor" value="true" /> Sí
          <input type="radio" name="alumnoEsProfesor" value="false" checked /> No<br/><br/>

          <label>Fecha de la asesoría:</label><br/>
          <input type="date" name="fecha" required /><br/><br/>

          <label>Hora de la asesoría:</label><br/>
          <input type="time" name="hora" required /><br/><br/>

          <label>Asunto:</label><br/>
          <textarea name="asunto" required rows="3" cols="40"></textarea><br/><br/>

          <button type="submit">Enviar Solicitud</button>
        </form>

        <jsp:include page="common/footer.jsp" />

    </body>
</html>
