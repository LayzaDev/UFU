// Quando o formulario de nome "cadastro" for submetido, a função validaForm será atribuida
document.forms.cadastro.onsubmit = validaForm;

// Função que irá validar o formulario
function validaForm(e) {

  // obtendo o objeto que disparou o evento no form
  let form = e.target;
  // Inicializando a variável que validará se o form é valido ou não
  let formValido = true;

  // Obtendo referências aos spans de msg de erro a partir dos campos de entrada
  const spanUser = form.user.nextElementSibling;
  const spanPassword = form.password.nextElementSibling;
  const spanEmail = form.email.nextElementSibling;

  // Definindo o conteúdo dos spans como vazio
  spanUser.textContent = "";
  spanPassword.textContent = "";
  spanEmail.textContent = "";

  // Verificando se os campos de entrada estão vazios, se estiverem será exibida uma msg de alerta/erro e a variavel formValido será falsa.
  if(form.user.value === ""){
    spanUser.textContent = "O usuário deve ser preenchido"; 
    formValido = false; 
  }
  
  if(form.password.value === ""){
    spanPassword.textContent = "A senha deve ser preenchida";
    formValido = false;
  }

  if(form.email.value === ""){
    spanEmail.textContent = "O email deve ser preenchido";
    formValido = false;
  }

  /// Se o formulário não for válido, a função preventDefault() impedirá a submissão padrão do formulário
  if(!formValido){
    e.preventDefault();
  }
  
  // limpando o valor dos campos do formulario depois de ser submetido
  form.user.value = "";
  form.password.value = "";
  form.email.value = "";
}

