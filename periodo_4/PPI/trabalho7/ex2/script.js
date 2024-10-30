const btn = document.querySelector("button");

btn.onclick = function () {
  const nome = document.querySelector("input");
  const saida = document.querySelector("p");

  saida.textContent = "Obrigado, " + nome.value + "!";
};