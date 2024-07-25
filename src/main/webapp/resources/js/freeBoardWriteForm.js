let i = 0;

if(loadContentCount != null){
    i += loadContentCount;
}

function addText(){
    const container = document.getElementById("container");

    const boardText = document.createElement("div");
    boardText.classList.add("boardText")

    const text = document.createElement("textarea");
    text.classList.add("submit");
    text.setAttribute("name", i);

    const span = document.createElement("span");
    span.classList.add("delete-image");
    span.innerHTML = "&times;"
    span.setAttribute("onclick", "deleteEl(this)")

    boardText.append(text, span)

    container.append(boardText);
    i++;
    console.log(i);
}

function addImage(){
    const container = document.getElementById("container");
    
    const boardImage = document.createElement("div");
    boardImage.classList.add("boardImage")

    const label = document.createElement("label");
    label.setAttribute("for", "img" + i);
    const img = document.createElement("img");

    label.append(img);

    const input = document.createElement("input");
    input.setAttribute("type", "file");
    input.classList.add("inputImage");
    input.classList.add("submit");
    input.setAttribute("id", "img" + i)
    input.setAttribute("accept", "image/*");
    input.setAttribute("name", i);
    input.setAttribute("onchange", "changeImg(this)");

    const span = document.createElement("span");
    span.classList.add("delete-image");
    span.innerHTML = "&times;"
    span.setAttribute("onclick", "deleteEl(this)")

    boardImage.append(label, input, span);

    container.append(boardImage);
    i++;
    console.log(i);
}

function changeImg(typeFile){
    if(typeFile.files[0] != undefined){

        const reader = new FileReader();
        reader.readAsDataURL(typeFile.files[0]);

        reader.onload = function(e) {
            typeFile.previousElementSibling.firstElementChild.setAttribute("src", e.target.result);
        }

    }else{
        typeFile.previousElementSibling.firstElementChild.removeAttribute("src");
    }
}

function deleteEl(el){
    const submitEl = document.getElementsByClassName("submit");

    let elNum = Number(el.previousElementSibling.getAttribute("name"));
    for(let j = elNum + 1; j<submitEl.length; j++){
        submitEl[j].setAttribute("name", elNum++);
    }
    i--;
    el.parentElement.remove();
}

function writeValidate(){

    const boardTitle = document.getElementsByName('boardTitle')[0];
    const submitEl = document.getElementsByClassName("submit");
    const div = document.getElementById("container");

    if(boardTitle.value.trim().length == 0){
        boardTitle.focus();
        return false;
    }

    if(div.innerText.trim().length == 0){
        alert("내용이나 사진을 넣어주세요.");
        return false;
    }

    for(let i=0; i<submitEl.length; i++){
        
        if(submitEl[i].value == ""){
            alert("내용을 입력하거나 사진을 재업로드해주세요.");
            return false;
        }
    }

    document.getElementById("count").value = i;

    console.log(document.getElementById("count").value);

    return true;
}