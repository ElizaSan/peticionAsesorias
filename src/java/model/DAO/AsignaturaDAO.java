package model.DAO;

import model.Asignatura;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AsignaturaDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/peticionAsesorias?useSSL=false&serverTimezone=UTC";
    private final String jdbcUser = "root";
    private final String jdbcPassword = "";

    // Obtener todas las asignaturas
    public List<Asignatura> getAllAsignaturas() throws SQLException {
        List<Asignatura> asignaturas = new ArrayList<>();
        String sql = "SELECT * FROM Asignatura";
        try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPassword);
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
