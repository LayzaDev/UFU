const campoAltura = document.querySelector('#heightField');
const campoSexo = document.querySelector('input[name="sexo"]:checked');

let pesoIdeal;

function calculaPesoIdeal(){

  let altura = parseInt(campoAltura.value);

  if(campoSexo && campoSexo.value == "F"){
    pesoIdeal = 52 + (0.67 * (altura) - 152.4);
  } else {
    pesoIdeal = 52 + (0.75 * (altura - 152.4));
  }

  alert(`Seu peso ideal é ${pesoIdeal}`);
}

const button = document.querySelector("button");

button.onclick = calculaPesoIdeal;

