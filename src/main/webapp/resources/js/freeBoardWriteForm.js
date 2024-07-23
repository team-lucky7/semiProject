const container = document.getElementById("container");

let i = 0;

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

    const span = document.createElement("span");
    span.classList.add("delete-image");
    span.innerHTML = "&times;"
    span.setAttribute("onclick", "deleteEl(this)")

    boardImage.append(label, input, span);

    container.append(boardImage);
    i++;
}

function deleteEl(el){
    const names = document.getElementsByClassName("submit");

    let j = Number(el.previousSibling.getAttribute("name"))
    for(let p=0; p<names.length; p++){
        let k = Number(names[p].getAttribute("name"));
        if(k > j){
            k--;
            i--;
            names[p].setAttribute("name", k);
        }
        
    }
    el.parentElement.remove();
}