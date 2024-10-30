window.onload = () => {
  const openBtn = document.querySelector("#openButton");

  const modal = document.querySelector(".modal");

  openBtn.onclick = () => modal.classList.add("mostrarModal");
  
  const btnClose = document.querySelector(".btnClose");

  btnClose.onclick = () => modal.classList.remove("mostrarModal");
}