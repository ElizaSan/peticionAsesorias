package controller;

import model.Asesoria;
import model.DAO.AsesoriaDAO;
import model.Profesor;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SolicitudesProfesorServlet extends HttpServlet {
    private AsesoriaDAO asesoriaDAO;

    @Override
    public void init() {
        asesoriaDAO = new AsesoriaDAO();
    }
    
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if(session == null || !"profesor".equals(session.getAttribute("tipoUsuario"))) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        Profesor profesor = (Profesor) session.getAttribute("usuario");
        try {
            
            List<Asesoria> lista = asesoriaDAO.getAsesoriasByProfesor(profesor.getIdProfesor());
            request.setAttribute("listaSolicitudes", lista);
            request.getRequestDispatcher("/profesor/solicitudes.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al cargar solicitudes: " + e.getMessage());
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
