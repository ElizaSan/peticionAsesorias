<%@ page import="java.util.List" %>
<%@ page import="model.Asignatura" %>
<%@ page import="model.DAO.AsignaturaDAO" %>

<%
    AsignaturaDAO asignaturaDAO = new AsignaturaDAO();
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    
<label>Asignatura:</label><br/>
 <select name="idAsignatura">
     <%
         List<Asignatura> asignaturas = asignaturaDAO.getAllAsignaturas();
         if (asignaturas != null && !asignaturas.isEmpty()) {
             for (Asignatura a : asignaturas) { 
     %>
         <option value="<%= a.getIdAsignatura() %>"><%= a.getNombre() %></option>
     <% 
             }
         } else {
     %>
         <option value="">No hay asignaturas disponibles</option>
     <% } %>
 </select>
<br>
<br>