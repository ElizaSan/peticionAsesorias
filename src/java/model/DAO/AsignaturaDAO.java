package model.DAO;

import utils.ConexionBD;
import model.Asignatura;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AsignaturaDAO {


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
                String programa = rs.getString("programaEducativo");
                
                if (programa != null && (programa.equals("ICC") || programa.equals("LCC") || programa.equals("ITI"))) {
                    a.setProgramaEducativo(programa);
                } else {
                    
                    a.setProgramaEducativo("ICC");
                }

                asignaturas.add(a);
            }
        }
        return asignaturas;
    }
}
