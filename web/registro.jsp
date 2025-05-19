<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/header.css" />
        <link rel="stylesheet" href="css/nav.css" />
        <link rel="stylesheet" href="css/footer.css" />
        <link rel="stylesheet" href="css/registro.css" />

        <script src="js/scripts.js" defer></script>
    </head>
            
    <body>
        <jsp:include page="/common/header.jsp" />
        <jsp:include page="/common/nav.jsp" />

        <h1>Registro</h1>
        
        <article>
            <section>
               <h2>Selecciona el tipo de usuario para registrarte:</h2>
               <div>
                   <a href="${pageContext.request.contextPath}/alumno/registroAlumno.jsp">
                       <button type="button">Soy alumno</button>
                   </a>
                   <a href="${pageContext.request.contextPath}/profesor/registroProfesor.jsp">
                       <button type="button">Soy profesor</button>
                   </a>
               </div>
           </section>
        </article>

        <jsp:include page="/common/footer.jsp" />
        
    </body>
</html>
