window.onload=function(){
	waterfall('main','box');
//	var request=new XMLHttpRequest();
//	request.open('GET','',true);
//	request.send();
	
	var dataInt={"data":[{"innerHTML":"5"},{"innerHTML":"6"},{"innerHTML":"7"}]};
	window.onscroll=function(){
		if(checkScrollSlide){
			var oParent=document.getElementById('main');
			for(var i=1;i<dataInt.data.length;i++){
				var oBox=document.createElement('div');
				oBox.className='box';
				oParent.appendChild(oBox);
			}
		}
		checkScrollSlide();
	}
	var like=document.getElementById('like');
	like.onclick=function(){
		like.innerHTML.style.color='blue';
	}
	var follow=document.getElementById('follow');
	follow.onclick=function(){
		follow.innerHTML.style.color='red';
	};
}
function waterfall(parent,box){
	var oParent=document.getElementById(parent);
	var oBoxs=getByClass(oParent,box);
	console.log(oBoxs.length );
}
function getByClass(parent,clsName){
	var boxArr=new Array();
	var oElements=parent.getElementsByClassName('box');
	for(var i=0;i<oElements.length;i++){
		boxArr.push(oElements[i]);
	}
	return boxArr;
}
function checkScrollSlide(){
	var oParent=document.getElementById('main');
	var oBoxs=getByClass(oParent,'box');
	var lastBoxH=oBoxs[oBoxs.length-1].offsetTop+Math.floor(oBoxs[oBoxs.length-1].offsetHeight);
	var scrollTop=document.body.scrollTop ||document.documentElement.scrollTop;
	var height=document.body.clientHeight||document.document.clientHeight;
	return(lastBoxH<scrollTop+height?true:false);
}
