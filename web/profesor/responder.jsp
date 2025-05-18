<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Asesoria" %>
<%@ page import="model.DAO.AsesoriaDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>


<%
    // Obtener la sesión
    session = request.getSession();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario"); // Obtener el tipo de usuario
    String identificador = (String) session.getAttribute("identificador"); // Obtener el identificador (matrícula o idProfesor)

    // Verificar si el usuario está logueado
    if (tipoUsuario == null || !tipoUsuario.equals("profesor")) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

        // Obtener los detalles de la solicitud
    int idAsesoria = Integer.parseInt(identificador);
    
    Asesoria asesoria = new AsesoriaDAO().getAsesoriasById(idAsesoria); // Método en DAO que te devuelve una solicitud// Método en DAO que te devuelve una solicitud
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Responder Solicitud</title>
    <link rel="stylesheet" href="../css/styles.css" />
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/nav.jsp" />

    <h2>Responder Solicitud de Asesoría</h2>

    <form action="${pageContext.request.contextPath}/ResponderSolicitudServlet" method="post">
        <input type="hidden" name="idAsesoria" value="<%= asesoria.getIdAsesoria() %>" />

        <label>Alumno: </label>
        <p><%= asesoria.getMatricula() %></p>

        <label>Asignatura: </label>
        <p><%= asesoria.getIdAsignatura() %></p>

        <label>Fecha: </label>
        <p><%= asesoria.getFecha() %></p>

        <label>Hora: </label>
        <p><%= asesoria.getHora() %></p>

        <label>Asunto: </label>
        <p><%= asesoria.getAsunto() %></p>

        <label>Estado:</label>
        <select name="status" required>
            <option value="aceptada">Aceptar</option>
            <option value="denegada">Denegar</option>
        </select><br/><br/>

        <label>Comentario:</label><br/>
        <textarea name="comentario" rows="4" cols="50" placeholder="Escribe tu comentario aquí..." required></textarea><br/><br/>

        <button type="submit">Enviar respuesta</button>
    </form>

    <jsp:include page="../common/footer.jsp" />
</body>
</html>

