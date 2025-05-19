<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");
    String identificador = (String) session.getAttribute("identificador");
%>


    <header>
        
        <h1>Sistema de asesorías de la FCC BUAP</h1>
        
        <div>
            <% if (identificador != null) { %>
            
                <% if ("alumno".equalsIgnoreCase(tipoUsuario)) { %>
                    <p><strong>Matrícula:</strong> <%= identificador %></p>
                <% } else if ("profesor".equalsIgnoreCase(tipoUsuario)) { %>
                    <p><strong>ID Profesor:</strong> <%= identificador %> </p>
                <% } %>
                <p><strong>Sesión iniciada</strong></p>
            
        <% } else { %>
            <p><strong>No has iniciado sesión</strong></p>
        <% } %>
        </div>


    </header>
