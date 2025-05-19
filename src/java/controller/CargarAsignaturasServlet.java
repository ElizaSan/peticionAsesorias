package controller;

import model.Asesoria;
import model.DAO.AsesoriaDAO;
import model.Asignatura;
import model.DAO.AsignaturaDAO;

import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CargarAsignaturasServlet extends HttpServlet {

    private AsignaturaDAO asignaturaDAO;
    private AsesoriaDAO asesoriaDAO;
    
    @Override
    public void init() {
        asesoriaDAO = new AsesoriaDAO();
        asignaturaDAO = new AsignaturaDAO();
    }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
               try {
            // Obtener todas las asignaturas desde la base de datos
            List<Asignatura> asignaturas = asignaturaDAO.getAllAsignaturas();
            request.setAttribute("asignaturas", asignaturas);  // Guardar las asignaturas en el request

            // Redirigir a formSolicitud.jsp
            request.getRequestDispatcher("/alumno/formSolicitud.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Error al cargar las asignaturas: " + e.getMessage());
                request.getRequestDispatcher("/error.jsp").forward(request, response); // Redirige a una página de error
            }
               
            int idAsignatura = 1;  // valor predeterminado si no se selecciona ninguna asignatura 
             
            String idAsignaturaStr = request.getParameter("idAsignatura");
            if (idAsignaturaStr != null && !idAsignaturaStr.isEmpty()) {
                idAsignatura = Integer.parseInt(idAsignaturaStr);  
            }  
            
            Asesoria asesoria = new Asesoria();
            asesoria.setIdAsignatura(idAsignatura);
               
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
