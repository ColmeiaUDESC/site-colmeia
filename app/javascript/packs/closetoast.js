document.addEventListener("turbolinks:load", function() {
    let closeButton = document.getElementById("close-toast");
    let toast = document.getElementById("toast");

    closeButton.addEventListener("click", () => {
        toast.remove();
    });
})