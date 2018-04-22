<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: x3408
  Date: 2018/4/20
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/asidenav.css?1" />
    <link rel="stylesheet" type="text/css" href="css/personCenter.css" />
    <link rel="stylesheet" type="text/css" href="css/bigTalk.css" />
</head>

<body>
<div class="head">
    <div class="main">
        <div class="house">
            <a href="${pageContext.request.contextPath}/index.jsp"><img src="img/house.png" width="30px" /></a>

        </div>
        <div class="headimg">
            <%--点击头像 转到编辑资料页--%>
                <img class="img-circle" src="/headPortrait/${listAllData.headPortrait}" width="80px" height="80px" />
                <p>${listAllData.username}</p>
        </div>
        <div class="nav">
            <ul class="nav-one">
                <li>
                    <a href="personCenter.jsp">我的关注</a>
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
                    <a href="">我的私信</a>
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
                <label for="" class="aside-menu" title="按住拖动">菜单</label>

                <a href="javascript:void(0)" title="签到" class="menu-item menu-first">签到</a>
                <a href="${pageContext.request.contextPath}/OldPage/addTopic.jsp" title="发表文章" class="menu-item menu-second">发表文章</a>
            </div>

        </div>
    </div>
</div>
<div class="content">
    <div class="content-main">
        <div class="content-text">
            <%--私信摘要--%>
        </div>
    </div>
</div>
<!--弹出对话框-->
<div class="bigTalk">
    <div id="top">
        <span id="conversation">对话窗口</span>
        <span id="return">&times;</span>
    </div>
    <div id="bigTalk-main">
        <span id="content">
            <%--私信具体内容--%>
		</span>
    </div>
    <div class="send">
        <textarea name="text" rows="4" cols="40" id="talk"></textarea>
        <input type="button" value="发送" id="btn" />
    </div>
</div>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    var oli = document.getElementsByTagName('li');
    oli[3].style.border = "1px solid #fff";
    oli[3].style.borderRadius = "20px";
    //加载刷新私聊内容
    $.post(
        "${pageContext.request.contextPath}/PersonAction_showMessageTitle",
        function(data) {
        for(var i = 0; i < data.length / 2; i++) {
            var timer = data[i].time.month + "月" + data[i].time.day + "日 " + data[i].time.hours + ":" + data[i].time.minutes + ":" + data[i].time.seconds;
            $('.content-text').append('<div class="conversation"><img src="/headPortrait/'+data[(data.length / 2) + i].headPortrait+'" class="img-circle"width="60px"height="60px"><div class="right"><input type="hidden" value="'+data[i].send_id+'" style="display: none;"><div id="userName">' + data[(data.length / 2) + i].username + '<span >' + timer + '</span></div><div id="message">' + data[i].content + '</div></div></div>');

            //弹出对话框或者隐藏
            $(function() {
                $(".bigTalk").hide();
                $("#return").click(function() {
                    $(".bigTalk").fadeOut(200);
                })
                $(".right").click(function() {
                    $('#content').empty();
                    $(".bigTalk").fadeIn(300);
                    var send_id = $('input').val();
                    $.post(
                        "${pageContext.request.contextPath}/PersonAction_showMessage",
//                        "new_file1.json",
                        {send_id: send_id},
                        function (data) {
                            for(var i=0;i<data.length;i++) {
                                if(data[i].status == 0) {
                                    $('#content').append('<div class="theybox"><div class="they">' + data[i].content + '</div></div>');
                                } else {
                                    $('#content').append('<div class="ourbox"><div class="me">' + data[i].content + '</div></div>');
                                }
                            }
                        },
                        "json"
                    );

                })
            })
            //移动窗口代码
            $("#top").mousedown(function(event) {
                var isMove = true;
                var abs_x = event.pageX - $('div.bigTalk').offset().left;
                var abs_y = event.pageY - $('div.bigTalk').offset().top;
                $(document).mousemove(function(event) {
                    if(isMove) {
                        var obj = $('div.bigTalk');
                        var left_x = event.pageX - abs_x;
                        var top_y = event.pageY - abs_y;
                        obj.css({
                            'left': left_x,
                            'top': top_y
                        });
                    }
                }).mouseup(function() {
                    isMove = false;
                });
            });
        }
    },
    "json")
    //获取填写数据并填写
    var talk = document.getElementById('talk');
    $('#btn').click(function() {

        $('#content').append('<div class="ourbox"><div class="me">' + talk.value + '</div></div>');
        var send_id = $('#send_id').val();
        $.post(
            "${pageContext.request.contextPath}/PersonAction_addMessage",
            {message: talk.value, send_id: send_id},
            function (data) {}
        )
        $('#talk').val("");
    })
    //移动窗口代码
</script>
</body>

</html>
