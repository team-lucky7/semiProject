$(".nav>li").hover(function () {
    if ($(this).find("div").css("display") == "none") {
        $(this).find("div").slideDown();
    } else {
        $(this).find("div").slideUp();
    }
}, function () {
    $(this).find("div").slideUp();
})