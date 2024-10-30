document.forms.cadastro.onsubmit = validaForm

function validaForm(e) {
  let form = e.target;

  let formValido = true;

  const spanUser = form.usuario.nextElementSibling;
  const spanPassword = form.senha.nextElementSibling;
  const spanEmail = form.email.nextElementSibling;

  spanUser.textContent = "";
  spanPassword.textContent = "";
  spanEmail.textContent = "";

  if(form.usuario.value === "") {
    spanUser.textContent = "O usuário deve ser preenchido."
    formValido = false;
  }

  if(form.senha.value === "") {
    spanPassword.textContent = "A senha deve ser preenchida."
    formValido = false;
  }

  if(form.email.value === "") {
    spanEmail.textContent = "O email deve ser preenchido."
    formValido = false;
  }

  if(!formValido){
    e.preventDefault();
  }

  form.user.value = "";
  form.password.value = "";
  form.email.value = "";
}