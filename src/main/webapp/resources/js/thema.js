document.getElementById('load-more-btn').addEventListener('click', function() {
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
    <div class="write">
        <button>
            <a href="${contextPath}/board/themaWrite">글쓰기</a>
        </button>
    </div>
    `;
    const themaMain = document.getElementById('thema-main');
    themaMain.insertAdjacentHTML('beforeend', newContent);
    document.getElementById('more').remove();
    
});
