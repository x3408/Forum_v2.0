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

    <link rel="stylesheet" href="css/search.css?1">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>

</head>
<body>
<div class="header">
    <div class="header-content">
        <div class="logo"><a href=""><img src="img/logo.png"></a></div>
        <div class="search" id="search-form">
            <input type="text" class="search-text" id="search-input" value="<s:property value="#userBean.keyword"/> "/><button><i onclick="search()" class="icon-search"></i></button>
        </div>
    </div>
</div>
<!--下面是搜索的main了-->
<div id="searchMain">
    <div id="searchMain-body" class="container">
        <ul class="nav nav-tabs">
            <li id="titlelab" class="active"><a href="#E" data-toggle="tab">按标题搜索</a></li>
            <li id="userlab"><a href="#F" data-toggle="tab">按人名搜索</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="E">
                <div id="tab-content--E" >
                    <s:iterator value="#topicListBySearch" var="Topiclist">
                        <p><a href="TopicAction_showTopic?tid=<s:property value="#Topiclist.tid"/>" style="text-decoration:none;color:#202678;"><s:property value="#Topiclist.title" /></a></p>
                    </s:iterator>


                    <div id="paging">
                        <ul class="pagination pagination-lg">
                            <span class="sr-only"></span>
                            <s:if test="#topicBean.page!=1 && #topicBean.totalPage!=0">
                                <li><a href="${pageContext.request.contextPath}/SearchAction_search?page=1&keyword=<s:property value="#topicBean.keyword" />">第一页</a></li>
                                <li><a href="${pageContext.request.contextPath}/SearchAction_search?page=<s:property value="#topicBean.page-1" />&keyword=<s:property value="#topicBean.keyword" /> ">上一页</a></li>
                            </s:if>
                            <s:iterator begin="#topicBean.page-2>0?#topicBean.page-2:1" var="i" end="#topicBean.page+3>#topicBean.totalPage?#topicBean.totalPage:#topicBean.page+3" step="1">
                                <s:if test="#topicBean.page == #i">
                                    <li class="active"><a><s:property value="#i"/></a></li>
                                </s:if>
                                <s:if test="#topicBean.page != #i">
                                    <li><a href="${pageContext.request.contextPath}/SearchAction_search?page=<s:property value="#i"/>&keyword=<s:property value="#topicBean.keyword" /> "><s:property value="#i"/></a></li>
                                </s:if>
                            </s:iterator>
                            <s:if test="#topicBean.page!=#topicBean.totalPage && #topicBean.totalPage!=0">
                                <li><a href="${pageContext.request.contextPath}/SearchAction_search?page=<s:property value="#topicBean.page+1" />&keyword=<s:property value="#topicBean.keyword" /> ">下一页</a></li>
                            <li><a href="${pageContext.request.contextPath}/SearchAction_search?page=<s:property value="#topicBean.totalPage" />&keyword=<s:property value="#topicBean.keyword" /> ">最后一页</a></li>
                            </s:if>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="F" >
                <div id="tab-content--F">
                    <%--用户--%>
                        <s:iterator value="#userListBySearch" var="userList">
                            <p><s:property value="#userList.username"></s:property></p>
                        </s:iterator>


                        <div id="paging">
                            <ul class="pagination pagination-lg">
                                <span class="sr-only"></span>
                                <s:if test="#userBean.page!=1 && #userBean.totalPage!=0">
                                <li><a href="${pageContext.request.contextPath}/SearchAction_search?page=1&keyword=<s:property value="#userBean.keyword" />">第一页</a></li>
                                    <li><a href="${pageContext.request.contextPath}/SearchAction_search?page=<s:property value="#userBean.page-1" />&keyword=<s:property value="#userBean.keyword" /> ">上一页</a></li>
                                </s:if>
                                <s:iterator begin="#userBean.page-2>0?#userBean.page-2:1" var="i" end="#userBean.page+3>#userBean.totalPage?#userBean.totalPage:#userBean.page+3" step="1">
                                    <s:if test="#topicBeanBySearch.page == #i">
                                        <li class="active"><a><s:property value="#i"/></a></li>
                                    </s:if>
                                    <s:if test="#userBean.page != #i">
                                        <li><a href="${pageContext.request.contextPath}/SearchAction_search?page=<s:property value="#i"/>&keyword=<s:property value="#userBean.keyword" /> "><s:property value="#i"/></a></li>
                                    </s:if>
                                </s:iterator>
                                <s:if test="#userBean.page!=#userBean.totalPage && #userBean.totalPage!=0">
                                    <li><a href="${pageContext.request.contextPath}/SearchAction_search?page=<s:property value="#userBean.page+1" />&keyword=<s:property value="#userBean.keyword" /> ">下一页</a></li>
                                <li><a href="${pageContext.request.contextPath}/SearchAction_search?page=<s:property value="#userBean.totalPage" />&keyword=<s:property value="#userBean.keyword" /> ">最后一页</a></li>
                                </s:if>
                            </ul>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function search() {
        var keyword = $("#search-input").val();
        window.location.href="${pageContext.request.contextPath}/SearchAction_search?page=1&keyword="+keyword;
    }
</script>
</html>
