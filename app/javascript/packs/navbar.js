let isOpened = false;
document.addEventListener("DOMContentLoaded", () => {
    const mobileOpenButton =  document.getElementById('mobileMenuOpen');
    const mobileCloseButton = document.getElementById('mobileMenuClose');
    const mobileMenuDiv = document.getElementById('mobileMenuDiv');
    
    mobileOpenButton.addEventListener('click', () => changeMenuState(mobileMenuDiv));
    mobileCloseButton.addEventListener('click', () => changeMenuState(mobileMenuDiv));
});

function changeMenuState(div) {
    if (isOpened) {
        div.classList.add('hidden');
        isOpened = !isOpened;
    } else {
        div.classList.remove('hidden');
        isOpened = !isOpened;
    }
}