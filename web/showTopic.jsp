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

    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/user.css">
    <script src="js/user.js"></script>
</head>
<body>
<body>
<div class="header">
    <div class="header-content">
        <div class="logo"><a href="${pageContext.request.contextPath}/home.jsp"><img src="img/logo.png"></a></div><div class="search" id="search-form">
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
            <p>一个好名字</p>
        </div>
    </div>
    <div id="specificWrite-right">
        <div id="specificWrite-right--top">
            <p>${topic.title}</p>
        </div>
        <div id="specificWrite-right--center">
            <jsp:include page="${topic.content}"></jsp:include>
        </div>
        <div id="specificWrite-right--buttom"></div>
    </div>


</div>

</body>

</body>
</html>
