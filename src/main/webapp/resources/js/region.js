let curPos = 0;
let positionValue = 0;
let IMAGE_WIDTH = 1200;

const Prev = document.getElementById("left");
const Next = document.getElementById("right");
const images = document.querySelector(".main-content");
const mainAdd = document.getElementsByClassName("main-add");
let width = 1200 * mainAdd.length;

images.style.width = width;

function next(){
  if(curPos < mainAdd.length - 1){
    Prev.removeAttribute('disabled');
    positionValue -= IMAGE_WIDTH;
    images.style.transform = `translateX(${positionValue}px)`;
    curPos += 1;
  }
  if(curPos < 1){
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


// 이미지 지도에서 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.57850, 126.9770);

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커는 Object 형태입니다
var marker = {
    position: markerPosition
};

for(let i=0; i<mainAdd.length; i++){
  var staticMapContainer  = document.getElementsByClassName('staticMap')[i], // 이미지 지도를 표시할 div  
  staticMapOption = { 
    center: new kakao.maps.LatLng(37.57850, 126.9770), // 이미지 지도의 중심좌표
    level: 3, // 이미지 지도의 확대 레벨
    marker: marker // 이미지 지도에 표시할 마커 
  };    
    var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
}
// 이미지 지도를 생성합니다

