
//       导航栏被选中时的效果显示
var nav = document.getElementById('nav');
var titles = nav.getElementsByTagName('li');
for(var s = 0; s < titles.length; s++) {
	titles[s].id = s;
	titles[s].onclick = function() {
		for(var j = 0; j < titles.length; j++) {
			titles[j].className = '';
			titles[j].getElementsByTagName('a')[0].style.color = "#FFFFFF";
			
		}
		this.className = 'select';
		this.getElementsByTagName('a')[0].style.color = "rgb(15, 163, 232)";
	}
}

var ali = document.getElementsByTagName('li');
for(i = 0; i < ali.length; i++) {
	ali[i].onmouseover = function() {
		this.getElementsByTagName('a')[0].style.color = "rgb(15, 163, 232)";
	}
	ali[i].onmouseout = function() {
		if(this.className){
			this.getElementsByTagName('a')[0].style.color = "rgb(15, 163, 232)";
		}
		else{
			this.getElementsByTagName('a')[0].style.color = "#FFFFFF";
		}
	}
}