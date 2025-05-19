<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");
    String identificador = (String) session.getAttribute("identificador");
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Header</title>
    <link rel="stylesheet" href="css/header.css" />
</head>
<body>
    <header>
        <h1>Sistema de asesorías de la FCC BUAP</h1>

        <% if (identificador != null) { %>
            <div>
                <% if ("alumno".equalsIgnoreCase(tipoUsuario)) { %>
                    <p><strong>Matrícula:</strong> <%= identificador %></p>
                <% } else if ("profesor".equalsIgnoreCase(tipoUsuario)) { %>
                    <p><strong>ID Profesor:</strong> <%= identificador %></p>
                <% } %>
                <p><strong>Sesión iniciada</strong></p>
            </div>
        <% } else { %>
            <p><strong>No has iniciado sesión</strong></p>
        <% } %>
    </header>
</body>
</html>
