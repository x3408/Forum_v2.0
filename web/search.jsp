<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 许晨
  Date: 2018/3/19
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>search</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <link rel="stylesheet" href="css/search.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>

    <!--<link rel="stylesheet" type="text/css" href="css/style.css"/>-->
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
<!--下面是搜索的main了-->
<div id="searchMain">
    <div id="searchMain-body" class="container">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#E" data-toggle="tab">按标题搜索</a></li>
            <li><a href="#F" data-toggle="tab">按人名搜索</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="E" onclick="findTitle()">
                <div id="tab-content--E">
                    <s:iterator value="#topicListBySearch" var="Topiclist">
                        <p><s:property value="#Topiclist.title"></s:property></p>
                    </s:iterator>
                </div>
            </div>
            <div class="tab-pane" id="F" onclick="findUser()">
                <div id="tab-content--F">
                    <%--用户--%>
                </div>
            </div>
        </div>
    </div>
    <div id="paging">
        <ul class="pagination pagination-lg">
            <span class="sr-only"></span>
            <s:if test="#"
            <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=?&page=1">&laquo;</a></li>
            <li class="active"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">&raquo;</a></li>
        </ul>
    </div>
</div>
</body>
<script type="text/javascript">
    function findTitle() {
        window.location.href = "${pageContext.request.contextPath}/SearchAction_search?type=?&page=1";
    }
    function findUser() {
        window.location.href = "${pageContext.request.contextPath}/SearchAction_search?type=?&page=1";
    }
</script>
</html>
