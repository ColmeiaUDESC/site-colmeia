document.addEventListener("turbolinks:load", () => {
  let isOpened = false;
  let isDropdownMenu = false;

  function changeMenuState(div, booleanValue) {
    if (isOpened) {
      div.classList.add('hidden');
      isOpened = !isOpened;
    } else {
      div.classList.remove('hidden');
      isOpened = !isOpened;
    }
  }

  const mobileOpenButton =  document.getElementById('mobileMenuOpen');
  const mobileCloseButton = document.getElementById('mobileMenuClose');
  const mobileMenuDiv = document.getElementById('mobileMenuDiv');

  const dropdownButton = document.getElementById('dropdownMenu');
  const dropdownDiv = document.getElementById('dropdownDiv');
  
  mobileOpenButton.addEventListener('click', () => changeMenuState(mobileMenuDiv, isOpened));
  mobileCloseButton.addEventListener('click', () => changeMenuState(mobileMenuDiv, isOpened));
  dropdownButton.addEventListener('click', () => changeMenuState(dropdownDiv, isOpened));
});