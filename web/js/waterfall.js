window.onload=function(){
	waterfall('main','box');
	var dataInt={"data":"new_file.json"};
	window.onscroll=function(){
		if(checkScrollSlide){
			var oParent=document.getElementById('main');
			for(var i=1;i<dataInt.data.length;i++){
				var oBox=document.createElement('div');
				oBox.className='box';
				oParent.appendChild(oBox);
				var otopicFrom=document.createElement('div');
				otopicFrom.className='topicFrom';
				oBox.appendChild(otopicFrom);
				var ouserid=document.createElement('span');
				ouserid.className='userid';
				otopicFrom.appendChild(ouserid);
				ouserid.innerHTML='来自话题'
				var odate=document.createElement('span');
				odate.className='date';
				otopicFrom.appendChild(odate);
				var oviewCount=document.createElement('span');
				oviewCount.className='viewCount';
				otopicFrom.appendChild(oviewCount);
				oviewCount.innerHTML='阅读量';
				var oname=document.createElement('div');
				oname.className='name';
				oBox.appendChild(oname);
				var omyPic=document.createElement('div');
				 omyPic.className='myPic';
				oname.appendChild(omyPic);
				var ousername=document.createElement('div');
				ousername.className='username';
				oname.appendChild(ousername);
				var ocontext=document.createElement('div');
				ocontext.className='context';
				oBox.appendChild(ocontext);
				var otitle=document.createElement('h6');
				otitle.className='title';
				ocontext.appendChild(otitle);
				var otext=document.createElement('div');
				otext.className='text';
				ocontext.appendChild(otext);
				var otherFollow=document.createElement('div');
				otherFollow.className='other-follow';
				oBox.appendChild(otherFollow);
				var star=document.createElement('i');
				star.className='icon-star-empty';
				otherFollow.appendChild(star);
				var likeText=document.createElement('span');
				likeText.className='like-text';
				otherFollow.appendChild(likeText);
				likeText.innerHTML='收藏';
				var otherLike=document.createElement('div');
				otherLike.className='other-like';
				oBox.appendChild(otherLike);
				var like=document.createElement('i');
				like.className='icon-heart2';
				otherLike.appendChild(like);
				var likeText=document.createElement('span');
				likeText.className='like-text';
				otherLike.appendChild(likeText);
				likeText.innerHTML='关注';
					var like=document.getElementsByClassName('icon-heart2')
	for(var n=0;n<like.length;n++){
		like[n].onclick=function(){
		 if(this.style.color=='red'){
		 	this.style.color='gray';
		 }
		 else{
		 	this.style.color='red';
		 }
	}
}	
	
	var follow=document.getElementsByClassName('icon-star-empty');
	for(var m=0;m<follow.length;m++){
			
		follow[m].onclick=function(){
			
			if(this.style.color=='red'){
			
		 		this.style.color='gray';
		 	 }
		 else{
		 		this.style.color='red';
			 }
		};
		
	};
					}
		}
		checkScrollSlide();
	}

	

function waterfall(parent,box){
	var oParent=document.getElementById(parent);
	var oBoxs=getByClass(oParent,box);
	
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
}
