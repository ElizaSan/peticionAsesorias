// Mostrar campos de acuerdo con el tipo de usuario seleccionado
document.addEventListener("DOMContentLoaded", function() {
    // Cambia la visibilidad de los campos según el tipo de usuario seleccionado
    document.querySelectorAll('input[name="tipoUsuario"]').forEach(input => {
        input.addEventListener('change', function() {
            if (this.value === 'alumno') {
                document.getElementById('alumnoFields').style.display = 'block';
                document.getElementById('profesorFields').style.display = 'none';
                document.getElementById('programaEducativo').style.display = 'block'; // Mostrar programa educativo
            } else if (this.value === 'profesor') {
                document.getElementById('alumnoFields').style.display = 'none';
                document.getElementById('profesorFields').style.display = 'block';
                document.getElementById('programaEducativo').style.display = 'none'; // Ocultar programa educativo
            }
        });
    });
});



function registroExitoso() {
    alert("Registro exitoso.");
    return true;  // Permitir que el formulario se envíe después de la alerta
}
