function buscaCotacao(info){
  fetch(`busca_acao.php?symbol=${codigo}`)
    .then(response => response.json())
    .then(data => {
      let info = data['Global Quote'];
      exibeCotacao(info);
    })
    .catch(error => console.log(error));
}

function exibeCotacao(info){

  let resultDiv = document.querySelector("#cotacao");
  resultDiv.textContent = '';

  let h2 = document.createElement('h2');
  h2.textContent = 'Cotacao da Ação';
  resultDiv.appendChild(h2);
  
  let ul = document.createElement('ul');

  for(let key in info){
    let listItem = document.createElement('li');
    listItem.textContent = `${key.replace(/\d+\. /, '')} : ${info[key]}`;
    ul.appendChild(listItem);
  }

  resultDiv.appendChild(ul);
}

const inputCode = document.querySelector('#codigo');

inputCode.onkeyup = () => {
  const codigo = inputCode.value.trim();
  if(codigo.length === 5){
    buscaCotacao(codigo);
  }
}