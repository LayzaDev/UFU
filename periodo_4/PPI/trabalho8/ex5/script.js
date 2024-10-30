// Depois que toda a janela for carregada, executará o js
window.onload = () => {
  // Acessando o botão que abrirá o modal
  const btnOpenModal = document.querySelector("#btnOpenModal");
  // Acessando a div modal
  const modal = document.querySelector(".modal");

  // Adiciando um ouvinte de evento click, no botão de abertura e adicionando a classe "unhideModal" para tornar o modal visivel
  btnOpenModal.addEventListener('click', () => modal.classList.add("unhideModal")); 

  // Acessando o botão de fechamento do modal
  const btnCloseModal = document.querySelector("#buttonClose");

  // Adiciando um ouvinte de evento click, no botão de fechamento e removendo a classe "unhideModal" para ocultar o modal
  btnCloseModal.addEventListener('click', () => modal.classList.remove("unhideModal"));
}