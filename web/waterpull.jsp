<%--
  Created by IntelliJ IDEA.
  User: x3408
  Date: 2018/3/12
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <style>
        @font-face {
            font-family:'icon-heart2';
            src: url(fonts/icomoon.eot) format("embedded-opentype");
            src: url(fonts/icomoon.svg) format("svg");
            src: url(fonts/icomoon.ttf) format("truetype");
            src: url(fonts/icomoon.woff) format("woff");
            font-weight: normal;
            font-style: normal;
        }

        .like{
            font-family: 'icon-heart2';
            font-weight: normal;
            font-style: normal;
            font-size: 14px;
            color: red;

        }

    </style>
    <link rel="stylesheet" type="text/css" href="css/waterpull.css"/>
    <script type="text/javascript"src="js/waterpull.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(window).ready(function(){
                $.post(
                    "${pageContext.request.contextPath}/TopicAction_showTopicByType",
                    {type:"result_show",page:1},
                    function (data) {
                        $("#title").css({"display":"block","height":40,"text-align":"center"});
                        $('#title').text(data[0].title);

                    },
                    "json"
                )
        }
        )
    </script>
</head>
<body>
<div id="main">
    <div class="box" id="first">
        <div class="topicFrom">
            <span id="userid"> 来自话题：</span>
            <span id="date"></span>
            <span id="viewCount">阅读量：</span>
        </div>
        <div id="myPic"></div>
        <div class="context" >
            <h2 >
                <span id="title"></span>
            </h2>
            <p id="text"></p>
        </div>
        <div class="other">
            <a href=" javascript:;" id="like" class="like">&#xe9d7;</a>
            <li class="like" id='follow'><a href="javascript:;"> &#xe901;</a></li>

        </div>

    </div>
    <div class="box"></div>
    <div class="box"></div>
    <div class="box"></div>
    <div class="box"></div>
    <div class="box"></div>
</div>

</body>
</html>
