window.onload = () => {
  const campoInteresse = document.querySelector("input");

  campoInteresse.addEventListener('keyup', e => {
    if(e.key === "Enter"){
      const listaInteresses = document.querySelector("ol");

      const newLi = document.createElement("li");
      const newSpan = document.createElement("span");
      const closeBtn = document.createElement("button");

      newSpan.textContent = campoInteresse.value;
      closeBtn.textContent = "x";

      newLi.appendChild(newSpan); 
      newLi.appendChild(closeBtn);

      listaInteresses.appendChild(newLi);
  
      campoInteresse.value = "";
    }
  })
}