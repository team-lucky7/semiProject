const preview = document.getElementsByClassName("preview");
const inputImage = document.getElementsByClassName("inputImage");
const deleteImage = document.getElementsByClassName("delete-image");

// 게시글 수정 시 삭제된 이미지의 레벨(위치)를 저장할 input 요소 
const deleteList = document.getElementById("deleteList");

// 게시글 수정 시 삭제된 이미지의 레벨(위치)를 기록해둘 Set 생성 
const deleteSet = new Set(); // 중복 허용 X, 순서 X,  여러번 클릭 시 중복 값 저장 방지 


for(let i =0; i<inputImage.length; i++){
    
    // 파일이 선택 되었을 때 
    inputImage[i].addEventListener("change",function(){

        if(this.files[0] != undefined){
            
            const reader = new FileReader(); 
            // 선택된 파일을 읽을 객체 생성
            reader.readAsDataURL(this.files[0]);
            // 지정된 파일을 읽음 -> result에 저장 (URL포함)
            // -> URL을 이용해서 이미지 볼 수 있음

            reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
                // e.target == reader
                // e.target.result == 읽어들인 이미지의 URL
                // preview[i] == 파일이 선택된 input태그와 인접한 preview 이미지 태그

                preview[i].setAttribute("src", e.target.result);

                // 이미지가 불러와졌을 때
// deleteSet에서 해당 레벨을 제거 (삭제 목록에서 제외 )
                deleteSet.delete(i);
            }


        } else{  // 파일이 선택이 되지 않았을 때 (취소)
            preview[i].removeAttribute("src");
        }
    })

    // 미리보기 삭제 버튼(x)이 클릭 되었을 때
    deleteImage[i].addEventListener("click",function(){

        // 미리보기가 존재하는 경우에만(이전에 추가된 이미지가 있을 때만) x버튼 동작
        if(preview[i].getAttribute("src") != ""){

            // 미리보기 삭제
            preview[i].removeAttribute("src");
            
            // input의 값 "" 만들기
            inputImage[i].value = "";
            
            // deleteSet에 삭제된 이미지 레벨(i) 추가
    
            deleteSet.add(i);

        }    
    })

}


// 게시글 작성 유효성 검사
function writeValidate(){
    const regionTitle = document.getElementsByName("regionBoardTitle")[0];
    const locationName = document.querySelector("[name='locationCode']");
    const boardContent = document.querySelector("[name='boardContent']");
    const img = document.getElementById("img0");
    const img1 = document.getElementById("OMG");

    if(regionTitle.value.trim().length == 0){
        alert("제목을 입력하세요")
        setTimeout(()=> regionTitle.focus(), 100);
        return false;
    }

    if(locationName.value.trim().length == 0){
        alert("지역명을 입력하세요")
        setTimeout(()=> locationName.focus(), 100);
        return false;
    }

    if(boardContent.value.trim().length == 0){
        alert("한 줄 소개를 입력하세요.")
        setTimeout(()=> boardContent.focus(), 100);
        return false;
    }
    console.log(img)

    if(img.value == ""){
        alert("이미지를 넣어주세요.")
        setTimeout(()=> img1.focus(), 100); 
        return false;
    }

    return true;
}


function mapAddress(){
        
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
    geocoder.addressSearch(mapAddress, function(result, status) {

        // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    
            map.setCenter(coords);
    
        } 
    });    




    var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
        infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

    // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);

    // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다  mouseEvent.
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
        searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                var detailAddr = !!result[0].road_address ? '<div style="width:400px; height:100%;">도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
                detailAddr += '<div style="height:30px;">지번 주소 : ' + result[0].address.address_name + '</div>';
                
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


                let mapData = {
                lat: marker.getPosition().getLat(),
                lng: marker.getPosition().getLng(),
                address: address1+" "+address2,
              };
              
                   let json = JSON.stringify(mapData);
                
                //document.getElementById("inputAddress").setAttribute("name", "mapAddress");
                //document.getElementById("inputAddress").value = json;
                const mapvalue = document.getElementById("mapAdr");
                
                if(mapDiv.style.display!='none'){ 
                    mapvalue.value = json;                   
                }    
            }   
        });
    });

    // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
    kakao.maps.event.addListener(map, 'idle', function() {
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

            for(var i = 0; i < result.length; i++) {
                // 행정동의 region_type 값은 'H' 이므로
                if (result[i].region_type === 'H') {
                    infoDiv.innerHTML = result[i].address_name;
                    break;
                }
            }
        }    
    }

}

function hideMap(){

mapDiv.style.display = 'none';

}

function showMap(){

mapDiv.style.display = 'block';

}