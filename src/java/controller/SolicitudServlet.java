package controller;

import model.Asesoria;
import model.DAO.AsesoriaDAO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class SolicitudServlet extends HttpServlet {
    private AsesoriaDAO asesoriaDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        asesoriaDAO = new AsesoriaDAO();
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener parámetros del formulario
        String nombreCompleto = request.getParameter("nombreCompleto"); // opcional si no usas aquí
        String matricula = request.getParameter("matricula");
        String programaEducativo = request.getParameter("programaEducativo"); // opcional si no usas aquí
        int idAsignatura = Integer.parseInt(request.getParameter("idAsignatura"));
        int idProfesor = Integer.parseInt(request.getParameter("idProfesor"));
        boolean alumnoEsProfesor = Boolean.parseBoolean(request.getParameter("alumnoEsProfesor"));
        String fecha = request.getParameter("fecha"); // "YYYY-MM-DD"
        String hora = request.getParameter("hora");   // "HH:MM"
        String asunto = request.getParameter("asunto");

        // Crear objeto Asesoria
        Asesoria asesoria = new Asesoria();
        asesoria.setMatricula(matricula);
        asesoria.setIdProfesor(idProfesor);
        asesoria.setIdAsignatura(idAsignatura);
        asesoria.setFecha(fecha);
        asesoria.setHora(hora);
        asesoria.setAsunto(asunto);
        asesoria.setAlumnoEsProfesor(alumnoEsProfesor);
        asesoria.setStatus("en_proceso"); // estado inicial
        asesoria.setComentarioProfesor(null);

        try {
            asesoriaDAO.insertAsesoria(asesoria);
            // Redirigir a lista de solicitudes del alumno
            response.sendRedirect(request.getContextPath() + "/MisSolicitudesServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al guardar la solicitud: " + e.getMessage());
        }
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
