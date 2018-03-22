<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 许晨
  Date: 2018/3/18
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>健身首页</title>
    <link rel="stylesheet" href="css/mainPage.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/waterfall.css" />

</head>

<body>
<div class="header">
    <div class="header-content">
        <div class="logo">
            <a href=""><img src="img/logo.png"></a>
        </div>
        <div class="search" id="search-form">
            <input type="text" class="search-text" id="search-input" name="keyword" /><button><i onclick="search()" class="icon-search"></i></button>
        </div>
        <s:if test="#session.user==null">
            <span id="entry"><a href="${pageContext.request.contextPath}/login.jsp">登录</a></span>
            <span id="register"><a href="${pageContext.request.contextPath}/regist.jsp">注册</a></span>
        </s:if>
        <s:else>
        <span id="entry">欢迎您: <s:property value="#session.user.username"></s:property> <a href="${pageContext.request.contextPath}/personCenter.jsp"> 个人中心</a></span>
        </s:else>
    </div>
</div>
</div>
<div class="main">
    <div class="nav"id="nav">
        <ul class="nav-content" id="nav-content">
            <li class="select">
                <a href="javascript:void(0);" onclick="updataData(1, 'result_show')">成果展示</a>
            </li>
            <li>
                <a href="javascript:void(0);" onclick="updataData(1, 'training_experience')">训练心得</a>
            </li>
            <li>
                <a href="javascript:void(0);" onclick="updataData(1, 'diet_plan')">饮食计划</a>
            </li>
            <li >
                <a href="javascript:void(0);" onclick="updataData(1, 'appliance_use')">器具使用</a>
            </li>
            <li >
                <a href="javascript:void(0);" onclick="updataData(1, 'action')">动作要领</a>
            </li>
            <li >
                <a href="javascript:void(0);" onclick="updataData(1, 'diary')">健身日记</a>
            </li>
        </ul>
    </div>
    <div class="contain">
        <div id="banner">
            <div id="list" style="left:-723px">
                <img src="img/4.jpg">
                <img src="img/1.jpg">
                <img src="img/2.png">
                <img src="img/3.jpg">
                <img src="img/4.jpg">
                <img src="img/1.jpg">
            </div>
            <div id="buttons">
                <span index="1" class="on"></span>
                <span index="2"></span>
                <span index="3"></span>
                <span index="4"></span>
            </div>
            <a href="javascript:;" class="arrow" id="prev">&lt;</a>
            <a href="javascript:;" class="arrow" id="next">&gt;</a>
        </div>
        <div class="new-recommand"></div>

        <div class="contain" id="main">

        </div>

    </div>
    <div class="otherNews"id="otherNews">
        <div class="recommand">
            <div class="recommand-today">今日推荐</div>
            <ul>
                <li>
                    <a href="">
                        <div id="img-one" class="img"></div>
                        <div id="text-one" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>

                        </div>
                    </a>
                </li>
                <li>
                    <a href="">
                        <div id="img-two" class="img"></div>
                        <div id="text-two" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="">
                        <div id="img-three" class="img"></div>
                        <div id="text-three" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="">
                        <div id="img-four" class="img"></div>
                        <div id="text-four" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="">
                        <div id="img-five" class="img"></div>
                        <div id="text-five" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="">
                        <div id="img-six" class="img"></div>
                        <div id="text-six" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="">
                        <div id="img-seven" class="img"></div>
                        <div id="text-seven" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
        <div class="advertisePic"></div>
        <div class="competition"></div>
    </div>
</div>



</body>
<script type="text/javascript" src="js/mainPage.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
    var i = 0;
    var page;
    var type;
    function updataData(page, type) {
        this.page = page;
        this.type = type;
        if(page == 1){
            $("#main").empty();
        }
        $.post("${pageContext.request.contextPath}/TopicAction_showTopicByType", {
            page: page, type: type
        }, function(data) {
//            var j = 1;
//            while(j <= 3) {
            for(i=0;i>=0;i++){
                var timer =  data[i].time.month + "月" + data[i].time.day + "日" + data[i].time.hours + "时" + data[i].time.minutes + "分";
                $("#main").append('<div class="box"><div class="topicFrom"><span class="date" id="date">' + timer + '</span><span class="viewCount" id="viewCount">阅读量： ' + data[i].viewCount + '</span></div><div class="name"><div class="myPic" id="myPic"><img src="" /></div><div class="username" id="username">' + data[i+3].username + '</div></div><div class="context"><h6 class="title" id="title"><a href="TopicAction_showTopic?tid='+data[i].tid+'" style="text-decoration:none;color:#202678;" target="_blank" >' + data[i].title + '</a></h6><p class="text" id="text">' + data[i].descriptive + '</p></div><div class="other-follow "><i class="icon-star-empty" id="follow"></i><span class="like-text">关注</span></div><div class="other-like "><i class="icon-heart2" id="like"></i><span class="like-text">点赞</span></div></div>');
//                j++;
//                i++;
                var like = document.getElementsByClassName('icon-heart2');
                for(var n = 0; n < like.length; n++) {
                    like[n].onclick = function() {
                        if(this.style.color == 'red') {
                            this.style.color = 'gray';
                        } else {
                            this.style.color = 'red';
                        }
                    }

                    var follow = document.getElementsByClassName('icon-star-empty');
                    for(var m = 0; m < follow.length; m++) {
                        follow[m].onclick = function() {
                            if(this.style.color == 'red') {
                                this.style.color = 'gray';
                            } else {
                                this.style.color = 'red';
                            }
                        };
                    }
                }
            }
        });

    }
    $(window).scroll(function() {
        var scrollTop = $(this).scrollTop(); //滚动条距离顶部的高度
        var scrollHeight = $(document).height(); //当前页面的总高度
        var clientHeight = $(this).height(); //当前可视的页面高度

        if(scrollTop + clientHeight >= scrollHeight) { //距离顶部+当前高度 >=文档总高度 即代表滑动到底部 count++;         //每次滑动count加1
            // 							filterData(serviceTypeId,industryId,cityId,count); //调用筛选方法，count为当前分页数
            updataData(page+1, type);
        } else if(scrollTop <= 0) {
            //滚动条距离顶部的高度小于等于0

        }
    });
    function showTopic(tid) {
        window.location.href="${pageContext.request.contextPath}/TopicAction_showTopic?tid="+tid;
    }

    window.onload(updataData(1, 'result_show'));
    function search() {
        var keyword = $("#search-input").val();
        window.location.href="${pageContext.request.contextPath}/SearchAction_search?page=1&keyword="+keyword;
    }
</script>

</html>