document.addEventListener('DOMContentLoaded', () => {
  const toggle = document.getElementById('togglePassword');
  const input = document.getElementById('password');

  if (toggle && input) {
    toggle.addEventListener('click', function () {
      const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
      input.setAttribute('type', type);
      this.classList.toggle('fa-eye');
      this.classList.toggle('fa-eye-slash');
    });
  }
});
