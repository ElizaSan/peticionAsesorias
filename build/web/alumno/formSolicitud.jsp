<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Asignatura" %>
<%@ page import="model.Profesor" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
    

<%
    // Obtener la sesión
    
    session = request.getSession();
    java.time.LocalDate hoy = java.time.LocalDate.now();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");  // Obtener el tipo de usuario
    String identificador = (String) session.getAttribute("identificador"); // Obtener el identificador (matrícula o idProfesor)
    String nombreCompleto = (String) session.getAttribute("nombreCompleto"); // Obtener el nombre del alumno
    String programaEducativo = (String) session.getAttribute("programaEducativo"); 
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formato de solicitud de asesoría</title>
        <link rel="stylesheet" href="../css/styles.css" />
    </head>
    
    <body>
       
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/nav.jsp" />
        
        
        
        <%
            // Verificar si el usuario ha iniciado sesión
            if (identificador == null || tipoUsuario == null) {
        %>
            <!-- Si no ha iniciado sesión, mostrar el mensaje de inicio de sesión o registro -->
            <h3>Debes iniciar sesión para llenar una solicitud.</h3>
            
        <% 
            } else {
        %>
        
            
        
            <!-- Mostrar el formulario de solicitud -->
            <h1>Formato de solicitud de asesoría</h1>
            
            <form action="${pageContext.request.contextPath}/SolicitudServlet" method="post">
                <label>Nombre Completo:</label><br/>
                <input type="text" name="nombreCompleto" value="<%= nombreCompleto%>" readonly /><br/><br/>

                <label>Programa Educativo:</label><br/>
                <input type="text" name="programaEducativo" value="<%= programaEducativo %>" readonly /><br/><br/>

                <label>Matricula:</label><br/>
                <input type="text" name="matricula" value="<%= identificador %>" readonly /><br/><br/>


                <jsp:include page="../profesor/ListaProfesores.jsp" />
                
                <label>¿Eres alumno de este profesor?</label><br/>
                <input type="radio" name="alumnoEsProfesor" value="true" /> Sí
                <input type="radio" name="alumnoEsProfesor" value="false" checked /> No<br/><br/>

                <jsp:include page="../profesor/ListaAsignaturas.jsp" />
                
                <label>Fecha de la asesoría:</label><br/>
                <input type="date" name="fecha" required min="<%= hoy%>" /><br/><br/>

                <label>Hora de la asesoría:</label><br/>
                <input type="time" name="hora" required /><br/><br/>

                <label>Asunto:</label><br/>
                <textarea name="asunto" rows="3" cols="40"></textarea><br/><br/>

                <button type="submit">Enviar Solicitud</button>
            </form>
        
        <% 
            } 
        %>

        
     
        
        
        
        
        <jsp:include page="../common/footer.jsp" />

    </body>
</html>
