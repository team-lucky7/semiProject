let contentCnt = 0;
mapDiv = document.getElementById("mapDiv");


function addFullText(){
    const addDiv = document.createElement("div");
    const addSpan = document.createElement("span");
    const addText = document.createElement("textarea");
    const addXBtn = document.createElement("img");
    const container = document.getElementById("container2");
    
    addDiv.classList.add("fullContent");
    addSpan.innerHTML = "작성글<br>";
    addSpan.classList.add("subtitle");
    addText.classList.add("text");
    addText.setAttribute("name",contentCnt+"_fullText");
    contentCnt++;
    addXBtn.src = contextPath + "/resources/images/x-button-327024.png";
    addXBtn.classList.add("xBtn");
    
    addXBtn.addEventListener("click", function(){
        this.parentElement.remove();
    })

    addDiv.append(addSpan, addText, addXBtn);
    container.append(addDiv);
}

function addHalfText(){
    const addDiv = document.createElement("div");
    const addSpan = document.createElement("span");
    const addXBtn = document.createElement("img");
    const addText = document.createElement("textarea");
    const container = document.getElementById("container2");
    
    addDiv.classList.add("halfContent");
    addSpan.innerHTML = "작성글(반)<br>";
    addSpan.classList.add("subtitle");
    addText.classList.add("halftext");
    addText.setAttribute("name",contentCnt+"_halfText");
    contentCnt++;
    addXBtn.src = contextPath + "/resources/images/x-button-327024.png";
    addXBtn.classList.add("xBtn");
    
    addXBtn.addEventListener("click", function(){
        this.parentElement.remove();
    })

    addDiv.append(addSpan, addText, addXBtn);
    container.append(addDiv);
    
}


function addFullImage(){
    const addDiv = document.createElement("div");
    const addSpan = document.createElement("span");
    const container = document.getElementById("container2");
    const addInput = document.createElement("input");
    const addImage = document.createElement("img");
    const addXBtn = document.createElement("img");
    
    addDiv.classList.add("fullContent");
    addSpan.innerHTML = "사진첨부";
    addSpan.classList.add("subtitle");
    addInput.setAttribute("type","file");
    addInput.setAttribute("name",contentCnt+"_fullImage");
    contentCnt++;
    addImage.classList.add("fullImage");
    addXBtn.src = contextPath + "/resources/images/x-button-327024.png";
    addXBtn.classList.add("xBtn");
    
    addXBtn.addEventListener("click", function(){
        this.parentElement.remove();
    })
    
    
    
    addDiv.append(addSpan, addInput, addImage, addXBtn);
    container.append(addDiv);
    
    
    addInput.addEventListener("change", function(){
          if(this.files[0] != undefined){
              
              const reader = new FileReader();
               // 선택된 파일을 읽을 객체 생성
               reader.readAsDataURL(this.files[0]);
               // 지정된 파일을 읽음 -> result에 저장(URL포함)
               // -> URL을 이용해서 이미지 볼 수 있음
               
               reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
                // e.target = reader
                // e.target.result = 읽어들인 이미지의 URL
                // preview[i] == 파일이 선택된 input 태그와 인접한 preview 이미지 태그
   
                addImage.setAttribute("src", e.target.result);
                
            }
        } else { // 파일이 선택이 되지 않았을 때 (취소)
            addImage.removeAttribute("src");
        }
        
    })
    
    
    
}

function addHalfImage(){
    const addDiv = document.createElement("div");
    const addSpan = document.createElement("span");
    const container = document.getElementById("container2");
    const addInput = document.createElement("input");
    const addImage = document.createElement("img");
    const addXBtn = document.createElement("img");
    
    addDiv.classList.add("halfContent");
    addSpan.innerHTML = "사진첨부";
    addSpan.classList.add("subtitle");
    addInput.setAttribute("type","file");
    addInput.setAttribute("name",contentCnt+"_halfImage");
    contentCnt++;
    addImage.classList.add("halfImage");
    addXBtn.src = contextPath + "/resources/images/x-button-327024.png";
    addXBtn.classList.add("xBtn");
    
    addXBtn.addEventListener("click", function(){
        this.parentElement.remove();
    })

    addDiv.append(addSpan, addInput, addImage, addXBtn);
    container.append(addDiv);
    
    addInput.addEventListener("change", function(){
          if(this.files[0] != undefined){
              
               const reader = new FileReader();
               // 선택된 파일을 읽을 객체 생성
               reader.readAsDataURL(this.files[0]);
               // 지정된 파일을 읽음 -> result에 저장(URL포함)
               // -> URL을 이용해서 이미지 볼 수 있음
               
               reader.onload = function(e){ // reader가 파일을 다 읽어온 경우
                // e.target = reader
                // e.target.result = 읽어들인 이미지의 URL
                // preview[i] == 파일이 선택된 input 태그와 인접한 preview 이미지 태그
                
                addImage.setAttribute("src", e.target.result);
                
            }
            } else { // 파일이 선택이 되지 않았을 때 (취소)
                addImage.removeAttribute("src");
            }
            
        })
        
    }



function writeValidate(){
	
	console.log(mapDiv.style.display);
	
	if(mapDiv.style.display == 'none') 	{
	 alert("지도를 입력해주세요");
	 return false
	}
	
	console.log(document.getElementById("mapAdr").value);
	
	if(document.getElementById("mapAdr").value.trim() == ""){
		 alert("지도를에 마커를 입력해주세요");
		 return false 
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
        // searchAddrFromCoords(map.getCenter(), displayCenterInfo);

        // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다  mouseEvent.
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
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


                    let mapData = {
                    lat: marker.getPosition().getLat(),
                    lng: marker.getPosition().getLng(),
                    address: address1+" "+address2,
                  };
                  
               		let json = JSON.stringify(mapData);
                    
					//document.getElementById("inputAddress").setAttribute("name", "mapAddress");
                    //document.getElementById("inputAddress").value = json;
    				const mapvalue = document.getElementById("mapAdr");
    				
                    if(mapDiv.style.display!='none' || mapData != null){ 
	    				mapvalue.value = json;                   
                    }    
                }   
            });
        });

        // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
        //kakao.maps.event.addListener(map, 'idle', function() {
        //    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
        //});

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

function addHashtag(){
    const hashDiv = document.getElementsByClassName("hashtag")[0];
    const addDiv = document.createElement("div");
    const addInput = document.createElement("input");
    const addXBtn = document.createElement("img");
    const addSelect = document.createElement("select");
    
    addInput.type = "text";
    addInput.value = "#";
    addInput.size = "15";
    addInput.setAttribute("name", "hashtag");

    addXBtn.src = contextPath + "/resources/images/x-button-327024.png";
    addXBtn.classList.add("xBtn");

   addSelect.setAttribute("name", "hashtagOption")
    addSelect.innerHTML = "<option value='location'>지역</option><option value='keyword'>키워드</option>"

    addDiv.append(addInput, addSelect, addXBtn);
    hashDiv.append(addDiv);

    addXBtn.addEventListener("click", function(){
        this.parentElement.remove();
    })

}


(function(){
    const goToListBtn = document.getElementById("goToListBtn");

    if(goToListBtn != null) { // 목록으로 버튼이 화면에 있을 때만 이벤트 추가

        goToListBtn.addEventListener("click", function(){

            const pathname = location.pathname //주소상에서 요청 경로 반환
            //    /community/board/detail

            // 이동할 주소 저장

            let url = pathname.substring(0, pathname.indexOf("/", 1));
            url += "/community/list?"
            
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
	console.log("test");
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
