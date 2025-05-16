package model.DAO;

import utils.ConexionBD;
import model.Asesoria;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AsesoriaDAO {
    private static final String INSERT_SQL = "INSERT INTO Asesoria "
        + "(matricula, idProfesor, idAsignatura, fecha, hora, asunto, alumnoEsProfesor, status, comentarioProfesor) "
        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Insertar nueva asesoría
    public void insertAsesoria(Asesoria asesoria) throws SQLException {
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT_SQL)) {

            stmt.setString(1, asesoria.getMatricula());
            stmt.setInt(2, asesoria.getIdProfesor());
            stmt.setInt(3, asesoria.getIdAsignatura());
            stmt.setDate(4, Date.valueOf(asesoria.getFecha()));
            stmt.setTime(5, Time.valueOf(asesoria.getHora() + ":00"));
            stmt.setString(6, asesoria.getAsunto());
            stmt.setBoolean(7, asesoria.isAlumnoEsProfesor());
            stmt.setString(8, asesoria.getStatus());
            stmt.setString(9, asesoria.getComentarioProfesor());

            stmt.executeUpdate();
        }
    }

    // Obtener asesorías de un alumno por matrícula
    public List<Asesoria> getAsesoriasByAlumno(String matricula) throws SQLException {
        List<Asesoria> lista = new ArrayList<>();
        String sql = "SELECT * FROM Asesoria WHERE matricula = ?";
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricula);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Asesoria a = new Asesoria();
                a.setIdAsesoria(rs.getInt("idAsesoria"));
                a.setMatricula(rs.getString("matricula"));
                a.setIdProfesor(rs.getInt("idProfesor"));
                a.setIdAsignatura(rs.getInt("idAsignatura"));
                a.setFecha(rs.getDate("fecha").toString());
                a.setHora(rs.getTime("hora").toString().substring(0,5));
                a.setAsunto(rs.getString("asunto"));
                a.setAlumnoEsProfesor(rs.getBoolean("alumnoEsProfesor"));
                a.setStatus(rs.getString("status"));
                a.setComentarioProfesor(rs.getString("comentarioProfesor"));
                lista.add(a);
            }
        }
        return lista;
    }

    // Obtener asesorías asignadas a un profesor por idProfesor
    public List<Asesoria> getAsesoriasByProfesor(int idProfesor) throws SQLException {
        List<Asesoria> lista = new ArrayList<>();
        String sql = "SELECT * FROM Asesoria WHERE idProfesor = ?";
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfesor);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Asesoria a = new Asesoria();
                a.setIdAsesoria(rs.getInt("idAsesoria"));
                a.setMatricula(rs.getString("matricula"));
                a.setIdProfesor(rs.getInt("idProfesor"));
                a.setIdAsignatura(rs.getInt("idAsignatura"));
                a.setFecha(rs.getDate("fecha").toString());
                a.setHora(rs.getTime("hora").toString().substring(0,5));
                a.setAsunto(rs.getString("asunto"));
                a.setAlumnoEsProfesor(rs.getBoolean("alumnoEsProfesor"));
                a.setStatus(rs.getString("status"));
                a.setComentarioProfesor(rs.getString("comentarioProfesor"));
                lista.add(a);
            }
        }
        return lista;
    }

    // Actualizar status y comentario de asesoría
    public void actualizarStatusComentario(int idAsesoria, String status, String comentario) throws SQLException {
        String sql = "UPDATE Asesoria SET status = ?, comentarioProfesor = ? WHERE idAsesoria = ?";
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setString(2, comentario);
            stmt.setInt(3, idAsesoria);
            stmt.executeUpdate();
        }
    }
}
