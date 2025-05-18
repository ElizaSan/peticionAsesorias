package controller;

import model.Asesoria;
import model.DAO.AsesoriaDAO;
import model.Profesor;
import model.DAO.ProfesorDAO;

import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CargarProfesorServlet extends HttpServlet {

    private ProfesorDAO profesorDAO;
    private AsesoriaDAO asesoriaDAO;
    
    @Override
    public void init() {
        asesoriaDAO = new AsesoriaDAO();
        profesorDAO = new ProfesorDAO();
    }
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
               try {

            List<Profesor> profesores = profesorDAO.getAllProfesores();
            request.setAttribute("profesores", profesores);  

            // Redirigir a formSolicitud.jsp
            request.getRequestDispatcher("/alumno/formSolicitud.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error al cargar los profesores: " + e.getMessage());
                request.getRequestDispatcher("/error.jsp").forward(request, response); // Redirige a una página de error
            }
               
               
            int idProfesor = 1;    // valor predeterminado si no se selecciona ningún profesor
            String idProfesorStr = request.getParameter("idProfesor");
            if (idProfesorStr != null && !idProfesorStr.isEmpty()) {
                idProfesor = Integer.parseInt(idProfesorStr); 
            }
            
            Asesoria asesoria = new Asesoria();
            asesoria.setIdProfesor(idProfesor);  
            
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
