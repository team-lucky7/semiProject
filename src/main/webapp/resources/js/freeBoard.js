(function(){
    const goToListBtn = document.getElementById("goToListBtn");

    if(goToListBtn != null) { // 목록으로 버튼이 화면에 있을 때만 이벤트 추가

        goToListBtn.addEventListener("click", function(){

            const pathname = location.pathname //주소상에서 요청 경로 반환
            //    /community/board/detail

            // 이동할 주소 저장

            let url = pathname.substring(0, pathname.indexOf("/", 1));
            url += "/freeBoard/list?"
            
            const params = new URL(location.href).searchParams;

            const type = "type=" + params.get("type");
            const cp = "cp=" + params.get("cp");

            url += type + "&" + cp

            location.href = url;

        })
    } 
    
})();

(function(){

    const deleteBtn = document.getElementById("deleteBtn");

    if(deleteBtn != null){
        deleteBtn.addEventListener("click", function(){
            let url = "delete";
            const params = new URL(location.href).searchParams;
            const no = "?no=" + params.get("no");
            const type = "&type=" + params.get("type");
            url += no + type;

            if(confirm('정말로 삭제하시겠습니까?')){
                location.href = url;
            }
        })
    }

})();