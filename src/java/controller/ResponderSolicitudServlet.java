package controller;

import model.DAO.AsesoriaDAO;
import model.Asesoria;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class ResponderSolicitudServlet extends HttpServlet {
    private AsesoriaDAO asesoriaDAO;

    @Override
    public void init() throws ServletException {
        asesoriaDAO = new AsesoriaDAO(); // Asegúrate de que el DAO esté correctamente inicializado
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Validar que el usuario esté logueado como profesor
        HttpSession session = request.getSession();
        if (session == null || !"profesor".equals(session.getAttribute("tipoUsuario"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            // Obtener parámetros
            int idAsesoria = Integer.parseInt(request.getParameter("idAsesoria"));
            String status = request.getParameter("status"); // "aceptada" o "denegada"
            String comentario = request.getParameter("comentario");

            // Actualizar la solicitud
            asesoriaDAO.actualizarStatusComentario(idAsesoria, status, comentario);

            // Redirigir a la página de solicitudes del profesor
            response.sendRedirect(request.getContextPath() + "/profesor/solicitudes.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error al responder solicitud: " + e.getMessage());
        }
    }
}
