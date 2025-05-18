<%@ page import="java.util.List" %>
<%@ page import="model.Profesor" %>
<%@ page import="model.DAO.ProfesorDAO" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ProfesorDAO profesorDAO = new ProfesorDAO();
%>

        
<label for="idProfesor">Profesor:</label><br/>
<%
    List<Profesor> profesores = profesorDAO.getAllProfesores();
    if (profesores != null && !profesores.isEmpty()) {
%>
<select name="idProfesor" id="idProfesor">
    <% for (Profesor p : profesores) { %>
    <option value="<%=p.getIdProfesor()%>">
        <%= p.getNombreCompleto() %>
        </option>
    <% } %>
    </select>
<%
    } else {
%>
    <p>No hay profesores registrados.</p>
<%
    }
%>
<br>
<br>
