

function loadNavTab() {
  document.querySelectorAll(".tab").forEach((tab) => {
    tab.addEventListener("click", (event) => {
      document.querySelector(".active").classList.remove("active")
      event.currentTarget.classList.add("active");
    });
  });
}

export { loadNavTab };
