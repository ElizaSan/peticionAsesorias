<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session = request.getSession();
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");
    String identificador = (String) session.getAttribute("identificador");
%>


    <nav>       
        <ul>
            <li><a href="${pageContext.request.contextPath}/">Inicio</a></li>

            <% if (identificador == null || tipoUsuario == null) { %>
                <li><a href="${pageContext.request.contextPath}/registro.jsp">Registrarse</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">Ingresar</a></li>
            <% } else if ("alumno".equalsIgnoreCase(tipoUsuario)) { %>
                <li><a href="${pageContext.request.contextPath}/alumno/misSolicitudes.jsp">Mis solicitudes</a></li>
                <li><a href="${pageContext.request.contextPath}/alumno/formSolicitud.jsp">Solicitar asesoría</a></li>
                <li><a href="<%= request.getContextPath() %>/LogoutServlet">Cerrar sesión</a></li>
            <% } else if ("profesor".equalsIgnoreCase(tipoUsuario)) { %>
                <li><a href="${pageContext.request.contextPath}/profesor/solicitudes.jsp">Solicitudes del profesor</a></li>
                <li><a href="<%= request.getContextPath() %>/LogoutServlet">Cerrar sesión</a></li>               
            <% } else { %>
                <li><a href="${pageContext.request.contextPath}/registro.jsp">Registrarse</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">Ingresar</a></li>
            <% } %>
        </ul>
    </nav>

