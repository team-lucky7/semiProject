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

function addMap(){
    const addDiv = document.createElement("div");
    const addSpan = document.createElement("span");
    const container = document.getElementById("container2");
    const addInput = document.createElement("input");
    const addImage = document.createElement("img");
    const addXBtn = document.createElement("img");

    addDiv.classList.add("fullContent");
    addSpan.innerHTML = "지도입력";
    addSpan.classList.add("subtitle");
    addInput.setAttribute("type","file");
    addInput.setAttribute("name","map");
    addImage.src = "../resources/images/Map_1135px_1195280_42272.png";
    addImage.classList.add("fullImage");
    addXBtn.src = "../resources/images/x-button-327024.png";
    addXBtn.classList.add("xBtn");

    addXBtn.addEventListener("click", function(){
        this.parentElement.remove();
    })

    addDiv.append(addSpan, addInput, addImage, addXBtn);
    container.append(addDiv);
    
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