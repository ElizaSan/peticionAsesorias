package model;

public class Asignatura {
    private int idAsignatura;
    private String nombre;
    private String programaEducativo;

    public Asignatura() {}

    public int getIdAsignatura() {
        return idAsignatura;
    }
    public void setIdAsignatura(int idAsignatura) {
        this.idAsignatura = idAsignatura;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getProgramaEducativo() {
        return programaEducativo;
    }
    public void setProgramaEducativo(String programaEducativo) {
        this.programaEducativo = programaEducativo;
    }
}
