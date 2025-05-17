package model.DAO;

import utils.ConexionBD;
import model.Profesor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProfesorDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/peticionAsesorias?useSSL=false&serverTimezone=UTC";
    private final String jdbcUser = "root";
    private final String jdbcPassword = "";

    // Insertar profesor
    public void insertProfesor(Profesor profesor) throws SQLException {
            String sql = "INSERT INTO Profesor (idProfesor, nombreCompleto, password) VALUES (?, ?, ?)";

            try (Connection conn = ConexionBD.getConnection(); // Obtener conexión desde ConexionBD
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setInt(1, profesor.getIdProfesor());
                stmt.setString(2, profesor.getNombreCompleto());
                stmt.setString(3, profesor.getPassword());

                stmt.executeUpdate();
            }
        }

    // Obtener profesor por id
    public Profesor getProfesorById(int idProfesor) throws SQLException {
        String sql = "SELECT * FROM Profesor WHERE idProfesor = ?";
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfesor);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Profesor profesor = new Profesor();
                profesor.setIdProfesor(rs.getInt("idProfesor"));
                profesor.setNombreCompleto(rs.getString("nombreCompleto"));
                profesor.setPassword(rs.getString("password"));
                return profesor;
            }
        }
        return null;
    }

    // Listar todos los profesores
    public List<Profesor> getAllProfesores() throws SQLException {
        List<Profesor> profesores = new ArrayList<>();
        String sql = "SELECT * FROM Profesor";
        try (Connection conn = ConexionBD.getConnection();
             Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Profesor profesor = new Profesor();
                profesor.setIdProfesor(rs.getInt("idProfesor"));
                profesor.setNombreCompleto(rs.getString("nombreCompleto"));
                profesor.setPassword(rs.getString("password"));
                profesores.add(profesor);
            }
        }
        return profesores;
    }
}
