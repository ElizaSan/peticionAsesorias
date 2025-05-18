<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Asignatura" %>
<%@ page import="model.DAO.AsignaturaDAO" %>

<%
    AsignaturaDAO asignaturaDAO = new AsignaturaDAO();
    List<Asignatura> asignaturas = null;
    try {
        asignaturas = asignaturaDAO.getAllAsignaturas();
    } catch (Exception e) {
        out.println("<option value=''>Error al obtener asignaturas</option>");
    }
%>

<label>Asignatura:</label><br/>
<select name="idAsignatura">
    <%
        if (asignaturas != null && !asignaturas.isEmpty()) {
            for (Asignatura a : asignaturas) {
    %>
                <option value="<%= a.getIdAsignatura() %>"><%= a.getNombre() %></option>
    <%
            }
        } else {
    %>
            <option value="">No hay asignaturas disponibles.</option>
    <%
        }
    %>
</select>
<br><br>
