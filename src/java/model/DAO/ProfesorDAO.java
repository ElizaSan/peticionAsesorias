package model.DAO;

import utils.ConexionBD;
import model.Profesor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProfesorDAO {

    
    public void insertProfesor(Profesor profesor) throws SQLException {
        String sql = "INSERT INTO Profesor (idProfesor, nombreCompleto, password) VALUES (?, ?, ?)";

        
        try (Connection conn = ConexionBD.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, profesor.getIdProfesor());
            stmt.setString(2, profesor.getNombreCompleto());
            stmt.setString(3, profesor.getPassword());
            
            stmt.executeUpdate(); 
        } catch (SQLException e) {
            
            e.printStackTrace();
            throw new SQLException("Error al insertar el profesor en la base de datos: " + e.getMessage());
        }
    }

    
    public Profesor getProfesorById(int idProfesor) throws SQLException {
        String sql = "SELECT * FROM Profesor WHERE idProfesor = ?";
        Profesor profesor = null;

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idProfesor);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                profesor = new Profesor();
                profesor.setIdProfesor(rs.getInt("idProfesor"));
                profesor.setNombreCompleto(rs.getString("nombreCompleto"));
                profesor.setPassword(rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error al obtener el profesor por ID: " + e.getMessage());
        }
        return profesor;
    }

    
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
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error al listar los profesores: " + e.getMessage());
        }
        
        return profesores;
    }
}
