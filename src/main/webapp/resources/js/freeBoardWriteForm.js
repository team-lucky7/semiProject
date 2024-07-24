const container = document.getElementById("container");

let i = 0;

if(loadContentCount != null){
    i += loadContentCount;
}

function addText(){
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
}

function addImage(){
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
}

function changeImg(typeFile){
    if(typeFile.files[0] != undefined){

        const reader = new FileReader();
        reader.readAsDataURL(typeFile.files[0]);

        reader.onload = function(e) {
            typeFile.previousSibling.firstElementChild.setAttribute("src", e.target.result);
        }

    }else{
        typeFile.previousSibling.firstElementChild.removeAttribute("src");
    }
}

function deleteEl(el){
    const submitEl = document.getElementsByClassName("submit");

    let j = Number(el.previousSibling.getAttribute("name"))
    for(let p=0; p<submitEl.length; p++){
        let k = Number(submitEl[p].getAttribute("name"));
        if(k > j){
            k--;
            i--;
            submitEl[p].setAttribute("name", k);
        }
        
    }

    el.parentElement.remove();
}

function writeValidate(){

    const boardTitle = document.getElementsByName('boardTitle')[0];
    const submitEl = document.getElementsByClassName("submit");

    if(boardTitle.value.trim().length == 0){
        alert("제목을 입력해주세요");
        boardTitle.focus();
        return false;
    }

    if(container.innerHTML.length == 0){
        alert("내용을 입력해주세요");
        return false;
    }

    for(let i=0; i<submitEl.length; i++){
        
        if(submitEl[i].value == ""){
            alert("내용이나 사진을 넣어주세요.");
            return false;
        }
    }

    document.getElementById("count").value = i;

    return true;
}