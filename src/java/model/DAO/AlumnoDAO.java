package model.DAO;

import utils.ConexionBD;
import model.Alumno;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlumnoDAO {
    
    // Insertar alumno
    public void insertAlumno(Alumno alumno) throws SQLException {
        String sql = "INSERT INTO Alumno (matricula, nombreCompleto, programaEducativo, password) VALUES (?, ?, ?, ?)";
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, alumno.getMatricula());
            stmt.setString(2, alumno.getNombreCompleto());
            stmt.setString(3, alumno.getProgramaEducativo());
            stmt.setString(4, alumno.getPassword());
            stmt.executeUpdate();
        }
    }

    // Obtener alumno por matricula
    public Alumno getAlumnoByMatricula(String matricula) throws SQLException {
        String sql = "SELECT * FROM Alumno WHERE matricula = ?";
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, matricula);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Alumno alumno = new Alumno();
                alumno.setMatricula(rs.getString("matricula"));
                alumno.setNombreCompleto(rs.getString("nombreCompleto"));
                alumno.setProgramaEducativo(rs.getString("programaEducativo"));
                alumno.setPassword(rs.getString("password"));
                return alumno;
            }
        }
        return null;
    }

    // Listar todos los alumnos
    public List<Alumno> getAllAlumnos() throws SQLException {
        List<Alumno> alumnos = new ArrayList<>();
        String sql = "SELECT * FROM Alumno";
        try (Connection conn = ConexionBD.getConnection();
             Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Alumno alumno = new Alumno();
                alumno.setMatricula(rs.getString("matricula"));
                alumno.setNombreCompleto(rs.getString("nombreCompleto"));
                alumno.setProgramaEducativo(rs.getString("programaEducativo"));
                alumno.setPassword(rs.getString("password"));
                alumnos.add(alumno);
            }
        }
        return alumnos;
    }
}
