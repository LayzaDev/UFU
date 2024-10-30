// Pegando o input encontrado no documento HTML
const fieldOfInterest = document.querySelector("input");

// Adicionando um ouvinte de evento de tecla
fieldOfInterest.addEventListener("keyup", e => {
  
  // Verifica se o usuario pressionou a tecla 'Enter'
  if(e.key === 'Enter'){

    // Criando novos elementos HTMT
    const newLi = document.createElement("li");
    const newSpan = document.createElement("span");
    const newButton = document.createElement("button");

    // Definindo o conteúdo de texto do span como o valor do campo de interesse
    newSpan.textContent = fieldOfInterest.value;

    // Definindo o conteúdo de texto do button como "X"
    newButton.textContent = "X"

    // Adicionando o span e o button como filhos do li
    newLi.appendChild(newSpan);
    newLi.appendChild(newButton);

    // Pegando o elemento ol
    const listOfInterests = document.querySelector("ol");

    // Adicionando o novo li à lista de interesses
    listOfInterests.appendChild(newLi);

    // Adicionando um ouvinte de evento de clique ao botão "X"
    newButton.onclick = () => listOfInterests.removeChild(newLi);

    // Limpando o campo de interesse
    fieldOfInterest.value = "";
  }
})
