document.addEventListener("turbolinks:load", () => {
  function changeMenuState(div) {
    div.classList.toggle('-translate-x-full');
  }

  const mobileOpenButton =  document.getElementById('mobileMenuOpen');
  const mobileMenuDiv = document.getElementById('mobileMenuDiv');

  mobileOpenButton.addEventListener('click', () => changeMenuState(mobileMenuDiv));
});