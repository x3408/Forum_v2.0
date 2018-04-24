
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
    <link rel="stylesheet" type="text/css" href="css/asidenav.css" />
    <link rel="stylesheet" type="text/css" href="css/personCenter.css?1" />
    <link rel="stylesheet" type="text/css" href="css/bigTalk.css" />
    <link rel="stylesheet" href="css/sign2.css">
    <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/calendar2.js"></script>
    <script src="js/jquery-1.8.3.js"></script>

</head>

<body>
<div class="head">
    <div id="signIn">
        <button class="btn btn-info">关闭</button>

        <div id="calendar">
            <div class="sign" id="sign_cal">

            </div>
        </div>

    </div>
    <div class="main">
        <div class="house">
            <a href="${pageContext.request.contextPath}/index.jsp"><img src="img/house.png" width="30px" /></a>

        </div>
        <div class="headimg">
            <s:if test="#session.user.uid == #session.listAllData.uid">
            <a href="${pageContext.request.contextPath}/PersonAction_findData">
                </s:if>
                <img class="img-circle" src="${pageContext.request.contextPath}/headPortrait/${listAllData.headPortrait}" width="80px" height="80px" />
                <s:if test="#session.user.uid == #session.listAllData.uid">
            </a>
            </s:if>
            <p>${listAllData.username}</p>
                <p id="personsentence">${listAllData.signature}</p>
        </div>
        <div class="nav">
            <ul class="nav-one">
                <li>
                    <a href="personCenter.jsp">我的文章</a>
                </li>
                <li>
                    <a href="mycontext.jsp">我的关注</a>
                    <div> <span class="number" id ="attentionCount"></span></div>
                </li>
            </ul>
            <ul class="nav-two">
                <li>
                    <a href="" id="Myfans">我的粉丝</a>
                    <div> <span class="number"id="fansCount"></span></div>
                </li>
                <li>
                    <s:if test="#session.user.uid == #session.listAllData.uid">
                        <a href="myletter.jsp" >我的私信</a>
                        <span id="news">new</span>
                    </s:if>
                    <s:else>
                        <a onclick="showMessage('${listAllData.uid}')">发送私信</a>
                    </s:else>
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

                <a href="javascript:void(0)" title="签到" id="sign" class="menu-item menu-first">签到</a>
                <s:if test="#session.user.uid == #session.listAllData.uid">
                    <a href="${pageContext.request.contextPath}/addTopic.jsp" title="发表文章" class="menu-item menu-second">发表文章</a>
                </s:if>
                <s:else>
                    <a onclick="showMessage('${listAllData.uid}')" title="发送私信" class="menu-item menu-second">发送私信</a>
                </s:else>
            </div>

        </div>
    </div>
</div>

<div class="content">
    <div class="content-main">
        <div id ="content-text">

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
        <input id="sendId" type="hidden" value="">
        <input type="button" value="发送" id="btn" />
    </div>
</div>


<script type="text/javascript"src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"src="js/new.js"></script>
<script>
    $(function(){
        $("#sign").click(function(){
            $("#signIn").show();
        })
        $(".btn").click(function(){
            $("#signIn").hide();
        })
        //ajax获取日历json数据

        $.get("${pageContext.request.contextPath}/SignAction_get",
            function(data){
                calUtil.init(data);
            },"json");
    })


</script>
<script type="text/javascript">
    var oli = document.getElementsByTagName('li');
    oli[2].style.border="1px solid #fff";
    oli[2].style.borderRadius="20px";
</script>
<script>
   //异步加载我的粉丝信息
    $.get("${pageContext.request.contextPath}/PersonAction_findFans",
        function(data2){
            $('#content-text').empty();
            $.each( data2  , function(i, json2){
                $("#content-text").append(
                    "<div id='topPhoto'  >"+"<a href='UserAction_showUser?showUserId="+json2[2]+"'><img src='${pageContext.request.contextPath}/headPortrait/"+json2[1]+"' class='img-circle'></a>" +
                    "<a id='addDiv1' href='UserAction_showUser?showUserId="+json2[2]+"'>" + json2[0] + "</a>"+"</div>"
                );
            });
        },"json");
   //关注总数的获取
   $.get("${pageContext.request.contextPath}/PersonAction_findAttentionCount",
       function(data3){

           $.each( data3 , function(i, json3){
               $("#attentionCount").append(
                   json3 );
           });
       },"json");
   //粉丝总数的获取
   $.get("${pageContext.request.contextPath}/PersonAction_findFansCount",
       function(data4){

           $.each( data4 , function(i, json4){
               $("#fansCount").append(
                   json4 );
           });
       },"json");


</script>
</body>

</html>
