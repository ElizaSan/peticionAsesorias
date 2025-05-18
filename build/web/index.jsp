<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asesorías FCC BUAP</title>
        <link rel="stylesheet" href="css/styles.css" />
        <script src="js/scripts.js" defer></script>
    </head>
    
    <body>
        <jsp:include page="/common/header.jsp" />
        <jsp:include page="/common/nav.jsp" />
        
     
        <article>
          <section>
            <h2>Bienvenido</h2>
            
          </section>
        </article>

        <%
            // Obtener el mensaje de la sesión
            session = request.getSession();
            String mensajeRegistro = (String) session.getAttribute("mensajeRegistro");

            // Mostrar el mensaje si existe
            if (mensajeRegistro != null) {
        %>
            <div style="color: green; font-weight: bold;">
                <%= mensajeRegistro %>
            </div>
        <%
            // Eliminar el mensaje después de mostrarlo para que no se repita en futuras visitas
            session.removeAttribute("mensajeRegistro");
            }
                %>
        
        <aside>
          <p>Información adicional o anuncios</p>
        </aside>

      <jsp:include page="/common/footer.jsp" />
    </body>
        
</html>
