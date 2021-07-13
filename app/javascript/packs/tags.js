document.addEventListener("turbolinks:load", () => {
    function checkBoxToInput() {
        let tagsInput = document.getElementById("tags")
        tagsInput.value = "";
        var tagsCheckbox = document.querySelectorAll('.tagsCheck');   
        for (var i = 0; i < tagsCheckbox.length; i++) {   
            if (tagsCheckbox[i].checked){
                tagsInput.value += tagsCheckbox[i].value+",";
            }   
        }
    }

    let form = document.getElementById("postForm");
    form.addEventListener("submit", checkBoxToInput, false);
})