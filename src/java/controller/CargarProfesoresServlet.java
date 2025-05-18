package controller;

import model.Profesor;
import model.DAO.ProfesorDAO;

import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CargarProfesoresServlet extends HttpServlet {

    private ProfesorDAO profesorDAO;

    @Override
    public void init() {
        profesorDAO = new ProfesorDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                try {
                // Obtener todos los profesores desde la base de datos
                List<Profesor> profesores = profesorDAO.getAllProfesores();
                request.setAttribute("profesores", profesores);  // Guardar los profesores en el request

                // Redirigir a formSolicitud.jsp
                request.getRequestDispatcher("/alumno/formSolicitud.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Error al cargar los profesores: " + e.getMessage());
                    request.getRequestDispatcher("/error.jsp").forward(request, response); // Redirige a una página de error
                }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
