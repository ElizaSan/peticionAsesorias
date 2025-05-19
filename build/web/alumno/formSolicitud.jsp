<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Asignatura" %>
<%@ page import="model.Profesor" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    session = request.getSession();
    java.time.LocalDate hoy = java.time.LocalDate.now();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");
    String identificador = (String) session.getAttribute("identificador");
    String nombreCompleto = (String) session.getAttribute("nombreCompleto");
    String programaEducativo = (String) session.getAttribute("programaEducativo"); 
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Formato de solicitud de asesoría</title>
    <link rel="stylesheet" href="../css/styles.css" />
    <link rel="stylesheet" href="../css/header.css" />
    <link rel="stylesheet" href="../css/nav.css" />
    <link rel="stylesheet" href="../css/footer.css" />
    <link rel="stylesheet" href="../css/form.css" />
</head>

<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />

    <%
        if (identificador == null || tipoUsuario == null) {
    %>
        <article>
            <h3>Debes iniciar sesión para llenar una solicitud.</h3>            
        </article>
    <% 
        } else {
    %>

    <form action="${pageContext.request.contextPath}/SolicitudServlet" method="post">
        <h1>Formato de solicitud de asesoría</h1>

        <label>Nombre Completo:</label>
        <input type="text" name="nombreCompleto" value="<%= nombreCompleto %>" readonly />

        <label>Programa Educativo:</label>
        <input type="text" name="programaEducativo" value="<%= programaEducativo %>" readonly />

        <label>Matrícula:</label>
        <input type="text" name="matricula" value="<%= identificador %>" readonly />

        <jsp:include page="../profesor/ListaProfesores.jsp" />

        <label>¿Eres alumno de este profesor?</label>
        <input type="radio" name="alumnoEsProfesor" value="true" /> Sí
        <input type="radio" name="alumnoEsProfesor" value="false" checked /> No

        <jsp:include page="../profesor/ListaAsignaturas.jsp" />

        <label>Fecha de la asesoría:</label>
        <input type="date" name="fecha" required min="<%= hoy %>" />

        <label>Hora de la asesoría:</label>
        <input type="time" name="hora" min="07:00" max="22:00" required />

        <label>Asunto:</label>
        <textarea name="asunto" rows="3" required></textarea>

        <button type="submit">Enviar Solicitud</button>
    </form>

    <%
        }
    %>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>
