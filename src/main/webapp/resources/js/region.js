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


const btnAdd1 = document.getElementsByClassName("Btn-add")[0].addEventListener("click",function(){
  const btnAdd1 = document.createElement("button");
  btnAdd1.classList.add("#info-update-btn")

})




               