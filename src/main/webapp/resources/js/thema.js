/* document.getElementById('load-more-btn').addEventListener('click', function() {
    const newContent = `
    <section class="thema-main">
        <div class="thema-title first">
            <span>레저 체험 여행</span>
             <button>저장</button>
        </div>
        <ul class="thema-contents first">
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1648699981/thumb-2019_15_s_gunf_650_330x330.jpg"></a>
                <a href="#"><p>동강서바이벌게임-페인트볼 전투 체험</p></a>
                <span>강원 | 액티비티</span>
            </li>
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1648698808/thumb-2019_17_b_dabike_650_330x330.jpg"></a>
                <a href="#"><p>동강과 함께하는 동강오지 바이크체험</p></a>
                <span>강원 | 액티비티</span>
            </li>
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1628655542/thumb-2019_07_r_rafting_650_330x330.jpg"></a>
                <a href="#"><p>동강래프팅 어라연 급류체험</p></a>
                <span>강원 | 액티비티</span>
            </li>
        </ul>
    </section>

    <section class="thema-main">
        <div class="thema-title second">
            <span>맞춤 투어 여행</span>
            <button>저장</button>
        </div>
        <ul class="thema-contents second">
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1679979630/thumb-64yA7ZGc7J206647KeA_290x290.jpg"></a>
                <a href="#"><p>포항 트레킹 '피슬로 트레일' 선라이즈 비치 트랙 / 선셋어반트랙</p></a>
                <span>경상 | 액티비티</span>
            </li>
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1647319562/thumb-main_290x290.jpg"></a>
                <a href="#"><p>파주로컬크리에이터와 함께하는 로컬여행</p></a>
                <span>경기 | 당일여행</span>
            </li>
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1626249019/thumb-taxitour_title_4hours_290x290.jpg"></a>
                <a href="#"><p>로블 포항 택시투어</p></a>
                <span>경상 | 여행택시</span>
            </li>
        </ul>
    </section>

    `;
    const themaMain = document.getElementById('thema-main');
    themaMain.insertAdjacentHTML('beforeend', newContent);
    document.getElementById('more').remove();
    
}); */




// 상세조회 - 목록으로 버튼
(function(){
    const goToListBtn = document.getElementById("goToListBtn");

    if (goToListBtn != null) {// 목록으로 버튼이 화면에 있을 때만 이벤트 추가

        goToListBtn.addEventListener("click", function(){

            
            const pathname = location.pathname; // 주소상에서 요청 경로 반환
            // /semiProject/thema/subPage

            // 이동할 주소 저장

            let url = pathname.substring(0, pathname.indexOf("/", 1));
            // /semiProject

            url += "/thema/list?"  // /semiProject/thema/list?

            // URL 내장 객체 : 주소 관련 정보를 나타내는 객체
            // location.href : 현재 페이지 주소 + 쿼리스트링
            // URL.searchParams : 쿼리스트링만 별도 객체로 반환

            //http://localhost:8080/semiProject/thema/list?no=499&cp=1&type=1
            const params = new URL(location.href).searchParams;

            const type = "type=" + params.get("type"); // type=1
            let cp;
            console.log(params.get('cp'))
            if (params.get('cp' != null)) {
                cp = "cp=" + params.get("cp"); // cp=1
            } else {
                cp = "cp=1";
            }

            // 조립
            url += type + "&" + cp;
            // /semiProject/thema/list?type=1&cp=1


            // location.href ="주소"; --> 해당 주소로 이동
            location.href = url;
        });


    }


})();



// 즉시 실행 함수
(function(){
    const deleteBtn = document.getElementById("deleteBtn")

    if(deleteBtn != null){ // 삭제버튼이 화면에 존재할 때
        deleteBtn.addEventListener("click", function(){
            // 현재 : (/semiProject/thema/)detail?no=1523&cp=1&type=1
            
            // 목표 : (/semiProject/thema/)detail?no=1523&type=1

            let url = "delete"; // 상대경로 형식으로 작성

            // 주소에서 작성된 쿼리스트링에서 필요한 파라미터만 얻어와서 사용
            // 1. 쿼리스트링에 존재하는 파라미터 모두 얻어오기
            // 2. 원하는 파라미터만 얻어와서 변수에 저장

            const params = new URL(location.href).searchParams;

            const no = "?no="+params.get("no") // ?no=0000

            const type = "&type=" + params.get("type"); // &type=1
            
            url += no + type; // 조립
            
            if(confirm('정말로 삭제하시겠습니까?')){

                location.href = url; // get방식으로 url에 요청
            }
        })

    }
})();



