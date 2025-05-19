<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Asesoria" %>
<%@ page import="model.DAO.AsesoriaDAO" %>
<%@ page import="model.DAO.AsignaturaDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    // Obtener la sesión
    session = request.getSession();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");  // Obtener el tipo de usuario
    String identificador = (String) session.getAttribute("identificador"); // Obtener el identificador (matrícula o idProfesor)
    
    //El paso que no salia ya quedo
    AsesoriaDAO asesoriasDAO = new AsesoriaDAO(); 
    List<Asesoria> lista = asesoriasDAO.getAsesoriasByAlumno(identificador);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis solicitudes</title>
        <link rel="stylesheet" href="../css/styles.css" />
    </head>    
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/nav.jsp" />
        
        <%
            AsignaturaDAO asignaturaDAO = new AsignaturaDAO();

            String nombre = (String) session.getAttribute("nombre");
        %>
        
        
        <%
            // Verificar si el usuario ha iniciado sesión
            if (identificador == null || tipoUsuario == null) {
        %>
            <!-- Si no ha iniciado sesión, mostrar el mensaje de inicio de sesión o registro -->
            <h3>Debes iniciar sesión para ver tus solicitudes.</h3>
        <% 
            } else {
        %>
        <!-- Si está logueado, mostrar la tabla de solicitudes -->
        <h2>Mis Solicitudes</h2>
        
            <table border="1" cellpadding="5" cellspacing="0">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Asignatura</th>
                        <th>Fecha programada de asesoría (YYYY-MM-DD)</th>
                        <th>Hora (24h)</th>
                        <th>Asunto</th>
                        <th>Estado</th>
                        <th>Comentario del profesor</th>
                    </tr>
                </thead>
                <%
                    if (lista != null && !lista.isEmpty()) {
                        for (Asesoria a : lista) {
                %>
                        <tr>
                            <td><%= a.getIdAsesoria() %></td>
                            
                            
                            <td><%= asignaturaDAO.getAsignaturaById(a.getIdAsignatura()).getNombre()%></td>
                            
                            <td><%= a.getFecha() %></td>
                            <td><%= a.getHora() %></td>
                            <td><%= a.getAsunto() %></td>
                                                      
                            <td 
                            <% if (a.getStatus().equalsIgnoreCase("aceptada")) { %>
                                style="color:green"
                            <% } else if (a.getStatus().equalsIgnoreCase("denegada")) { %>
                                style="color:red"
                            <% } %>>
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
            </table>
        <% 
            }
        %>
        <br><br><a href="formSolicitud.jsp">Nueva Solicitud</a>
        

        <jsp:include page="../common/footer.jsp" />

    </body>
</html>
