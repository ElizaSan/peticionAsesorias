package controller;

import model.Alumno;
import model.Profesor;
import model.DAO.AlumnoDAO;
import model.DAO.ProfesorDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistroServlet extends HttpServlet {
    
    private AlumnoDAO alumnoDAO;
    private ProfesorDAO profesorDAO;

    @Override
    public void init() {
        alumnoDAO = new AlumnoDAO();
        profesorDAO = new ProfesorDAO();
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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

            Alumno alumno = new Alumno();
            alumno.setMatricula(matricula);
            alumno.setNombreCompleto(nombreCompleto);
            alumno.setProgramaEducativo(programaEducativo);
            alumno.setPassword(password);

            try {
                // Registrar al alumno
                alumnoDAO.insertAlumno(alumno);
                response.sendRedirect(request.getContextPath() + "/index.jsp"); // Redirigir a la página de inicio
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error al registrar alumno: " + e.getMessage());
            }

        } else if ("profesor".equals(tipoUsuario)) {
            // Obtener los parámetros del formulario para Profesor
            String nombreCompleto = request.getParameter("nombreCompleto");
            String idProfesor = request.getParameter("idProfesor");
            String password = request.getParameter("password");

            Profesor profesor = new Profesor();
            profesor.setIdProfesor(Integer.parseInt(idProfesor)); // Convertir ID a int
            profesor.setNombreCompleto(nombreCompleto);
            profesor.setPassword(password);

            try {
                // Registrar al profesor
                profesorDAO.insertProfesor(profesor);
                response.sendRedirect(request.getContextPath() + "/index.jsp"); // Redirigir a la página de inicio
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().println("Error al registrar profesor: " + e.getMessage());
            }
        }    
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
