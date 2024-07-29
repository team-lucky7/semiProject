var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.57850, 126.9770), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition = new kakao.maps.LatLng(37.57850, 126.9770); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 마커가 드래그 가능하도록 설정합니다 
marker.setDraggable(true); 


// 상세조회 - 목록으로 버튼
(function(){
    const goToListBtn = document.getElementById("goToListBtn");

    if (goToListBtn != null) {// 목록으로 버튼이 화면에 있을 때만 이벤트 추가

        goToListBtn.addEventListener("click", function(){

            console.log("TEST")
            
            const pathname = location.pathname; // 주소상에서 요청 경로 반환

            // 이동할 주소 저장

            let url = pathname.substring(0, pathname.indexOf("/", 1));
            // /semiProject

            url += "/region?type="  // /semiProject/region?type

            // URL 내장 객체 : 주소 관련 정보를 나타내는 객체
            // location.href : 현재 페이지 주소 + 쿼리스트링
            // URL.searchParams : 쿼리스트링만 별도 객체로 반환

            //http://localhost:8080/semiProject/thema/list?no=499&cp=1&type=1
            const params = new URL(location.href).searchParams;

            const type = + params.get("type"); // type=1

            // 조립
            url += type;

            // location.href ="주소"; --> 해당 주소로 이동
            location.href = url;
        });


    }


})();