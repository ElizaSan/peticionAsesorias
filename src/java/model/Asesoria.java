package model;

public class Asesoria {
    private int idAsesoria;
    private String matricula;
    private int idProfesor;
    private int idAsignatura;
    private String fecha;        // Formato: "YYYY-MM-DD"
    private String hora;         // Formato: "HH:MM"
    private String asunto;
    private boolean alumnoEsProfesor;
    private String status;       // en_proceso, aceptada, denegada
    private String comentarioProfesor;

    public Asesoria() {}

    public int getIdAsesoria() {
        return idAsesoria;
    }
    public void setIdAsesoria(int idAsesoria) {
        this.idAsesoria = idAsesoria;
    }

    public String getMatricula() {
        return matricula;
    }
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public int getIdProfesor() {
        return idProfesor;
    }
    public void setIdProfesor(int idProfesor) {
        this.idProfesor = idProfesor;
    }

    public int getIdAsignatura() {
        return idAsignatura;
    }
    public void setIdAsignatura(int idAsignatura) {
        this.idAsignatura = idAsignatura;
    }

    public String getFecha() {
        return fecha;
    }
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }
    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getAsunto() {
        return asunto;
    }
    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public boolean isAlumnoEsProfesor() {
        return alumnoEsProfesor;
    }
    public void setAlumnoEsProfesor(boolean alumnoEsProfesor) {
        this.alumnoEsProfesor = alumnoEsProfesor;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public String getComentarioProfesor() {
        return comentarioProfesor;
    }
    public void setComentarioProfesor(String comentarioProfesor) {
        this.comentarioProfesor = comentarioProfesor;
    }
}
