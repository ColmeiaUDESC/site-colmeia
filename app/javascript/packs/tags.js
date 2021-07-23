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
    if (form){
        form.addEventListener("submit", checkBoxToInput, false);
    }

    window.pesquisarTags = () => {
        var tags = "";
        var tagsCheckbox = document.querySelectorAll('.tagsCheck');   
        for (var i = 0; i < tagsCheckbox.length; i++) {   
            if (tagsCheckbox[i].checked){
                tags += tagsCheckbox[i].value+= "e";
            }   
        }
        var url = base_url = window.location.origin;
        window.location.href = url+window.location.pathname.split('/p/')[0]+'/p/1/'+tags
    }

    function checkBoxToInputPosts() {
        let postsInput = document.getElementById("posts")
        postsInput.value = "";
        var tagsCheckbox = document.querySelectorAll('.postsCheck');   
        for (var i = 0; i < tagsCheckbox.length; i++) {   
            if (tagsCheckbox[i].checked){
                postsInput.value += tagsCheckbox[i].value+",";
            }   
        }
    }

    let formPost = document.getElementById("tagToPostsForm");
    if (formPost){
        formPost.addEventListener("submit", checkBoxToInputPosts, false);
    }
})