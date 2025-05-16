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
import javax.servlet.http.HttpSession;



public class LoginServlet extends HttpServlet {

    private AlumnoDAO alumnoDAO;
    private ProfesorDAO profesorDAO;

    @Override
    public void init() {
        alumnoDAO = new AlumnoDAO();
        profesorDAO = new ProfesorDAO();
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tipoUsuario = request.getParameter("tipoUsuario"); // "alumno" o "profesor"
        String identificador = request.getParameter("identificador"); // matricula o idProfesor
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        try {
            if ("alumno".equalsIgnoreCase(tipoUsuario)) {
                Alumno alumno = alumnoDAO.getAlumnoByMatricula(identificador);
                if (alumno != null && alumno.getPassword().equals(password)) {
                    session.setAttribute("usuario", alumno);
                    session.setAttribute("tipoUsuario", "alumno");
                    response.sendRedirect(request.getContextPath() + "/alumno/misSolicitudes.jsp");
                } else {
                    response.getWriter().println("Matrícula o contraseña incorrecta.");
                }
            } else if ("profesor".equalsIgnoreCase(tipoUsuario)) {
                int idProf = Integer.parseInt(identificador);
                Profesor profesor = profesorDAO.getProfesorById(idProf);
                if (profesor != null && profesor.getPassword().equals(password)) {
                    session.setAttribute("usuario", profesor);
                    session.setAttribute("tipoUsuario", "profesor");
                    response.sendRedirect(request.getContextPath() + "/profesor/solicitudes.jsp");
                } else {
                    response.getWriter().println("ID o contraseña incorrecta.");
                }
            } else {
                response.getWriter().println("Tipo de usuario no válido.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error en el sistema: " + e.getMessage());
        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
