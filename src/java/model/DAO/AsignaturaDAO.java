package model.DAO;

import utils.ConexionBD;
import model.Asignatura;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AsignaturaDAO {

    // Obtener todas las asignaturas
    public List<Asignatura> getAllAsignaturas() throws SQLException {
        List<Asignatura> asignaturas = new ArrayList<>();
        String sql = "SELECT * FROM Asignatura";
        try (Connection conn = ConexionBD.getConnection();
             Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Asignatura a = new Asignatura();
                a.setIdAsignatura(rs.getInt("idAsignatura"));
                a.setNombre(rs.getString("nombre"));
                a.setProgramaEducativo(rs.getString("programaEducativo"));
                asignaturas.add(a);
            }
        }
        return asignaturas;
    }
}
