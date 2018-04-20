<%--
  Created by IntelliJ IDEA.
  User: x3408
  Date: 2018/4/20
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/asidenav.css" />
    <link rel="stylesheet" type="text/css" href="css/personCenter.css" />
</head>

<body>
<div class="head">
    <div class="main">
        <div class="house">
            <a href=""><img src="img/house.png" width="30px" /></a>

        </div>
        <div class="headimg">
            <img class="img-circle" src="img/xiaobai 8.jpg" width="80px" height="80px" />
            <p>@DChyw</p>
        </div>
        <div class="nav">
            <ul class="nav-one">
                <li>
                    <a href="personCenter.html">我的关注</a>
                </li>
                <li>
                    <a href="mycontext.html">我的文章</a>
                </li>
            </ul>
            <ul class="nav-two">
                <li>
                    <a href="">我的粉丝</a>
                </li>
                <li>
                    <a href="myletter.html">我的私信</a>
                    <span id="news">new</span>
                </li>
            </ul>
            <svg width="0" height="0">
                <defs>
                    <filter id="goo">
                        <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur"></feGaussianBlur>
                        <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 19 -9" result="goo"></feColorMatrix>
                        <feComposite in="SourceGraphic" in2="goo" operator="atop"></feComposite>
                    </filter>
                </defs>
            </svg>
            <div class="aside-nav  animated" id="aside-nav">
                <label for="" class="aside-menu" title="按住拖动">菜单</label>

                <a href="javascript:void(0)" title="签到" class="menu-item menu-first">签到</a>
                <a href="javascript:void(0)" title="发表文章" class="menu-item menu-second">发表文章</a>
                <!--<a href="javascript:void(0)" title="个人中心" class="menu-item menu-third">个人中心</a>
                            <a href="javascript:void(0)" title="微信公众号" class="menu-item menu-line menu-fourth">关注<br>微信</a> <!-- *跳到商家微信推广* -->-->
            </div>

        </div>
    </div>
</div>
<script type="text/javascript"src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"src="js/new.js"></script>
<script type="text/javascript">
    var oli = document.getElementsByTagName('li');
    oli[2].style.border="1px solid #fff";
    oli[2].style.borderRadius="20px";
</script>
</body>

</html>