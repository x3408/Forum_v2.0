<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 许晨
  Date: 2018/3/20
  Time: 15:07
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
        <input type="text" class="search-text" id="search-input" name="keyword" value="<s:property value="#topicBeanBySearch.keyword"/> "/><button><i class="icon-search"></i></button>
    </div>
    </div>
</div>
<!--下面是搜索的main了-->
<div id="searchMain">
    <div id="searchMain-body" class="container">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#E" data-toggle="tab" id="titleSearch" onclick="Search(1, 'title', $('#search-input').val())">按标题搜索</a></li>
            <li><a href="#F" data-toggle="tab" id="userSearch">按人名搜索</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="E">
                <div id="tab-content--E">
                    <p>你好</p>

                    <div id="epaging">
                        <ul class="pagination pagination-lg">
                            <li><a href="#">&laquo;</a></li>
                            <li class="active"><a href="#"><span class="sr-only">(current)</span>1</a></li>
                            <li><a href="#">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="F">
                <div id="tab-content--F">
                    <p>世界</p>

                    <div id="fpaging">
                        <ul class="pagination pagination-lg">
                            <li><a href="#">&laquo;</a></li>
                            <li class="active"><a href="#"><span class="sr-only">(current)</span>1</a></li>
                            <li><a href="#">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
<script type="text/javascript">
    function Search(page, type, keyword) {
        $.post(
            "${pageContext.request.contextPath}/SearchAction_search",
            {type:type, page: page, keyword: keyword},
            function (data) {
                $('#tab-content--E').empty();
                $.each( data , function(i, json) {
                    $('#tab-content--E').append('<p>'+data[i].title+'</p>');
                });
                if(${topicBean.totalPage <= 1}) {
                    $('#tab-content--E').append('<div id="paging"><ul class="pagination pagination-lg">' +
                        '<li class="active"><a href="#">1</a></li>'
                    );
                } else {
                    for(i=0; i<${topicBean.totalPage}; i++) {
                        $('#tab-content--E').append('<div id="paging"><ul class="pagination pagination-lg">' +
                            '<li class="active"><a href="${pageContext.request.contextPath}/SearchAction_search">i</a></li>'
                        );
                    }
                }

            },
            "json"
        );
    }
</script>
</html>
