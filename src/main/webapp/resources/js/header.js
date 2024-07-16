$(".nav>li").hover(function () {
    if ($(this).find("div").css("display") == "none") {
        $(this).find("div").slideDown();
    } else {
        $(this).find("div").slideUp();
    }
}, function () {
    $(this).find("div").slideUp();
})

if($(".recent-search > ul").html() == ""){
    $(".recent-search > p").css('display', 'block');
}else{
    $(".recent-search > p").css('display', 'none');
}

const body = document.getElementsByTagName("body")[0];
const searchIndex = document.getElementsByClassName("search-index")[0];
const inpSearchWindow = document.getElementById("inp-search-window");

function closeSearch(){
    searchIndex.style.display = "none";
    body.removeAttribute("style");
}

inpSearchWindow.addEventListener("click", function(){
    searchIndex.style.display = "block";
    body.style.overflow = "hidden";
})

