window.onload = () => {
  const listImage = document.querySelectorAll("img");

  listImage.forEach(element => {
    element.onmouseenter = () => element.classList.add("destaca");

    element.onmouseleave = () => element.classList.remove("destaca");
  })
}