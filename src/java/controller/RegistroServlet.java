package controller;

import model.Alumno;
import model.Profesor;
import model.DAO.AlumnoDAO;
import model.DAO.ProfesorDAO;

import utils.ConexionBD;
import java.sql.Connection;
import java.sql.SQLException;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class RegistroServlet extends HttpServlet {

    private AlumnoDAO alumnoDAO;
    private ProfesorDAO profesorDAO;

    @Override
    public void init() throws ServletException {
        // Inicializar DAOs
        alumnoDAO = new AlumnoDAO();
        profesorDAO = new ProfesorDAO();

        // Verificar la conexión a la base de datos al iniciar el servlet
        try (Connection con = ConexionBD.getConnection()) {
            if (con != null && !con.isClosed()) {
                System.out.println("Conexión exitosa a la base de datos.");
            } else {
                System.out.println("No se pudo establecer la conexión.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error al conectar a la base de datos: " + e.getMessage(), e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tipoUsuario = request.getParameter("tipoUsuario"); // Alumno o Profesor

        if ("alumno".equals(tipoUsuario)) {
            // Obtener los parámetros del formulario para Alumno
            String nombreCompleto = request.getParameter("nombreCompleto");
            String matricula = request.getParameter("matricula");
            String password = request.getParameter("password");
            String programaEducativo = request.getParameter("programaEducativo");

            // Registrar al alumno
            Alumno alumno = new Alumno();
            alumno.setMatricula(matricula);
            alumno.setNombreCompleto(nombreCompleto);
            alumno.setProgramaEducativo(programaEducativo);
            alumno.setPassword(password);

            try {
                // Registrar al alumno
                alumnoDAO.insertAlumno(alumno);
                
                // Almacenar el mensaje en la sesión
                HttpSession session = request.getSession();
                session.setAttribute("mensajeRegistro", "¡Registro exitoso! Ahora puedes iniciar sesión.");
                session.setAttribute("firstVisit", false); // Marcar que ya no es la primera visita

                // Redirigir a index.jsp para mostrar el mensaje
                response.sendRedirect(request.getContextPath() + "/"); 

            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error al registrar alumno: " + e.getMessage());
            }

        } else if ("profesor".equals(tipoUsuario)) {
            // Obtener los parámetros del formulario para profesor
            String nombreCompleto = request.getParameter("nombreCompleto");
            String idProfesor = request.getParameter("idProfesor");
            String password = request.getParameter("password");

            // Registrar al profesor
            Profesor profesor = new Profesor();
            profesor.setIdProfesor(Integer.parseInt(idProfesor)); // Convertir ID a int
            profesor.setNombreCompleto(nombreCompleto);
            profesor.setPassword(password);

            try {
                // Registrar al profesor
                profesorDAO.insertProfesor(profesor);
                
                // Almacenar el mensaje en la sesión
                HttpSession session = request.getSession();
                session.setAttribute("mensajeRegistro", "¡Registro exitoso! Ahora puedes iniciar sesión.");
                session.setAttribute("firstVisit", false); // Marcar que ya no es la primera visita

                // Redirigir a index.jsp para mostrar el mensaje
                response.sendRedirect(request.getContextPath() + "/");

            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error al registrar profesor: " + e.getMessage());
            }
        }    
    }

    @Override
    public String getServletInfo() {
        return "Servlet de registro de alumnos y profesores";
    }
}
