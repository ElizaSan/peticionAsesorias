<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de alumno</title>
    </head>
    
    <body>
        
        
        <h1>Registro de Alumno</h1>
        

        <form action="${pageContext.request.contextPath}/RegistroServlet" method="post" onsubmit="registroExitoso();">
            
            <input type="hidden" name="tipoUsuario" value="alumno" />
            
            <label for="matricula">Matrícula:</label><br/>
            <input type="text" id="matricula" name="matricula" pattern="\d{9}" title="Debe contener 9 dígitos" required /><br/><br/>
            
            <label for="nombreCompleto">Nombre completo:</label><br/>
            <input type="text" id="nombreCompleto" name="nombreCompleto" required /><br/><br/>

            <label for="programaEducativo">Programa educativo:</label><br/>
            <select name="programaEducativo" id="programaEducativo" required>
                <option value="ICC">ICC - Ingeniería en Ciencias de la Computación</option>
                <option value="LCC">LCC - Licenciatura en Ciencias de la Computación</option>
                <option value="ITI">ITI - Ingeniería en Tecnologías de la Información</option>
            </select><br/><br/>

            <label for="password">Contraseña:</label><br/>
            <input type="password" id="password" name="password" required /><br/><br/>

            <button type="submit">Registrarme</button>
        </form>

        

    </body>
</html>
