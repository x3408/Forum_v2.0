<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: x3408
  Date: 2018/4/17
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>详情页</title>
    <link rel="stylesheet" type="text/css" href="css/detail.css?3" />
    <link rel="stylesheet" type="text/css" href="css/style1.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
</head>

<body>
<div class="header">
    <div class="center">
        <div class="nav" id="nav">
            <span><img src="img/logo.png"/></span>
            <ul>
                <li>
                    <a href="javascript:void(0);" id="index">首页</a>
                </li>
                <li class="select">
                    <a href="javascript:void(0);">成果展示</a>
                </li>
                <li>
                    <a href="javascript:void(0);">训练心得</a>
                </li>
                <li>
                    <a href="javascript:void(0);" >饮食计划</a>
                </li>
                <li>
                    <a href="javascript:void(0);" >健身日记</a>
                </li>
            </ul>
            <s:if test="#session.user==null">
                <span id="register"><a href="${pageContext.request.contextPath}/loginRegister.jsp">注册</a></span>
                <span id="login"><a href="${pageContext.request.contextPath}/loginRegister.jsp">登录</a></span>
            </s:if>
            <s:else>
                <span id="return"><a href="${pageContext.request.contextPath}/UserAction_logout">注销</a></span>
                <a href="${pageContext.request.contextPath}/PersonAction_findAllData" id="register"><img src="${pageContext.request.contextPath}/headPortrait/${user.headPortrait}" width="50px" height="50px"class="img-circle"></a>

            </s:else>

        </div>
        <div class="search">
            <div class="search-text" >健身，让你精致生活</div>
            <div class="search-box">
                    <input type="text" name="text" id="text" placeholder="搜索你喜欢的" />
                    <button id="btn" onclick="search(1)"><i class="icon-search"></i></button>
                <p>热门搜索:瑜伽教程、如何减肥减脂、女神变身训练营</p>
            </div>
        </div>
    </div>
</div>
<div class="main">
    <div class="main-center" id="main">
        <%--文章摘要--%>
    </div>
</div>

</body>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
    //		alert($(document).height());		//浏览器总高度
    //		alert($(window).height());		//窗口可视区高度
    //		alert($(document).scrollTop());//滚动条距离顶部的高度
    var page, type;

    $(window).scroll(function() {
        var scrollTop = $(this).scrollTop(); //滚动条距离顶部的高度
        var scrollHeight = $(document).height(); //当前页面的总高度
        var clientHeight = $(this).height(); //当前可视的页面高度
        if(scrollTop + clientHeight > scrollHeight-1 ) { //距离顶部+当前高度 >=文档总高度 即代表滑动到底部 count++;         //每次滑动count加1
            if(type == 'search') {
                search(page+1);
            }
            fall(page+1, type);
        }
    });

    function fall(page, type) {
        this.page = page;
        this.type = type;
        if(page == 1) {
            $("#main").empty();
        }
        $.get("${pageContext.request.contextPath}/TopicAction_showTopicByType", {
            page: page, type: type
        }, function(data) {
            for(var i =0; i < data.length; i++) {
                var timer = data[i].time.month + "月" + data[i].time.day + "日 " + data[i].time.hours + ":" + data[i].time.minutes;
                $('.main-center').append('<div class="box"><a href="${pageContext.request.contextPath}/TopicAction_showTopic?tid='+data[i].tid+'" target="_blank" style="text-decoration:none"><div class="topicFrom"><span class="date" id="date">' + timer + '</span><span class="viewCount" id="viewCount">阅读量： ' + data[i].viewCount + '</span></div><div class="name"><div class="myPic" id="myPic"><img class="img-circle" src="${pageContext.request.contextPath}/headPortrait/'+data[data.length/2+i].headPortrait+'" /></div><div class="username" id="username">' + data[data.length/2+i].username + '</div></div><div class="context"><div class="title" id="title">' + data[i].title + '</div><p class="content" id="content">' + data[i].descriptive + '</p></div></a></div>');

            }
        },"json")
    }

//    搜索
    function search(page) {
        var keyword = $("#text").val();
        //更改类型为搜索
        this.type = 'search';
        this.page = page;
        if(keyword == " " || keyword == "") {
            return;
        } else {
            if(page == 1)
                $("#main").empty();
            $.post("${pageContext.request.contextPath}/SearchAction_search",{
                page:page,keyword:keyword
            }, function (data) {
                if(data == null) {
                    $('.main-center').append('<p>没有您想要的内容</p>');
                } else {
                    for(var i =0; i < data.length; i++) {
                        var timer = data[i].time.month + "月" + data[i].time.day + "日 " + data[i].time.hours + ":" + data[i].time.minutes;
                        $('.main-center').append('<div class="box"><a href="${pageContext.request.contextPath}/TopicAction_showTopic?tid='+data[i].tid+'" target="_blank" style="text-decoration:none"><div class="topicFrom"><span class="date" id="date">' + timer + '</span><span class="viewCount" id="viewCount">阅读量： ' + data[i].viewCount + '</span></div><div class="name"><div class="myPic" id="myPic"><img class="img-circle" src="${pageContext.request.contextPath}/headPortrait/'+data[data.length/2+i].headPortrait+'" /></div><div class="username" id="username">' + data[data.length/2+i].username + '</div></div><div class="context"><div class="title" id="title">' + data[i].title + '</div><p class="content" id="content">' + data[i].descriptive + '</p></div></a></div>');

                    }
                }
            })
        }
    }

    window.onload = fall(1, 'result_show');
</script>
<script type="text/javascript" src="js/detail.js"></script>
</html>
