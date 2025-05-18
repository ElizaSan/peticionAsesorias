<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Profesor" %>
<%@ page import="model.DAO.ProfesorDAO" %>

<%
    ProfesorDAO profesorDAO = new ProfesorDAO();
    List<Profesor> profesores = null;
    try {
        profesores = profesorDAO.getAllProfesores();
    } catch (Exception e) {
        out.println("<p>Error al obtener los profesores: " + e.getMessage() + "</p>");
    }
%>

<label for="idProfesor">Profesor:</label><br/>

<%
    if (profesores != null && !profesores.isEmpty()) {
%>
    <select name="idProfesor" id="idProfesor">
    <%
        for (Profesor p : profesores) {
    %>
            <option value="<%= p.getIdProfesor() %>"><%= p.getNombreCompleto() %></option>
    <%
        }
    %>
    </select>
<%
    } else {
%>
    <p>No hay profesores registrados.</p>
<%
    }
%>
<br><br>
