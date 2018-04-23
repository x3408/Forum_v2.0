$(function(){
	  
	    $('.mainTop').on('click','a',function(e){
         var id = $(this).attr("data-to");

         $(this).css("color","red");
          $('html,body').animate({scrollTop:$('#'+id).offset().top-100+'px'}, 800);
      
        });
       //页面刷新时重新回到顶部
       
// $(window).scrollTop(0);
        $(window).scroll(function(){
  	    if($(window).scrollTop()<=648){
         $(".nav a").css("color","white");
         $(".index1").css("color","red");
  	    }else if($(window).scrollTop()>=1446&&$(window).scrollTop()<=2244){
  	  	$(".nav a").css("color","white");
  	  	$(".index2").css("color","red");
  	  }else if($(window).scrollTop()>=2244&&$(window).scrollTop()<=3042){
  	  	$(".nav a").css("color","white");
  	  	$(".index3").css("color","red");
  	  }else if($(window).scrollTop()>=3042){
  	  	$(".nav a").css("color","white");
  	  	$(".index4").css("color","red");
  	  }
       
     })
	
})

            
        