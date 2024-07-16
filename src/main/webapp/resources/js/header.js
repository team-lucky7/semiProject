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