<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de alumno</title>
        <link rel="stylesheet" href="../css/styles.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <script src="../js/scripts.js"></script>
    </head>
    
    <body>
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/nav.jsp" />
        
        <h1>Registro de Alumno</h1>
        

        <form action="${pageContext.request.contextPath}/RegistroServlet" method="post" >
            
            <input type="hidden" name="tipoUsuario" value="alumno" />
            
            <label for="matricula">Matrícula:</label><br/>
            <input type="text" id="matricula" name="matricula" maxlength="9" pattern="\d{9}" title="Debe contener 9 dígitos" required /><br/><br/>
            
            <label for="nombreCompleto">Nombre completo:</label><br/>
            <input type="text" id="nombreCompleto" name="nombreCompleto" required pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]{3,100}"/><br/><br/>

            <label for="programaEducativo">Programa educativo:</label><br/>
            <select name="programaEducativo" id="programaEducativo" required>
                <option value="ICC">ICC - Ingeniería en Ciencias de la Computación</option>
                <option value="LCC">LCC - Licenciatura en Ciencias de la Computación</option>
                <option value="ITI">ITI - Ingeniería en Tecnologías de la Información</option>
            </select><br/><br/>

            <label for="password">Contraseña:</label><br/>           
            <div class="password-container">
            <input type="password" id="password" name="password" maxlength="20" autocomplete="off" pattern=".{8,}"
            title="La contraseña debe tener al menos 8 caracteres"required />          
            <i class="fa-solid fa-eye password-toggle" id="togglePassword"></i>
            </div><br/><br/>

            <button type="submit">Registrarme</button>
        </form>

        <jsp:include page="../common/footer.jsp" />


    </body>
</html>
