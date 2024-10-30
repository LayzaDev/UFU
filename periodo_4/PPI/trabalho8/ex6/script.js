// Quando a janela for totalmente carregada, inicia a execução do javascript
window.onload = function() {
  // obtendo a lista de botões de navegação
  let buttons = document.querySelectorAll("nav button"); 

  // adicionando um ouvinte de evento para cada botão de navegação e chamando a função changeTab
  for (let button of buttons) {
    button.addEventListener('click', changeTab);
  }

  // primeira aba que será exibida ao carregar a página (no caso, página "home")
  openTab(0);
}

// changeTab(): Encontra a posição do item de lista dentro da lista, e muda para a aba correspondente ao novo botão clicado
function changeTab(e) {
  const botaoAcionado = e.target; // pega o botão que acionou o evento
  const liDoBotao = botaoAcionado.parentNode; // Acessando o nó referente ao li
  const nodes = Array.from(liDoBotao.parentNode.children); // Acessando a lista de nós filhos do ul e transformando em um vetor
  const index = nodes.indexOf(liDoBotao); // pegando a posição de um li em particular

  // Chama a função para exibir a aba correspondente
  openTab(index);
}

// openTab(): torna visível o section correspondente ao index passado em changeTab
function openTab(i) {

  // oculta a aba atualmente visível
  const tabActive = document.querySelector(".tabActive"); // acessando a section atualmente visível
  if(tabActive !== null) tabActive.classList.remove("tabActive"); // removendo a classe tabActive da aba, tornando-a oculta.

  // desativa o botão atualmente ativo
  const buttonActive = document.querySelector(".buttonActive"); // acessando o botão atualmente ativo
  if(buttonActive !== null) buttonActive.classList.remove("buttonActive"); // removendo a classe buttonActive do botão para que o botão seja desativado

  // Ativação da aba clicada pelo usuário
  document.querySelectorAll(".tabs section")[i].classList.add("tabActive"); // ativa a nova aba
  document.querySelectorAll("nav button")[i].classList.add("buttonActive"); // ativa o novo botão
}

