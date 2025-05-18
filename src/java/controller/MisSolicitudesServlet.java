package controller;

import model.Asesoria;
import model.DAO.AsesoriaDAO;

import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MisSolicitudesServlet extends HttpServlet {
    private AsesoriaDAO asesoriaDAO;

    @Override
    public void init() {
        asesoriaDAO = new AsesoriaDAO();
    }
       
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener la matrícula del alumno desde la sesión
        HttpSession session = request.getSession();
        String matricula = (String) session.getAttribute("matricula");
        
        if (matricula == null) {
            // Redirigir a la página de login si no hay matrícula en la sesión
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            // Obtener las solicitudes de asesoría para el alumno desde la base de datos
            List<Asesoria> listaSolicitudes = asesoriaDAO.getAsesoriasByAlumno(matricula);
            
            // Guardar las solicitudes en el request
            request.setAttribute("listaSolicitudes", listaSolicitudes);

            // Redirigir a la página misSolicitudes.jsp
            request.getRequestDispatcher("/alumno/misSolicitudes.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al obtener las solicitudes de asesoría: " + e.getMessage());
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
