

function loadNavTab() {
  document.querySelectorAll(".tab").forEach((tab) => {
    tab.addEventListener("click", (event) => {
      document.querySelector(".active").classList.remove("active")
      event.currentTarget.classList.add("active");
      console.log(event.currentTarget);
    });
  });
}


function loadNavOwner() {
  document.getElementbyId("tabx1").classList.remove("active") ;
  document.getElementbyId("tabx2").classList.add("active");
}

export { loadNavTab, loadNavOwner };
