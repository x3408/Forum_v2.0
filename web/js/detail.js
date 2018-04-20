
//       导航栏被选中时的效果显示
var nav = document.getElementById('nav');
var titles = nav.getElementsByTagName('li');
for(var s = 0; s < titles.length; s++) {
	titles[s].id = s;
	titles[s].onclick = function() {
		for(var j = 0; j < titles.length; j++) {
			titles[j].className = '';
			titles[j].getElementsByTagName('a')[0].style.color = "#FFFFFF";
            /*if (j == 0){
            	//获取a标签 href跳转
                // titles[0].getElementsByTagName('a')[0].attr(href, '${pageContext.request.contextPath}/OldPage/home');
			} else if (j == 1) {
            	fall(1, 'result_show')
			} else if (j == 2) {
                fall(1, 'training_experience')
			} else if(j == 3) {
                fall(1, 'diet_plan')
			} else if(j == 4) {
            	fall(1, 'diary')
			}*/
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