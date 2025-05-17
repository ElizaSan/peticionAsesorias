<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de Profesor</title>
    </head>
    <body>
        <jsp:include page="${pageContext.request.contextPath}/common/header.jsp" />
        <jsp:include page="${pageContext.request.contextPath}/common/nav.jsp" />
        <h1>Registro de Profesor</h1>
        
        <form action="RegistroServlet" method="post" onsubmit="return registroExitoso();">
            <input type="hidden" name="tipoUsuario" value="profesor" />
            
            <label for="idProfesor">ID Profesor:</label><br/>
            <input type="text" id="idProfesor" name="idProfesor" required /><br/><br/>
            
            <label for="nombreCompleto">Nombre Completo:</label><br/>
            <input type="text" id="nombreCompleto" name="nombreCompleto" required /><br/><br/>

            <label for="password">Contraseña:</label><br/>
            <input type="password" id="password" name="password" required /><br/><br/>

            <button type="submit">Registrarme</button>
        </form>

        <jsp:include page="${pageContext.request.contextPath}/common/footer.jsp" />
    </body>
</html>
