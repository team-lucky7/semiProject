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
