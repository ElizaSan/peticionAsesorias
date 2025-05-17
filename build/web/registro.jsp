<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="css/styles.css" />
        <script src="js/scripts.js"></script>
    </head>
    <body>
          <header>
            <h1>Registro</h1>
          </header>

          <form action="RegistroServlet" method="post">
            <label for="tipoUsuario">Tipo de Usuario:</label><br/>
            <input type="radio" id="alumno" name="tipoUsuario" value="alumno" checked />
            <label for="alumno">Alumno</label>
            <input type="radio" id="profesor" name="tipoUsuario" value="profesor" />
            <label for="profesor">Profesor</label><br/><br/>

            <!-- Campos comunes -->
            <label for="nombreCompleto">Nombre Completo:</label><br/>
            <input type="text" id="nombreCompleto" name="nombreCompleto" required /><br/><br/>

            <label for="password">Contraseña:</label><br/>
            <input type="password" id="password" name="password" required /><br/><br/>

            <!-- Campos para Alumno -->
            <div id="alumnoFields" style="display:block;">
              <label for="matricula">Matrícula:</label><br/>
              <input type="text" id="matricula" name="matricula" required /><br/><br/>

              <label for="programaEducativo">Programa Educativo:</label><br/>
              <select name="programaEducativo" required>
                <option value="ICC">ICC</option>
                <option value="LCC">LCC</option>
                <option value="ITI">ITI</option>
              </select><br/><br/>
            </div>

            <!-- Campos para Profesor -->
            <div id="profesorFields" style="display:none;">
              <label for="idProfesor">ID Profesor:</label><br/>
              <input type="text" id="idProfesor" name="idProfesor" required /><br/><br/>
            </div>

            <button type="submit">Registrar</button>
          </form>

          <jsp:include page="common/footer.jsp" />
    </body>
</html>
