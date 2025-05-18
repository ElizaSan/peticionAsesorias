<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de profesor</title>
        <link rel="stylesheet" href="../css/styles.css" />
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/nav.jsp" />
        
        <h1>Registro de profesor</h1>
        
        <form action="${pageContext.request.contextPath}/RegistroServlet" method="post">
            <input type="hidden" name="tipoUsuario" value="profesor" /> 
            
            <label for="idProfesor">ID Profesor:</label><br/>
            <input type="text" id="idProfesor" name="idProfesor" required /><br/><br/>
            
            <label for="nombreCompleto">Nombre completo:</label><br/>
            <input type="text" id="nombreCompleto" name="nombreCompleto" required /><br/><br/>

            <label for="password">Contraseña:</label><br/>
            <input type="password" id="password" name="password" required /><br/><br/>

            <button type="submit">Registrarme</button>
        </form>

        <jsp:include page="../common/footer.jsp" />

    </body>
</html>
