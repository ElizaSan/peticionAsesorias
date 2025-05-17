package controller;

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

    @Override
    public void init() {
        asignaturaDAO = new AsignaturaDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                try {
            // Obtener todas las asignaturas desde la base de datos
            List<Asignatura> asignaturas = asignaturaDAO.getAllAsignaturas();
            request.setAttribute("asignaturas", asignaturas);  // Guardar las asignaturas en el request

            // Redirigir a formSolicitud.jsp
            request.getRequestDispatcher("/alumno/formSolicitud.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al cargar las asignaturas: " + e.getMessage());
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
