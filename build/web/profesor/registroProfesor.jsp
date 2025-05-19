<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de profesor</title>
        <link rel="stylesheet" href="../css/styles.css" />
        <link rel="stylesheet" href="../css/header.css" />
        <link rel="stylesheet" href="../css/nav.css" />
        <link rel="stylesheet" href="../css/footer.css" />
        <link rel="stylesheet" href="../css/registro_profesor.css" /> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <script src="../js/scripts.js"></script>
    </head>
    
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/nav.jsp" />
        
        <h1>Registro de profesor</h1>
        
        <form action="${pageContext.request.contextPath}/RegistroServlet" method="post">
            <input type="hidden" name="tipoUsuario" value="profesor" /> 
            
            <label for="idProfesor">ID Profesor:</label><br/>
            <input type="text" id="idProfesor" name="idProfesor" size="9" maxlength="9" pattern="\d{9}" inputmode="numeric" required /><br/><br/>
            
            <label for="nombreCompleto">Nombre completo:</label><br/>
            <input type="text" id="nombreCompleto" name="nombreCompleto" maxlength="50" required /><br/><br/>

            <label for="password">Contraseña:</label><br/>           
            <div class="password-container">
                <input type="password" id="password" name="password" maxlength="20" autocomplete="off" required=""/>          
            <i class="fa-solid fa-eye password-toggle" id="togglePassword"></i>
            </div>
            
            <button type="submit">Registrarme</button>
        </form>

        <jsp:include page="../common/footer.jsp" />

    </body>
</html>
