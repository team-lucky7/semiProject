$(".nav>li").hover(function () {
    if ($(this).find("div").css("display") == "none") {
        $(this).find("div").slideDown();
    } else {
        $(this).find("div").slideUp();
    }
}, function () {
    $(this).find("div").slideUp();
})


function showRecent(){
	const searchRecent = document.getElementById("recent-search-ul");
	searchRecent.innerText = "";
	const recentWord = decodeURI(document.cookie).replace("query=", "");
	if(recentWord != ""){
		const words = recentWord.split("||");
		
		let i = 0;
		
		for(let word of words){
			const li = document.createElement("li");
			const a = document.createElement("a");
			a.innerText = word;
			a.setAttribute("onclick", "searchWord(this)");
			li.append(a);
			const span = document.createElement("span");
			span.innerHTML = "&times;"
			span.setAttribute("onclick", "deleteRecent(" + i + ")");
			li.append(span);
			searchRecent.append(li);
		}
	}
	
	recentValidate();
}

showRecent();

function searchWord(el){
	location.href = encodeURI("/semiProject/search?query=" + el.innerHTML);
}

function deleteRecent(index){
	
	const recentWord = decodeURI(document.cookie).replace("query=", "");
	let words = recentWord.split("||");
	
	words.splice(index, 1);
	
	const temp = words.join("||");

	document.cookie = "query=" + temp;
	
	showRecent();
}

function recentValidate(){
	if($(".recent-search > ul").html() == ""){
	    $(".recent-search > p").css('display', 'block');
	}else{
	    $(".recent-search > p").css('display', 'none');
	}
}


const body = document.getElementsByTagName("body")[0];
const searchIndex = document.getElementsByClassName("search-index")[0];
const inpSearchWindow = document.getElementById("inp-search-window");

function closeSearch(){
    searchIndex.style.display = "none";
    body.removeAttribute("style");
}

inpSearchWindow.addEventListener("click", function(){
    searchIndex.style.display = "block";
    body.style.overflow = "hidden";
})

