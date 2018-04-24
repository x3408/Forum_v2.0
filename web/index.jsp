<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: x3408
  Date: 2018/4/18
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>首页</title>
		<link rel="stylesheet" href="css/bootstrap.css?1">
		<link rel="stylesheet" href="css/newMain.css?8">
		<link rel="stylesheet" href="css/mainPage.css?2">
		<script src="js/jquery.min.js"></script>
		<script src="js/newMain.js"></script>
		<script src="js/NewWeb-Main.js"></script>
		
	</head>
	<body>

		  <div class="container mainTop">
				<span><a href=""></a></span>
				<ol class="nav nav-pills">
					<li class="nav-li" ><a href="javascript:;" class="index1" data-to="go1">发现精选</a></li>
					<li class="nav-li" ><a href="javascript:;" class="index2" data-to="go2">新闻中心</a></li>
				</ol>
				<img id="toTop" src="img/main.png">
				<ul class="nav nav-pills">
					<li class="nav-li"><a href="javascript:;"  class="index3" data-to="go3">经验分享</a></li>
					<li class="nav-li"><a href="javascript:;"  class="index4" data-to="go4">课程教育</a></li>
				</ul>
			  <s:if test="#session.user == null">
				<div id="sign">
					<a href="${pageContext.request.contextPath}/loginRegister.jsp">登陆</a>
				</div>
			  </s:if>
			  <s:else>
				  <div id="person-img">
					  <a href="${pageContext.request.contextPath}/PersonAction_findAllData">
						  <img src="${pageContext.request.contextPath}/headPortrait/${user.headPortrait}" class="img-circle">
					  </a>
					  <a id="zx" href="${pageContext.request.contextPath}/UserAction_logout">注销</a>
				  </div>
			  </s:else>
		  </div>
		  <div id="newMain">
		  <div class="newCenter">

		  </div>
		  <div id="newMainButtom">
		  	 <div id="go1">
		  	 	<div id="goOne">
		  	 	    <span>FOUDCO</span>
		  	 		<p class="goOne-find">发现精选</p>
		  	 		<p class="goOne-p">FOUR&nbsp;&nbsp;COMPANY</p>
		  	 		<div class="goOne-center">
		  	 		  <a href="${pageContext.request.contextPath}/newNewSix.html" target="_blank">
		  	 			<div class="goOne-center--left">
		  	 				<h2>要么健身，要么读书</h2>
		  	 				<h3>要么健身，要么读书，身体和灵魂，必须有一个在路上</h3>
		  	 				<p class="goOne-center--left-p">
		  	 					在等待的日子里，刻苦读书，锻炼身体，谦卑做人
		  	 					在等待的日子里，刻苦读书，锻炼身体，谦卑做人
		  	 					在等待的日子里，刻苦读书，锻炼身体，谦卑做人
		  	 					在等待的日子里，刻苦读书，锻炼身体，谦卑做人
		  	 				</p>
		  	 			</div>
		  	 		  </a>
		  	 		   <div class="goOne-center--right" id="banner">
		  	 		   	   <div id="list" style="left:-462px">
		  	 		        <a href="${pageContext.request.contextPath}/newNewSix.html" target="_blank"><img src="img/scroll5.png"></a>
					        <a href="${pageContext.request.contextPath}/newNewSix.html" target="_blank"><img src="img/scroll2.png"></a>
						    <a href="${pageContext.request.contextPath}/newNewSix.html" target="_blank"><img src="img/scroll3.png"></a>
						    <a href="${pageContext.request.contextPath}/newNewSix.html" target="_blank"><img src="img/scroll4.png"></a>
						    <a href="${pageContext.request.contextPath}/newNewSix.html" target="_blank"><img src="img/scroll5.png"></a>
						    <a href="${pageContext.request.contextPath}/newNewSix.html" target="_blank"><img src="img/scroll2.png"></a>
					      </div>
					   </div>
		  	 		<a href="javascript:;" class="arrow" id="prev">&lt;</a>
					<a href="javascript:;" class="arrow" id="next">&gt;</a>
		  	 		</div>
		  	 		<!--//开始
		  	 		
	                 <!--//结束-->
		  	 		<%--<div class="goOne-buttom">--%>
		  	 			<%--<a href="">MORE</a>--%>
		  	 		<%--</div>--%>
		  	 	</div>
		  	 </div>
		  	 <div id="go2">
		  	 	<div id="goOne">
		  	 		<span>FOUDCO</span>
		  	 		<p class="goOne-find">新闻中心</p>
		  	 		<p class="goOne-p">ABOUT&nbsp;&nbsp;COMPANY</p>
		  	 		<div class="goTwo-center">
		  	 			<a href="${pageContext.request.contextPath}/newNewOne.html" target="_blank">
		  	 				<div class="goTwo-leftTop addShade">
								<h3 style="margin-left:30px;"><b>青岛全民健身登山节</b></h3>
								<p style="margin-left:30px;margin-right:30px;" class="newCenterOne">4月21日-22日，2018年全国群众登山健身大会开幕式的暨“体彩杯”青岛市全民健身登山节活动在青岛市全面展开，这是全国群众登山健身大会开幕式第九次落户青岛，青岛也成为该项节庆活动创办以来承办开幕式最多的城市。</p>
		  	 		        </div>
		  	 			</a>
		  	 		    <a href="${pageContext.request.contextPath}/newNewTwo.html" target="_blank">
		  	 		    	    <div class="goTwo-rightTop addShade">
									<h3 style="margin-left:30px;"><b>为什么说健身是必不可做的事情？</b></h3>
									<p style="margin-left:30px;margin-right:30px;" class="newCenterOne">健身是一种习惯,如果你从不运动，如果你毕业很多年，你的身体轨迹大概是这样的：刚毕业，身体脂肪含量达到了10%-13%。</p>
								</div>
		  	 		    </a>
		  	 		    <a href="${pageContext.request.contextPath}/newNewthree.html" target="_blank">
		  	 		    	     <div class="goTwo-leftButtom addShade">
									 <h3 style="margin-left:30px;"><b>慢跑减肥正确方法 轻松快速燃烧脂肪</b></h3>
									 <p style="margin-left:30px;margin-right:30px;" class="newCenterOne">慢跑要取得减肥的效果，需要跑多远和跑多久呢。由于每个人步幅和跑步的速度都不同。因此慢跑减肥在时间上并没有明确的要求。但是在路程上却要求达到5000米，跑步的速度也不能太慢哦。</p>
								 </div>
		  	 		    </a>
		  	 		    <a href="${pageContext.request.contextPath}/newNewFour.html" target="_blank">
		  	 		    	    <div class="goTwo-rightButtom addShade">
									<h3 style="margin-left:30px;"><b>第一次去健身房的新手小白攻略！</b></h3>
									<p style="margin-left:30px;margin-right:30px;" class="newCenterOne">那么可以先做有氧运动，去跑步机上跑跑步，记得热身哦！有人会说了，既然到健身房只是跑步的话，自己也可以到外面夜跑啊，小风吹着多惬意！</p>
								</div>
		  	 		    </a>
		  	 		</div>
		  	 		<%--<div class="goOne-buttom">--%>
		  	 			<%--<a href="">MORE</a>--%>
		  	 		<%--</div>--%>
		  	 	</div>
		  	 </div>
		  	 <div id="go3">
		  	 	<img id="goThreeImg" src="img/main3.png">
		  	 	<div id="goOne">
		  	 		<span>FOUDCO</span>
		  	 		<p class="goOne-find">经验分享</p>
		  	 		<p class="goOne-p">ABOUT&nbsp;&nbsp;COMPANY</p>
		  	 		<!--//json部分-->
		  	 		<div class="goThree-Center">
		  	 			<div class="goThree-leftTop">
							<a id="title" href="http://www.baidu.com" target="_blank">
		  	 				<img id="loadOne" src=""/>
                            <p id="title1">标题</p>
							</a>
		  	 			</div>
		  	 			<div class="goThree-rightTop">
							<a id="titleTwo" href="http://www.baidu.com" target="_blank">
								<img id="loadTwo" src=""/>
							    <p id="title2">标题</p>
							</a>
		  	 			</div>
		  	 			<div class="goThree-leftCenter">
							<a id="titleThree" href="" target="_blank">
		  	 				<img id="loadThree" src=""/>
							<p id="title3">标题</p>
							</a>
		  	 			</div>
		  	 			<div class="goThree-leftButtom">
							<a id="titleFour" href="http://www.baidu.com" target="_blank">
		  	 				<img id="loadFour" src=""/>
							<p id="title4">标题</p>
							</a>
		  	 			</div>
		  	 			<div class="goThree-rightButtom">
							<a id="titleFive" href="http://www.baidu.com" target="_blank">
		  	 				<img id="loadFive" src=""/>
							<p id="title5">标题</p>
							</a>
		  	 			</div>
		  	 			<div id="oldSay">
		  	 				<h1>2018</h1>
		  	 				<p>如果杠铃没弯，你就在装样子</p>
		  	 				<p class="oldSayTwo">If the barbell is not bent,you are looking for it</p>
		  	 			</div>
		  	 		</div>
		  	 		<!--json部分结束-->
		  	 		<div class="goOne-buttom">
		  	 			<a href="${pageContext.request.contextPath}/detail.jsp	">MORE</a>
		  	 		</div>
		  	 	</div>
		  	 </div>
		  	<div id="go4">
		  	 	<div id="goOne">
		  	 		<span>FOUDCO</span>
		  	 		<p class="goOne-find">课程教育</p>
		  	 		<p class="goOne-p">ABOUT&nbsp;&nbsp;COMPANY</p>
		  	 		<div class="goFour-Center">
						<div id="addCourse">
							<div id="addCourseLeft">
								<div id="addCourseLeft-title">瑜伽基础：清晨十分钟瑜伽练习</div>
								<div>
									<img src="img/course1.png">
								</div>
							</div>
							<div id="addCourseRight">
								<div id="addCourseRight-title">课程描述:</div>
								<div id="addCourseRight-content">
									清晨十分钟瘦身瑜伽练习，现代人的瑜伽是一系列的修养身心方法。在此就介绍一下练瑜伽有什么好处
								</div>
								<img src="img/course3.png">
								<div id="price">99.00</div>
								<button id="one" class="btn btn-info">免费学习</button>
								<button id="two" class="btn btn-info">购买课程</button>
							</div>
							<div id="error">x</div>
							<div id="buySuccess">
								恭喜你购买成功！
								<div id="buyerror">x</div>
							</div>
						</div>


		  	 				<div class="goFour-CenterLeft">
		  	 				<img src="img/edu1.png">
		  	 				<p>科学训练计划</p>
		  	 			    </div> 

		  	 			

		  	 				<div class="goFour-CenterLc">
		  	 				<img src="img/edu2.png">
		  	 				<p>女神线条必备</p>
		  	 			</div>


		  	 				<div class="goFour-CenterRc">
		  	 				<img src="img/edu3.png">
		  	 				<p>热爱运动我们一起</p>
		  	 			</div>

		  	 			

		  	 				<div class="goFour-CenterRight">
		  	 				<img src="img/edu4.png">
		  	 				<p>踏青旅游好时光</p>
		  	 			</div>

		  	 		</div>   

		  	 	</div>
		  	</div>
		  </div>
		  <div id="newEnd">
		  	 <img src="img/end3.png">
		  </div>
		</div>
		
	</body>
</html>
