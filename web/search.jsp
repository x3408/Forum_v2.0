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
        <div class="logo"><a href=""><img src="img/logo.png"></a></div>
        <div class="search" id="search-form">
            <input type="text" class="search-text" id="search-input" name="keyword" value="<s:property value="#topicBeanBySearch.keyword"/> "/><button><i onclick="search()" class="icon-search"></i></button>
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
            <div class="tab-pane active" id="E" onclick="searchTitle()">
                <div id="tab-content--E" >
                    <s:iterator value="#topicListBySearch" var="Topiclist">
                        <p><s:property value="#Topiclist.title"></s:property></p>
                    </s:iterator>
                    <div id="paging">
                        <ul class="pagination pagination-lg">
                            <span class="sr-only"></span>
                            <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=title&page=1&keyword=<s:property value="#topicBeanBySearch.keyword" />">第一页</a></li>
                            <s:if test="#topicBeanBySearch.page!=1 && #topicBeanBySearch.totalPage!=0">
                                <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=title&page=<s:property value="#topicBeanBySearch.page-1" />&keyword=<s:property value="#topicBeanBySearch.keyword" /> ">上一页</a></li>
                            </s:if>
                            <s:iterator begin="#topicBeanBySearch.page-2>0?#topicBeanBySearch.page-2:1" var="i" end="#topicBeanBySearch.page+3>#topicBeanBySearch.totalPage?#topicBeanBySearch.totalPage:#topicBeanBySearch.page+3" step="1">
                                <s:if test="#topicBeanBySearch.page == #i">
                                    <li class="active"><a><s:property value="#i"/></a></li>
                                </s:if>
                                <s:if test="#topicBeanBySearch.page != #i">
                                    <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=title&page=<s:property value="#i"/>&keyword=<s:property value="#topicBeanBySearch.keyword" /> "><s:property value="#i"/></a></li>
                                </s:if>
                            </s:iterator>
                            <s:if test="#topicBeanBySearch.page!=#topicBeanBySearch.totalPage && #topicBeanBySearch.totalPage!=0">
                                <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=title&page=<s:property value="#topicBeanBySearch.page+1" />&keyword=<s:property value="#topicBeanBySearch.keyword" /> ">下一页</a></li>
                            </s:if>
                            <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=title&page=<s:property value="#topicBeanBySearch.totalPage" />&keyword=<s:property value="#topicBeanBySearch.keyword" /> ">最后一页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="F" onclick="searchUser()">
                <div id="tab-content--F">
                    <%--用户--%>
                        <s:iterator value="#topicListBySearch" var="Topiclist">
                            <p><s:property value="#Topiclist.title"></s:property></p>
                        </s:iterator>
                        <div id="paging">
                            <ul class="pagination pagination-lg">
                                <span class="sr-only"></span>
                                <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=user&page=1&keyword=<s:property value="#topicBeanBySearch.keyword" />">第一页</a></li>
                                <s:if test="#topicBeanBySearch.page!=1 && #topicBeanBySearch.totalPage!=0">
                                    <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=user&page=<s:property value="#topicBeanBySearch.page-1" />&keyword=<s:property value="#topicBeanBySearch.keyword" /> ">上一页</a></li>
                                </s:if>
                                <s:iterator begin="#topicBeanBySearch.page-2>0?#topicBeanBySearch.page-2:1" var="i" end="#topicBeanBySearch.page+3>#topicBeanBySearch.totalPage?#topicBeanBySearch.totalPage:#topicBeanBySearch.page+3" step="1">
                                    <s:if test="#topicBeanBySearch.page == #i">
                                        <li class="active"><a><s:property value="#i"/></a></li>
                                    </s:if>
                                    <s:if test="#topicBeanBySearch.page != #i">
                                        <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=user&page=<s:property value="#i"/>&keyword=<s:property value="#topicBeanBySearch.keyword" /> "><s:property value="#i"/></a></li>
                                    </s:if>
                                </s:iterator>
                                <s:if test="#topicBeanBySearch.page!=#topicBeanBySearch.totalPage && #topicBeanBySearch.totalPage!=0">
                                    <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=user&page=<s:property value="#topicBeanBySearch.page+1" />&keyword=<s:property value="#topicBeanBySearch.keyword" /> ">下一页</a></li>
                                </s:if>
                                <li><a href="${pageContext.request.contextPath}/SearchAction_search?type=user&page=<s:property value="#topicBeanBySearch.totalPage" />&keyword=<s:property value="#topicBeanBySearch.keyword" /> ">最后一页</a></li>
                            </ul>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function searchTitle() {
        var keyword = $("#search-input").val();
        window.location.href="${pageContext.request.contextPath}/SearchAction_search?type=title&page=1&keyword="+keyword;
    }
    function searchUser() {
        var keyword = $("#search-input").val();
        window.location.href="${pageContext.request.contextPath}/SearchAction_search?type=user&page=1&keyword="+keyword;
    }
</script>
</html>
