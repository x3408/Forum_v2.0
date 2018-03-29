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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <meta charset="utf-8" />
    <title>健身首页</title>
    <link rel="stylesheet" href="css/mainPage.css?1" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/waterfall.css" />
    <link rel="stylesheet" href="css/bootstrap.css">
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
            <span id="entry">欢迎您: <s:property value="#session.user.username"></s:property> <a href="${pageContext.request.contextPath}/PersonAction_findAllData"> 个人中心</a></span>
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
                    <a href="/index1.jsp" target="_blank">
                        <div id="img1" class="img">
                            <img src="img/yjd.png" width="55px" height="60px">
                        </div>
                        <div class="atext">
                            <span id="text1"  class="strongText"></span>
                            <div id="text-one" class="atext">
                                <span class="strongText">如何选择优质瑜伽垫</span>
                                <span class="detailText"></span>
                            </div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/index2.jsp " target="_blank">
                        <div id="img2" class="img">
                            <img src="img/timg.jpeg" width="55px" height="60px">
                        </div>
                        <div  class="atext">
                            <span id="text2" class="strongText"></span>
                        <div id="text-two" class="atext">
                            <span class="strongText">瘦腿真的这么难吗？教你一周搞定大粗腿</span>
                            <span class="detailText"></span>
                        </div></div>
                    </a>
                </li>
                <li>
                    <a href="/index3.jsp" target="_blank">
                        <div id="img3" class="img">
                            <img src="img/run.jpeg" width="55px" height="60px">
                        </div>
                        <div class="atext">
                            <span id="text3"  class="strongText"></span>
                        <div id="text-three" class="atext">
                            <span class="strongText">慢跑减肥正确方法 轻松快速燃烧脂肪</span>
                            <span class="detailText"></span>
                        </div>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="/index4.jsp" target="_blank">
                        <div id="img4" class="img">
                            <img src="img/water.png" width="55px" height="60px">
                        </div>
                        <div  class="atext">
                            <span id="text4" class="strongText">一个健身爱好者最朴实的自白</span>
                        <div id="text-four" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>
                        </div></div>
                    </a>
                </li>
                <li>
                    <a href="/index5.jsp" target="_blank">
                        <div id="img5" class="img">
                            <img src="img/room2.png" width="55px" height="60px">
                        </div>
                        <div  class="atext">
                            <span id="text5" class="strongText">第一次去健身房的新手小白攻略！纯干货</span>
                        <div id="text-five" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>
                        </div></div>
                    </a>
                </li>
                <li>
                    <a href="/index6.jsp" target="_blank">
                        <div id="img6" class="img">
                            <img src="img/food3.png" width="55px" height="60px">
                        </div>
                        <div  class="atext">
                            <span id="text6" class="strongText">最快最有效减肥方法运动饮食结合</span>
                        <div id="text-six" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>
                        </div></div>
                    </a>
                </li>
                <li>
                    <a href="/index7.jsp" target="_blank">
                        <div id="img7" class="img">
                            <img src="img/fat1.png" width="55px" height="60px">
                        </div>
                        <div  class="atext">
                            <span id="text7" class="strongText">一篇文章，让你明白“健身”是非做不可的事</span>
                        <div id="text-seven" class="atext">
                            <span class="strongText"></span>
                            <span class="detailText"></span>
                        </div></div>
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
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
    $.get("${pageContext.request.contextPath}/Recommend_list",
        function(data){
            $.each( data , function(i, json){
                  j=i+1;
                document.getElementById("text"+""+j).innerHTML=json['recommend_topic']
                $('#img'+''+j).children("img").attr("src",json['recommend_image'])
            });
        },"json");

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
                $("#main").append('<div class="box"><div class="topicFrom"><span class="date" id="date">' + timer + '</span><span class="viewCount" id="viewCount">阅读量： ' + data[i].viewCount + '</span></div><div class="name"><div class="myPic" id="myPic"><img id="imgCircle" class="img-circle" src="/headPortrait/'+data[i+3].headPortrait+'"/></div><div class="username" id="username">' + data[i+3].username + '</div></div><div class="context"><h6 class="title" id="title"><a href="TopicAction_showTopic?tid='+data[i].tid+'" style="text-decoration:none;color:#202678;" target="_blank" >' + data[i].title + '</a></h6><p class="text" id="text">' + data[i].descriptive + '</p></div></div>');
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

    window.onload = updataData(1, 'result_show');

    function search() {
        var keyword = $("#search-input").val();
        if (keyword == "") {
            return ;
        } else {
            window.location.href="${pageContext.request.contextPath}/SearchAction_search?page=1&keyword="+keyword;
        }
    }
</script>

</html>