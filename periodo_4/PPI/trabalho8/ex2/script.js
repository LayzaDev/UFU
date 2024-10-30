let listOfImg = document.querySelectorAll("img");

listOfImg.forEach(img => {
  img.onmouseenter = () => img.classList.add("destaca");
  img.onmouseleave = () => img.classList.remove("destaca");
});


