$(function(){
	
	$.get("new_file.json", {}, function(data, textStatus) {
		$(".goThree-leftTop img").attr("src", data[0].pictu);
		$(".goThree-rightTop img").attr("src",data[1].pictu);
		$(".goThree-leftCenter img").attr("src",data[2].pictu);
		$(".goThree-leftButtom img").attr("src",data[3].showImg);
		$(".goThree-rightButtom img").attr("src",data[4].showImg);
		$("#title1").html(data[0].title);
		$("#contentOne").html(data[0].descriptive);
		$("#title2").html(data[0].title);
		$("#contentTwo").html(data[0].descriptive);
		$("#title3").html(data[0].title);
		$("#contentThree").html(data[0].descriptive);
		$("#title4").html(data[0].title);
		$("#contentFour").html(data[0].descriptive);
		$("#title5").html(data[0].title);
		$("#contentFive").html(data[0].descriptive);
		
	})
	$(".goThree-Center img").addClass("carousel-inner img-responsive img-rounded");
	$(".goThree-leftTop").mouseover(function() {
		$(".goThreeShade").show();
	})
	$(".goThree-leftTop").mouseout(function() {
		$(".goThreeShade").hide();
	})
	$(".goThree-rightTop").mouseover(function() {
		$(".goThreeShadeTwo").show();
	})
	$(".goThree-rightTop").mouseout(function() {
		$(".goThreeShadeTwo").hide();
	})
	$(".goThree-leftCenter").mouseover(function() {
		$(".goThreeShadeThree").show();
	})
	$(".goThree-leftCenter").mouseout(function() {
		$(".goThreeShadeThree").hide();
	})
	$(".goThree-leftButtom").mouseover(function() {
		$(".goThreeShadeFour").show();
	})
	$(".goThree-leftButtom").mouseout(function() {
		$(".goThreeShadeFour").hide();
	})
	$(".goThree-rightButtom").mouseover(function() {
		$(".goThreeShadeFive").show();
	})
	$(".goThree-rightButtom").mouseout(function() {
		$(".goThreeShadeFive").hide();
	})
	$(".addShade").mouseover(function(){
		$(this).addClass("shade");
	})
	$(".addShade").mouseout(function(){
		$(this).removeClass("shade");
	})
window.onload=function(){
		var realH=$("#loadOne").height()+"px";
		$(".goThreeShade").css("height",realH);
		var realHT=$("#loadTwo").height()+"px";
        $(".goThreeShadeTwo").css("height",realHT);
	    var realHTr=$("#loadThree").height()+"px";
//		alert(realHTr);
		$(".goThreeShadeThree").css("height",realHTr);
		var realHTlb=$("#loadFour").height()+"px";
		$(".goThreeShadeFour").css("height",realHTlb);
		var realHTrb=$("#loadFive").height()+"px";
		$(".goThreeShadeFive").css("height",realHTrb);
	}
    var banner=document.getElementById('banner');
//  alert(banner);
	var list=document.getElementById('list');
	var prev=document.getElementById('prev');
	var next=document.getElementById('next');
	//移动函数
	function animate(offset){
		var newLeft= parseInt(list.style.left)+offset;
		list.style.left=newLeft+'px';
		if(newLeft>=-462){
			list.style.left=-1848+'px';
		}
		if(newLeft<=-2310){
			list.style.left=-462+'px';
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

		animate(-462);
	}
	prev.onclick=function(){
		if(index==1){
			index=5;
		}
		index-=1;

		animate(462);
	}
	var index=1;
	
})
	


