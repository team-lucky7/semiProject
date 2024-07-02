document.getElementById('load-more').addEventListener('click', function() {
    const newContent = `
    <section class="thema-main">
        <div class="thema-title first"><span>감성 힐링 여행</span></div>
        <ul class="thema-contents first">
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1649310804/thumb-22_290x290.jpg"></a>
                <a href="#"><p>추억의 수학여행 코스</p></a>
                <span>경주 | 숙박여행</span>
            </li>
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1649298396/thumb-002_290x290.png"></a>
                <a href="#"><p>마을 맛 여행</p></a>
                <span>충청 | 숙박여행</span>
            </li>
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1679979630/thumb-64yA7ZGc7J206647KeA_290x290.jpg"></a>
                <a href="#"><p>포항 트레킹 '피슬로 트레일' 선라이즈 비치 트랙 / 선셋어반트랙</p></a>
                <span>경상 | 액티비티</span>
            </li>
        </ul>
    </section>

    <section class="thema-main">
        <div class="thema-title second"><span>이색 체험 여행</span></div>
        <ul class="thema-contents second">
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1679979247/thumb-64yA7ZGc7J206647KeA_290x290.png"></a>
                <a href="#"><p>포항 야외방탈출 미션추리 게임</p></a>
                <span>경상 | 이용권/체험</span>
            </li>
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1626248483/thumb-top_290x290.jpg"></a>
                <a href="#"><p>부여하늘날기 1박2일 열기구체험</p></a>
                <span>충청 | 숙박여행</span>
            </li>
            <li>
                <a href="#"><img src="https://ktourtop10.kr/data/item/1638410800/thumb-7I2464Sk7J28_290x290.jpg"></a>
                <a href="#"><p>DMZ 평화꽃반지 체험</p></a>
                <span>경기 | 이용권/체험</span>
            </li>
        </ul>
    </section>
    `;
    const mainContent = document.getElementById('thema-container');
    mainContent.insertAdjacentHTML('beforeend', newContent);
    document.getElementById('more').remove();
  
});