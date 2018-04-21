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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/newMain.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/newMain.js"></script>
    <script src="js/NewWeb-Main.js?1"></script>

</head>
<body>
<div id="newMain">
    <div class="container mainTop">
        <span><a href="">首页</a></span>
        <ol class="nav nav-pills">
            <li class="nav-li" ><a href="javascript:;" class="index1" data-to="go1">发现精选</a></li>
            <li class="nav-li" ><a href="javascript:;" class="index2" data-to="go2">新闻中心</a></li>
        </ol>
        <img src="img/main2.png">
        <ul class="nav nav-pills">
            <li class="nav-li"><a href="javascript:;"  class="index3" data-to="go3">经验分享</a></li>
            <li class="nav-li"><a href="javascript:;"  class="index4" data-to="go4">课程教育</a></li>
        </ul>
    </div>
    <div class="newCenter">
        <img src="img/main1.png">
    </div>
    <div id="newMainButtom">
        <div id="go1">
            <div id="goOne">
                <span>FOUDCO</span>
                <p class="goOne-find">发现精选</p>
                <p class="goOne-p">FOUR&nbsp;&nbsp;COMPANY</p>
                <div class="goOne-center">
                    <a href="">
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
                    <div class="goOne-center--right">

                    </div>
                </div>
                <!--//开始-->

                <!--//结束-->
                <div class="goOne-buttom">
                    <a href="">MORE</a>
                </div>
            </div>
        </div>
        <div id="go2">
            <div id="goOne">
                <span>FOUDCO</span>
                <p class="goOne-find">新闻中心</p>
                <p class="goOne-p">ABOUT&nbsp;&nbsp;COMPANY</p>
                <div class="goTwo-center">
                    <a href="">
                        <div class="goTwo-leftTop addShade">
                            nihaoshijie
                        </div>
                    </a>
                    <a>
                        <div class="goTwo-rightTop addShade">右上</div>
                    </a>
                    <a>
                        <div class="goTwo-leftButtom addShade">左下</div>
                    </a>
                    <a>
                        <div class="goTwo-rightButtom addShade">右下</div>
                    </a>
                </div>
                <div class="goOne-buttom">
                    <a href="">MORE</a>
                </div>
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
                        <img id="loadOne" src=""/>
                        <div class="goThreeShade">
                            <a id="title" href=""></a>
                        </div>
                    </div>
                    <div class="goThree-rightTop">
                        <img id="loadTwo" src=""/>
                        <div class="goThreeShadeTwo">
                            <a id="titleTwo" href=""></a>
                        </div>
                    </div>
                    <div class="goThree-leftCenter">
                        <img id="loadThree" src=""/>
                        <div class="goThreeShadeThree">
                            <a id="titleThree" href=""></a>
                        </div>
                    </div>
                    <div class="goThree-leftButtom">
                        <img id="loadFour" src=""/>
                        <div class="goThreeShadeFour">
                            <a id="titleFour" href=""></a>
                        </div>
                    </div>
                    <div class="goThree-rightButtom">
                        <img id="loadFive" src=""/>
                        <div class="goThreeShadeFive">
                            <a id="titleFive" href=""></a>
                        </div>
                    </div>
                    <div id="oldSay">
                        <h3>2018</h3>
                        <p>如果杠铃没弯，你就在装样子</p>
                        <p class="oldSayTwo">If the barbell is not bent,you are looking for it</p>
                    </div>
                </div>
                <!--json部分结束-->
                <div class="goOne-buttom">
                    <a href="${pageContext.request.contextPath}/detail.jsp">MORE</a>
                </div>
            </div>
        </div>
        <div id="go4">
            <div id="goOne">
                <span>FOUDCO</span>
                <p class="goOne-find">课程教育</p>
                <p class="goOne-p">ABOUT&nbsp;&nbsp;COMPANY</p>
                <div class="goFour-Center">
                    <a href="">
                        <div class="goFour-CenterLeft">
                            <img src="img/edu1.png">
                            <p>科学训练计划</p>
                        </div>
                    </a>

                    <a href="">
                        <div class="goFour-CenterLc">
                            <img src="img/edu2.png">
                            <p>女神线条必备</p>
                        </div>
                    </a>

                    <a href="">
                        <div class="goFour-CenterRc">
                            <img src="img/edu3.png">
                            <p>热爱运动我们一起</p>
                        </div>
                    </a>

                    <a href="">
                        <div class="goFour-CenterRight">
                            <img src="img/edu4.png">
                            <p>踏青旅游好时光</p>
                        </div>
                    </a>

                </div>
                <div class="goOne-buttom">
                    <a href="">MORE</a>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br /><br /><br /><br /><br /><br /><br />
</div>

</body>
</html>
