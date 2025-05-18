<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");  // Obtener tipo de usuario (alumno o profesor)
    String identificador = (String) session.getAttribute("identificador"); // Obtener el identificador (matrícula o idProfesor)
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
            
            <% if (identificador != null) { %> <!-- Verificar si hay un identificador en la sesión -->
            <div>
                <% if ("alumno".equals(tipoUsuario)) { %>
                    <p><strong>Matricula: </strong><%= identificador %></p> <!-- Mostrar matrícula si es alumno -->
                <% } else if ("profesor".equals(tipoUsuario)) { %>
                    <p><strong>ID Profesor: </strong><%= identificador %></p> <!-- Mostrar ID de profesor si es profesor -->
                <% } %>
                <p><strong>Sesión iniciada</strong></p>
            </div>
            <% } else { %> <!-- Si no hay sesión activa -->
                <p><strong>No has iniciado sesión</strong></p>
            <% } %>
      </header>
    </body>
</html>
