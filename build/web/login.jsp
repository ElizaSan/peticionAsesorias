<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar</title>
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/header.css" />
        <link rel="stylesheet" href="css/nav.css" />
        <link rel="stylesheet" href="css/footer.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="css/login.css" />
        <script src="js/scripts.js"></script>
    </head>
    
    <body>
        <jsp:include page="/common/header.jsp" />
        <jsp:include page="/common/nav.jsp" />

        <h1>Ingresar</h1>

        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
            <label>Tipo de Usuario:</label>
            <div class="radio-group">
                <label for="alumno">
                    <input type="radio" id="alumno" name="tipoUsuario" value="alumno" checked />
                    Alumno
                </label>

                <label for="profesor">
                    <input type="radio" id="profesor" name="tipoUsuario" value="profesor" />
                    Profesor
                </label>
            </div>

            <label>Matrícula o ID Profesor:</label><br/>
            <input type="text" name="identificador" maxlength="9" required /><br/><br/>

            <label for="password">Contraseña:</label><br/>           
            <div class="password-container">
                <input type="password" id="password" name="password" maxlength="20" autocomplete="off" required />          
                <i class="fa-solid fa-eye password-toggle" id="togglePassword"></i>
            </div><br/><br/> 

            <button type="submit">Ingresar</button>
        </form>

        <jsp:include page="/common/footer.jsp" />
        
    </body>
</html>
