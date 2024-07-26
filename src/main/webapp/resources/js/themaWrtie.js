// 미리보기 관련 요소 모두 얻어오기
// -> 동일한 개수의 요소가 존재함 == 인덱스 일치함
const preview = document.getElementsByClassName("preview");
const inputImage = document.getElementsByClassName("inputImage");
const deleteImage = document.getElementsByClassName("delete-image");

const deleteList = document.getElementById("deleteList");

let markerSet = false; // 마커가 설정되었는지 확인하는 변수

const deleteSet = new Set();


for (let i = 0; i < inputImage.length; i++) {

    // 파일이 선택 되었을 때
    inputImage[i].addEventListener("change", function () {

        if (this.files[0] != undefined) {

            const reader = new FileReader();

            reader.readAsDataURL(this.files[0]);

            reader.onload = function (e) { // reader가 파일을 다 읽어온 경우

                preview[i].setAttribute("src", e.target.result);

                // 이미지가 불러와졌을 때
                // deleteSet에서 해당 레벨을 제거(삭제 목록에서 제외)
                deleteSet.delete(i);
            }

        } else { // 파일이 선택이 되지 않았을 때 (취소)
            preview[i].removeAttribute("src");
        }
    })

    deleteImage[i].addEventListener("click", function(){

       // 미리보기가 존재하는 경우에만 x버튼 동작
       if(preview[i].getAttribute("src") != ""){
            
        preview[i].removeAttribute("src");
        
        inputImage[i].value = "";

        // deleteSet에 삭제된 이미지 레벨(i) 추가
        deleteSet.add(i);
    }

    })

}



mapDiv = document.getElementById("mapDiv"); // 맵 생성해서 append 하려 만든거

function mapAddress() {
    const mapAddress = document.getElementById("inputAddress").value;

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
            level: 1 // 지도의 확대 레벨
        };

    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(mapAddress, function (result, status) {

        // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);

        }
    });




    var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
        infowindow = new kakao.maps.InfoWindow({ zindex: 1 }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

    // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);

    // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다  mouseEvent.
    kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
        searchDetailAddrFromCoords(mouseEvent.latLng, function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';

                var content = '<div class="bAddr">' +
                    '<span class="title">주소정보</span>' +
                    detailAddr +
                    '</div>';

                // 마커를 클릭한 위치에 표시합니다 
                marker.setPosition(mouseEvent.latLng);
                marker.setMap(map);

                // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                infowindow.setContent(content);
                infowindow.open(map, marker);

                let address = result[0].address.address_name;

                let [address1, address2] = address.split(' ');

                /**************   가장 중요 부분***********************/
                let mapData = {
                    lat: marker.getPosition().getLat(),
                    lng: marker.getPosition().getLng(),
                    address: address1 + " " + address2,
                };

                let json = JSON.stringify(mapData);  // json 합치고 인풋에다가 갑 넣어줌             


                const mapvalue = document.getElementById("mapAdr");

                if (mapDiv.style.display != 'none') {
                    mapvalue.value = json;
                    markerSet = true; // 마커가 설정됨
                }
            }
        });
    });
    /**************  마커에서 주소, 경위도 받아서 json 만들어서 넘기는 부분  ***********************/

    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'idle', function () {
        searchAddrFromCoords(map.getCenter(), displayCenterInfo);
    });

    function searchAddrFromCoords(coords, callback) {
        // 좌표로 행정동 주소 정보를 요청합니다
        geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
    }

    function searchDetailAddrFromCoords(coords, callback) {
        // 좌표로 법정동 상세 주소 정보를 요청합니다
        geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
    }

    // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
    function displayCenterInfo(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');

            for (var i = 0; i < result.length; i++) {
                // 행정동의 region_type 값은 'H' 이므로
                if (result[i].region_type === 'H') {
                    infoDiv.innerHTML = result[i].address_name;
                    break;
                }
            }
        }
    }
}

function hideMap() {
    mapDiv.style.display = 'none';
}

function showMap() {
    mapDiv.style.display = 'block';
}


// 게시글 작성 유효성 검사
function writeValidate() {
    const themaTitle = document.getElementsByName('themaTitle')[0];
    const themaContent = document.querySelector("[name='themaContent']");

    const thumbnail = document.querySelector("[name='0']");
    const centerAddr = document.getElementById("centerAddr");
    const inputAddress = document.getElementById("inputAddress");

    if (themaTitle.value.trim().length == 0) {
        alert("제목을 입력하세요");
        themaTitle.value = "";
        return false;
    }

    if (thumbnail.value.length == 0) {
        alert("썸네일 이미지를 선택하세요.");
        thumbnail.focus();
        return false;
    }

    if (themaContent.value.trim().length == 0) {
        alert("내용을 입력하세요");
        themaContent.focus();
        themaContent.value = "";
        return false;
    }

    if (inputAddress.value.trim().length == 0) {
        alert("검색후 위치를 선택해 주세요.");
        inputAddress.focus();
        inputAddress.value = "";
        return false;
    }

    if (!markerSet) {
        alert("지도를 클릭하여 위치를 선택해 주세요.");
        return false;
    }

    deleteList.value = Array.from(deleteSet);

    return true;
}
