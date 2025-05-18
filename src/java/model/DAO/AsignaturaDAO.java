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
}
