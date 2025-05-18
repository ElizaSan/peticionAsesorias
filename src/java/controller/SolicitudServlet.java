package controller;

import model.Asesoria;
import model.DAO.AsesoriaDAO;
import model.DAO.AsignaturaDAO;
import model.DAO.ProfesorDAO;
import model.Asignatura;
import model.Profesor;

import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;

public class SolicitudServlet extends HttpServlet {

    private AsesoriaDAO asesoriaDAO;
    private AsignaturaDAO asignaturaDAO;
    private ProfesorDAO profesorDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        asesoriaDAO = new AsesoriaDAO();
        asignaturaDAO = new AsignaturaDAO();
        profesorDAO = new ProfesorDAO();
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
        // Obtener parámetros del formulario
        String nombreCompleto = request.getParameter("nombreCompleto");
        String programaEducativo = request.getParameter("programaEducativo");
        String matricula = request.getParameter("matricula");
        String idProfesor = request.getParameter("idProfesor");
        String idAsignatura = request.getParameter("idAsignatura");
        boolean alumnoEsProfesor = Boolean.parseBoolean(request.getParameter("alumnoEsProfesor"));
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String asunto = request.getParameter("asunto");
        

        

        Asesoria asesoria = new Asesoria();
        
        
        asesoria.setMatricula(matricula);          
        asesoria.setIdProfesor(Integer.parseInt(idProfesor));
        asesoria.setIdAsignatura(Integer.parseInt(idAsignatura));
        asesoria.setFecha(fecha);
        asesoria.setHora(hora);
        asesoria.setAsunto(asunto);
        asesoria.setAlumnoEsProfesor(alumnoEsProfesor);
        asesoria.setStatus("en_proceso");
        asesoria.setComentarioProfesor(null);
        
        
        

        try {
            asesoriaDAO.insertAsesoria(asesoria);

            HttpSession session = request.getSession();
            session.setAttribute("mensajeRegistro", "¡Solicitud de asesoría registrada con éxito!");

            response.sendRedirect(request.getContextPath() + "/");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al guardar la solicitud: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para manejar solicitudes de asesoría";
    }
}
