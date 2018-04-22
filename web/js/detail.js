
//       导航栏被选中时的效果显示
var nav = document.getElementById('nav');
var titles = nav.getElementsByTagName('li');
for(var s = 0; s < titles.length; s++) {
	titles[s].onclick = function(s){

        return function () {
            if (s == 0){
                //获取a标签 href跳转
                // titles[0].getElementById("index").attr("href", '${pageContext.request.contextPath}/index.jsp');
                window.open("index.jsp","_self");
            } else if (s == 1) {
                fall(1, 'result_show')
            } else if (s == 2) {
                fall(1, 'training_experience')
            } else if(s == 3) {
                fall(1, 'diet_plan')
            } else if(s == 4) {
                fall(1, 'diary')
            }
            changeStyle(this);
        }




    }(s)
}
function changeStyle(obj){
    for(var j = 0; j < titles.length; j++) {
		titles[j].className = '';
		titles[j].getElementsByTagName('a')[0].style.color = "#FFFFFF";
	}
    obj.className = 'select';
    obj.getElementsByTagName('a')[0].style.color = "rgb(15, 163, 232)";
}
for(var i = 0; i < titles.length; i++) {
	titles[i].onmouseover = function() {
		this.getElementsByTagName('a')[0].style.color = "rgb(15, 163, 232)";
	}
	titles[i].onmouseout = function() {
		if(this.className){
			this.getElementsByTagName('a')[0].style.color = "rgb(15, 163, 232)";
		}
		else{
			this.getElementsByTagName('a')[0].style.color = "#FFFFFF";
		}
	}
}