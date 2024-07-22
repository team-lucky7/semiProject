let curPos = 0;
let positionValue = 0;
let IMAGE_WIDTH = 1200;

const Prev = document.getElementById("left");
const Next = document.getElementById("right");
const images = document.querySelector(".main-content");


function next(){
  if(curPos < 6){
    Prev.removeAttribute('disabled');
    positionValue -= IMAGE_WIDTH;
    images.style.transform = `translateX(${positionValue}px)`;
    curPos += 1;
  }
  if(curPos === 5){
    Next.setAttribute('disabled', 'true');
  }
}

function prev(){
  if(curPos > 0 ){
    Next.removeAttribute('disabled');
    positionValue += IMAGE_WIDTH;
    images.style.transform = `translateX(${positionValue}px)`;
    curPos -= 1;
  }
  if(curPos === 0){
    Prev.setAttribute('disabled', 'true');
  }
}

function init(){
  Prev.setAttribute('disabled', 'true');
  Next.addEventListener("click", next);
  Prev.addEventListener("click", prev);
}

init();

const btnAdd1 = document.getElementsByClassName("Btn-add");
for(let i=0; i<btnAdd1.length; i++){
  btnAdd1[i].addEventListener("click",function(){
    images.setAttribute("display", "none");
  })
}

// 이미지 지도에서 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.57850, 126.9770);

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = {
    position: markerPosition
};

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(37.57850, 126.9770), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: marker // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);