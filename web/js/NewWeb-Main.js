$(function(){
	
	$.get("${pageContext.request.contextPath}/TopicAction_showTopicByType",
		{page:1, type:'result_show'},
		function(data) {
			$(".goThree-leftTop img").attr("src", data[0].showImg);
			$(".goThree-rightTop img").attr("src",data[1].showImg);
			$(".goThree-leftCenter img").attr("src",data[2].showImg);
			$(".goThree-leftButtom img").attr("src",data[3].showImg);
			$(".goThree-rightButtom img").attr("src",data[4].showImg);

			$("#title1").html(data[0].title);
			$("#title").attr("href", '/TopicAction_showTopic?tid='+data[0].tid);
			$("#contentOne").html(data[0].descriptive);

            $("#titleTwo").attr("href", '/TopicAction_showTopic?tid='+data[1].tid);
            $("#title2").html(data[1].title);
			$("#contentTwo").html(data[1].descriptive);

            $("#titleThree").attr("href", '/TopicAction_showTopic?tid='+data[2].tid);
            $("#title3").html(data[2].title);
			$("#contentThree").html(data[2].descriptive);

            $("#titleFour").attr("href", '/TopicAction_showTopic?tid='+data[3].tid);
            $("#title4").html(data[3].title);
			$("#contentFour").html(data[3].descriptive);

            $("#titleFive").attr("href", '/TopicAction_showTopic?tid='+data[4].tid);
            $("#title5").html(data[4].title);
			$("#contentFive").html(data[4].descriptive);
	},
	"json")
    window.onload=function(){
    var realH=$("#loadOne").height()+"px";
    $(".goThreeShade").css("height",realH);
    var realHT=$("#loadTwo").height()+"px";
    $(".goThreeShadeTwo").css("height",realHT);
    var realHTr=$("#loadThree").height()+"px";

    $(".goThreeShadeThree").css("height",realHTr);
    var realHTlb=$("#loadFour").height()+"px";
    $(".goThreeShadeFour").css("height",realHTlb);
    var realHTrb=$("#loadFive").height()+"px";
    $(".goThreeShadeFive").css("height",realHTrb);
    }
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
    $("#toTop").click(function(){
    	$("html,body").animate({scrollTop:0},500);
	})
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
    //下面是课程教育
    $(".goFour-CenterLc").click(function(){
        $("#addCourseLeft-title").html("瑜伽基础：清晨十分钟瑜伽练习");
        $("#addCourseLeft img").attr("src","img/course1.png");
        $("#addCourseRight-content").html("清晨十分钟瘦身瑜伽练习，现代人的瑜伽是一系列的修养身心方法。在此就介绍一下练瑜伽有什么好处");
        $("#addCourse").fadeIn(500);
    })
    $(".goFour-CenterLeft").click(function(){
        $("#addCourseLeft-title").html("杠铃基础：每天坚持练习杠铃");
        $("#addCourseLeft img").attr("src","img/course2.png");
        $("#addCourseRight-content").html("每天进行适当的杠铃练习对身体有很大的好处，在此就介绍一下练习杠铃有什么好处");
        $("#addCourse").fadeIn(500);
    })
    $(".goFour-CenterRc").click(function(){
        $("#addCourseLeft-title").html("篮球运动：与朋友一起打篮球");
        $("#addCourseLeft img").attr("src","img/course5.png");
        $("#addCourseRight-content").html("每天空闲的时候可以和朋友去室外打打篮球，在此就介绍一下打篮球有什么好处");
        $("#addCourse").fadeIn(500);
    })
    $(".goFour-CenterRight").click(function(){
        $("#addCourseLeft-title").html("踏青运动：最舒适的运动");
        $("#addCourseLeft img").attr("src","img/course6.png");
        $("#addCourseRight-content").html("春天是适合踏青的最好时机，让我们一起把握时机。让我们看看有关于踏青的项目");
        $("#addCourse").fadeIn(500);
    })
    $("#two").click(function(){
        $("#buySuccess").fadeIn(500);
    })
    $("#buyerror").click(function(){
        $("#buySuccess").fadeOut(500);
    })
    $("#error").click(function(){
        $("#addCourse").fadeOut(500);
    })


})
	


