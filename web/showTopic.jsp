<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 许晨
  Date: 2018/3/16
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>user</title>
    <link rel="stylesheet" href="css/user.css">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/user.js"></script>
</head>
<body>
<div class="header">
    <div class="header-content">
        <div class="logo"><a href=""><img src="img/logo.png"></a></div><div class="search" id="search-form">
        <form>
            <input type="text"  class="search-text" id="search-input"/><button><i class="icon-search"></i></button>
        </form>
    </div>
    </div>
</div>
</div>
<!--下面是我的代码-->
<div id="specificWrite">
    <div id="specificWrite-left">
        <div id="specificWrite-left--headImg">
            <img src="img/timg (1).jpeg" class="img-circle">
            <p>${topicUser.username}</p>
        </div>
    </div>
    <div id="specificWrite-right">
        <div id="specificWrite-right--top">作者发表于 ${topic.time}</div>
        <div id="specificWrite-right--center">
            <div id="title">
                ${topic.title}
            </div>
            <div id="content">
                <jsp:include page="${topic.content}"></jsp:include>
            </div>
        </div>
        <div id="specificWrite-right--buttom"></div>
    </div>


</div>

</body>
</html>
