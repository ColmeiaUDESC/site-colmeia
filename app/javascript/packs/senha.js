document.addEventListener("turbolinks:load", () => {
    var foo = document.getElementById("func");
    foo.addEventListener("click",() => myFunction());
    
    var hide = false;

    function myFunction(){
        if (hide){
            alert("Here");
            hide = false;
        }else{
            alert("Oh ye");
            hide = true;
        }
    }

})