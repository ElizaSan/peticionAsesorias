package model.DAO;

import utils.ConexionBD;
import model.Asignatura;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AsignaturaDAO {


    // Obtener todas las asignaturas con los campos necesarios
    public List<Asignatura> getAllAsignaturas() throws SQLException {
        List<Asignatura> asignaturas = new ArrayList<>();
        String sql = "SELECT idAsignatura, nombre FROM Asignatura";  // Solo seleccionamos idAsignatura y nombre
        
        try (Connection conn = ConexionBD.getConnection();
             Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Asignatura a = new Asignatura();
                a.setIdAsignatura(rs.getInt("idAsignatura"));
                a.setNombre(rs.getString("nombre"));
                asignaturas.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error al obtener las asignaturas: " + e.getMessage());
        }

        return asignaturas;
    }
    
    
    public Asignatura getAsignaturaById(int idAsignatura) throws SQLException {
        String sql = "SELECT * FROM Asignatura WHERE idAsignatura = ?";
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idAsignatura);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Asignatura asignatura = new Asignatura();
                asignatura.setIdAsignatura(rs.getInt("idAsignatura"));
                asignatura.setNombre(rs.getString("nombre"));
                asignatura.setProgramaEducativo(rs.getString("programaEducativo"));
                return asignatura;
            }
        }
        return null;
    }
    
    
    
    
    
    
    
}
