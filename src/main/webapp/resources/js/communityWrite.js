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
    addXBtn.src = "../resources/images/x-button-327024.png";
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
    const addText = document.createElement("textarea");
    const addXBtn = document.createElement("img");
    const container = document.getElementById("container2");
    
    addDiv.classList.add("halfContent");
    addSpan.innerHTML = "작성글(반)<br>";
    addSpan.classList.add("subtitle");
    addText.classList.add("halftext");
    addXBtn.src = "../resources/images/x-button-327024.png";
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
    addInput.setAttribute("name","photo");
    addImage.src = "../resources/images/image-icon-10.jpg";
    addImage.classList.add("fullImage");
    addXBtn.src = "../resources/images/x-button-327024.png";
    addXBtn.classList.add("xBtn");

    addXBtn.addEventListener("click", function(){
        this.parentElement.remove();
    })

    addDiv.append(addSpan, addInput, addImage, addXBtn);
    container.append(addDiv);
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
    addInput.setAttribute("name","photo");
    addImage.src = "../resources/images/image-icon-10.jpg";
    addImage.classList.add("halfImage");
    addXBtn.src = "../resources/images/x-button-327024.png";
    addXBtn.classList.add("xBtn");

    addXBtn.addEventListener("click", function(){
        this.parentElement.remove();
    })

    addDiv.append(addSpan, addInput, addImage, addXBtn);
    container.append(addDiv);
}

var mapContainer = document.getElementById('mapContainer');
var container = document.getElementById('map');
var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3
    };

var map = new kakao.maps.Map(container, options);

function hideMap(){

mapContainer.style.display = 'none';

}

function showMap(){

    mapContainer.style.display = 'block';
    
}

function addHashtag(){
    const hashDiv = document.getElementsByClassName("hashtag")[0];
    const addDiv = document.createElement("div");
    const addInput = document.createElement("input");
    const addXBtn = document.createElement("img");
    
    addInput.type = "text";
    addInput.value = "#";

    addXBtn.src = "../resources/images/x-button-327024.png";
    addXBtn.classList.add("xBtn");

    addDiv.append(addInput, addXBtn);
    hashDiv.append(addDiv);

    addXBtn.addEventListener("click", function(){
        this.parentElement.remove();
    })

}