//REGISTER.JSP
// Mostrar campos de acuerdo con el tipo de usuario seleccionado
document.querySelectorAll('input[name="tipoUsuario"]').forEach(input => {
  input.addEventListener('change', function() {
    if (this.value === 'alumno') {
      document.getElementById('alumnoFields').style.display = 'block';
      document.getElementById('profesorFields').style.display = 'none';
    } else if (this.value === 'profesor') {
      document.getElementById('alumnoFields').style.display = 'none';
      document.getElementById('profesorFields').style.display = 'block';
    }
  });
});
