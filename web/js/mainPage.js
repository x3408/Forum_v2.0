
	var banner=document.getElementById('banner');
	var list=document.getElementById('list');
	var buttons=document.getElementById('buttons').getElementsByTagName('span');
	var prev=document.getElementById('prev');
	var next=document.getElementById('next');
	//移动函数
	function animate(offset){
		var newLeft= parseInt(list.style.left)+offset;
		list.style.left=newLeft+'px';
		if(newLeft>=-723){
			list.style.left=-2892+'px';
		}
		if(newLeft<=-3615){
			list.style.left=-723+'px';
		}
	}
	//自动切换
	var timer;
	function play(){
		timer=setInterval(function(){
			next.onclick();
		},3000);
	}
	function stop(){
		clearInterval(timer);
	}
	banner.onmouseover=stop;
	banner.onmouseout=play;
	play();
	//点击箭头
	next.onclick=function(){
		if(index==4){
			index=0;
		}
		index+=1;
		showButton();
		animate(-723);
	}
	prev.onclick=function(){
		if(index==1){
			index=5;
		}
		index-=1;
		showButton();
		animate(723);
	}
	var index=1;//确定亮起哪个小圆点
	//亮起小圆点
	function showButton(){
		for(var i=0;i<buttons.length;i++){
			if(buttons[i].className=='on'){
				buttons[i].className='';
				break;
			}
		}
		buttons[index-1].className='on';
	}
	// 点击按钮切换
	for(var i=0;i<buttons.length;i++){
		buttons[i].onclick=function(){
			if(this.className=='on'){
				return;
			}
			var myIndex=parseInt(this.getAttribute('index'));
			var offset=-723*(myIndex-index);
			 animate(offset);
			 index=myIndex;
			 showButton();
			
		}
	}

