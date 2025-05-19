<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Asesoria" %>
<%@ page import="model.DAO.AsesoriaDAO" %>
<%@ page import="model.DAO.AsignaturaDAO" %>
<%@ page import="model.DAO.ProfesorDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    session = request.getSession();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");
    String identificador = (String) session.getAttribute("identificador");

    AsesoriaDAO asesoriasDAO = new AsesoriaDAO(); 
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mis solicitudes</title>
    <link rel="stylesheet" href="../css/styles.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/nav.css" />
    <link rel="stylesheet" href="../css/footer.css" />
    <link rel="stylesheet" href="../css/solicitudes.css" />
</head>    

<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />

    <%
        AsignaturaDAO asignaturaDAO = new AsignaturaDAO();
        ProfesorDAO profesorDAO = new ProfesorDAO();
        String nombre = (String) session.getAttribute("nombre");
    %>

    <%
        if (identificador == null || tipoUsuario == null) {
    %>
        <article>
            <h3>Debes iniciar sesión para ver tus solicitudes.</h3>
        </article>
    <% 
        } else {
    %>

    <h2>Mis Solicitudes</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Asignatura</th>
                <th>Profesor</th>
                <th>Fecha programada de asesoría</th>
                <th>Hora</th>
                <th>Asunto</th>
                <th>Estado</th>
                <th>Comentario del profesor</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Asesoria> lista = asesoriasDAO.getAsesoriasByAlumno(identificador);
                if (lista != null && !lista.isEmpty()) {
                    for (Asesoria a : lista) {
            %>
                <tr>
                    <td><%= a.getIdAsesoria() %></td>
                    <td><%= asignaturaDAO.getAsignaturaById(a.getIdAsignatura()).getNombre() %></td>
                    <td><%= profesorDAO.getProfesorById(a.getIdProfesor()).getNombreCompleto() %></td>
                    <td><%= a.getFecha() %></td>
                    <td><%= a.getHora() %></td>
                    <td><%= a.getAsunto() %></td>
                    <td style="
                        <% if (a.getStatus().equalsIgnoreCase("aceptada")) { %>
                            color: green;
                        <% } else if (a.getStatus().equalsIgnoreCase("denegada")) { %>
                            color: red;
                        <% } %>">
                        <%= a.getStatus().toUpperCase().replace('_', ' ') %>
                    </td>
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
        </tbody>
    </table>

    <a href="formSolicitud.jsp">Nueva Solicitud</a>

    <%
        }
    %>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>
