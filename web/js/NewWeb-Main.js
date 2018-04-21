$(function(){
	$.get("new_file.json", {page:1,type:'result_show'}, function(data, textStatus) {
		$(".goThree-leftTop img").attr("src", data[0].showImg);
		$(".goThree-leftTop a").attr("href", "TopicAction_showTopic?tid="+data[0].tid);
        $(".goThree-leftTop a").text(data[0].title);
		$(".goThree-rightTop img").attr("src",data[1].pictu);
        $(".goThree-rightTop a").attr("href", "TopicAction_showTopic?tid="+data[1].tid);
        $(".goThree-rightTop a").text(data[1].title);
        $(".goThree-leftCenter img").attr("src",data[2].pictu);
        $(".goThree-leftCenter a").attr("href", "TopicAction_showTopic?tid="+data[2].tid);
        $(".goThree-leftCenter a").text(data[2].title);
        $(".goThree-leftButtom img").attr("src",data[3].showImg);
        $(".goThree-leftButtom a").attr("href", "TopicAction_showTopic?tid="+data[3].tid);
        $(".goThree-leftButtom a").text(data[3].title);
        $(".goThree-rightButtom img").attr("src",data[4].showImg);
        $(".goThree-rightButtom a").attr("href", "TopicAction_showTopic?tid="+data[4].tid);
        $(".goThree-rightButtom a").text(data[4].title);

        // $("#title").html(data.title);
	})
	$(".goThree-leftTop img").addClass("carousel-inner img-responsive img-rounded");
	$(".goThree-rightTop img").addClass("carousel-inner img-responsive img-rounded");
	$(".goThree-leftCenter img").addClass("carousel-inner img-responsive img-rounded");
	$(".goThree-leftButtom img").addClass("carousel-inner img-responsive img-rounded");
	$(".goThree-rightButtom img").addClass("carousel-inner img-responsive img-rounded");
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
})
	


