<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: x3408
  Date: 2018/4/20
  Time: 10:25
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
            <a href="${pageContext.request.contextPath}/index.jsp"><img src="img/house.png" width="30px" /></a>

        </div>
        <div class="headimg">
            <img class="img-circle" src="/headPortrait/${listAllData.headPortrait}" width="80px" height="80px" />
            <p>${listAllData.username}</p>
        </div>
        <div class="nav">
            <ul class="nav-one">
                <li>
                    <a href="javascript:0">我的关注</a>
                </li>
                <li>
                    <a href="mycontext.jsp">我的文章</a>
                </li>
            </ul>
            <ul class="nav-two">
                <li>
                    <a href="myfans.jsp">我的粉丝</a>
                </li>
                <li>
                    <s:if test="#session.user.uid == #session.listAllData.uid">
                        <a href="myletter.jsp">我的私信</a>
                        <span id="news">new</span>
                    </s:if>
                    <s:else>
                        <a onclick="">发送私信</a>
                    </s:else>
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
                <label class="aside-menu" title="按住拖动">菜单</label>

                <a href="javascript:void(0)" title="签到" class="menu-item menu-first">签到</a>
                <s:if test="#session.user.uid == #session.listAllData.uid">
                    <a href="${pageContext.request.contextPath}/OldPage/addTopic.jsp" title="发表文章" class="menu-item menu-second">发表文章</a>
                </s:if>
                <s:else>
                    <a onclick="" title="发送私信" class="menu-item menu-second">发送私信</a>
                </s:else>
            </div>

        </div>
    </div>
</div>
<div class="content">
    <div class="content-main">
        <div class="content-text"></div>
    </div>
</div>
<script type="text/javascript"src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"src="js/new.js"></script>
<script type="text/javascript">
    var oli = document.getElementsByTagName('li');
    oli[0].style.border = "1px solid #fff";
    oli[0].style.borderRadius = "20px";

</script>
</body>

</html>
