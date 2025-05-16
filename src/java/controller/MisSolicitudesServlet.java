package controller;

import model.Alumno;
import model.Asesoria;
import model.DAO.AsesoriaDAO;

import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
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
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if(session == null || !"alumno".equals(session.getAttribute("tipoUsuario"))) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        Alumno alumno = (Alumno) session.getAttribute("usuario");
        try {
            List<Asesoria> lista = asesoriaDAO.getAsesoriasByAlumno(alumno.getMatricula());
            request.setAttribute("listaSolicitudes", lista);
            request.getRequestDispatcher("/alumno/misSolicitudes.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al cargar solicitudes: " + e.getMessage());
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
