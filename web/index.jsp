<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asesorias </title>
        <link rel="stylesheet" href="css/styles.css" />
    </head>
    <body>
        <jsp:include page="../common/header.jsp" />

      <nav>
        <!-- Links a login de alumno y profesor -->
        <ul>
          <li><a href="index.jsp">Inicio</a></li>
          <li><a href="alumno/formSolicitud.jsp">Solicitar Asesoría</a></li>
          <li><a href="profesor/solicitudes.jsp">Solicitudes Profesor</a></li>
          <li><a href="login.jsp">Login</a></li>
        </ul>
      </nav>

      <article>
        <section>
          <h2>Bienvenido</h2>
          <p>Por favor, ingresa para ver o solicitar asesorías.</p>
        </section>
      </article>

      <aside>
        <p>Información adicional o anuncios</p>
      </aside>

      <jsp:include page="../common/footer.jsp" />
    </body>
        
</html>
