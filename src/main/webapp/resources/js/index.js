let j = 3;
const img = $(".main-imgs-wrap>img")
setInterval(()=> {
    if(j == 0){
        j = 3;
        $(img).css("left", "0");
    }

    $(img[j]).animate({
        left: -1920
    },2000,function(){});
    j--;
}, 5000)

