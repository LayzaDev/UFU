document.addEventListener("DOMContentLoaded", () => {
  
  const nodesH2 = document.querySelectorAll("h2");

  nodesH2.forEach(element => {
    element.onclick = hideVisibility;
    element.ondblclick = unhideVisibility;
  })

  function hideVisibility(e){
    let nextNode = e.target.nextElementSibling;

    while(nextNode) {
      nextNode.classList.add("hideContent");
      nextNode = nextNode.nextElementSibling;
    }
  }

  function unhideVisibility(e) {
    let nextNode = e.target.nextElementSibling;

    while(nextNode) {
      nextNode.classList.remove("hideContent");
      nextNode = nextNode.nextElementSibling;
    }
  }
})

