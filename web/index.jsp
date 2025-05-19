<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Asesorías FCC BUAP</title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/nav.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <script src="js/scripts.js" defer></script>
</head>

<body>
    <jsp:include page="/common/header.jsp" />
    <jsp:include page="/common/nav.jsp" />

    <%
        session = request.getSession();
        String mensajeRegistro = (String) session.getAttribute("mensajeRegistro");
    %>

    <div class="contenido">
        <div class="bienvenida">
            <img src="https://www.cs.buap.mx/img/logo_fcc.png" >
            <h1>Bienvenido</h1>
            <p>Este sistema permite a los estudiantes de la Facultad de Ciencias de la Computación gestionar solicitudes de asesoría académica con sus profesores. Los alumnos pueden registrar sus peticiones, consultar su estado y recibir retroalimentación directa.</p>
        </div>

        <aside class="anuncios">
            <h3>Anuncios</h3>
            <p>Consulta las actividades recientes de la universidad.</p>
            <ul>
                <li><a href="https://www.cs.buap.mx/asamblea2025.php" target="_blank">Mesa de Diálogo 2025</a></li>
                <li><a href="https://www.facebook.com/VinculandoteFcc" target="_blank">Síquenos a traves de Facebook en Vinculación FCC - BUAP</a></li>
                
            </ul>
            
        </aside>
    </div>

    <%
        if (mensajeRegistro != null) {
    %>
        <div class="success-message">
            <%= mensajeRegistro %>
        </div>
    <%
            session.removeAttribute("mensajeRegistro");
        }
    %>

    <jsp:include page="/common/footer.jsp" />
</body>
</html>
