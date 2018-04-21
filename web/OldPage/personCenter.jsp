<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-62-p
  Date: 2018/3/16
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>个人中心</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/personCenter.css?1">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.js"></script>

</head>

<body>
<div id="personCenter">
    <div id="personCenter-top">
        <span><a href="${pageContext.request.contextPath}/OldPage/home.jsphome.jsp">返回</a></span>
        <img src="../img/PersonCenterHead.png">
    </div>
    <div id="personCenter-headImg">
        <img src="${basePath}/headPortrait/${listAllData.headPortrait}" class="img-rounded">
    </div>

         <%--<span id="personCenter-name">--%>
                <%--<s:property value="#listAllData[0].username" />--%>
         <%--</span>--%>
        <%--<span id="personCenter-character">--%>
			  <%--<a href="${pageContext.request.contextPath}/PersonAction_findData"><s:property value="#listAllData[0].signature" /></a>--%>
        <%--</span>--%>


        <span id="personCenter-name">
    <a href="${pageContext.request.contextPath}/PersonAction_findData">${listAllData.username}</a>
        </span>
        <span id="personCenter-character">
			  <a href="${pageContext.request.contextPath}/PersonAction_findData">${listAllData.signature}</a>
        </span>
    <div id="personCenter-edit">
        <s:if test="#session.user.uid == #session.listAllData.uid">
            <div id="personCenter-edit--btn">
                <form action="${pageContext.request.contextPath}/PersonAction_findData">
                    <button class="btn btn-danger btn-sm">编辑个人资料</button>
                    <button class="btn btn-danger btn-sm"><a href="${pageContext.request.contextPath}/OldPage/addTopic.jsp" style="color: white">发表文章</a></button>
                </form>
            </div>
        </s:if>
        <div id="personCenter-edit--follow">
            <span class="attention">关注度</span>
            <span class="attention">粉丝</span><br/>
            <span class="number" id ="attentionCount"></span>
            <span class="number"id="fansCount"></span>
        </div>
    </div>
    <div id="personMain" class="container">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#article" data-toggle="tab">我的文章</a></li>
            <li><a href="#attention" id="Myfocus" data-toggle="tab">我的关注</a></li>
            <li><a href="#fans" id="Myfans" data-toggle="tab">我的粉丝</a></li>
        </ul>
        <br />
        <div class="tab-content">
            <div class="tab-pane active" id="article"</div>
            <div class="tab-pane" id="attention" ></div>
            <div class="tab-pane" id="fans"></div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    //文章的加载与遍历jQuery
    $.get("${pageContext.request.contextPath}/PersonAction_findArticle",
        function(data){
            $.each( data , function(i, json){
                $("#article").append(
                    "<a id='addDiv' href='${pageContext.request.contextPath}/TopicAction_showTopic?tid="+json.tid+"' target='_blank'>" + json.title + "</a>" );
            });
        },"json");
    //我的关注的获取
    $("#Myfocus").click(function(){
        $.get("${pageContext.request.contextPath}/PersonAction_findAttention",
            function(data1){

                $('#attention').empty();
                $.each( data1  , function(i, json1){
                    $("#attention").append(
                            "<div id='topPhoto'>"+"<img src="+${basePath}/headPortrait/+json1[1]+" id='img-rounded'>" +
                            "<a id='addDiv' href='UserAction_showUser?showUserId="+json1[2]+"'>" + json1[0] + "</a>"+"</div>"
                  );

                });
            },"json");
    });
    //我的粉丝的获取
    $("#Myfans").click(function(){
        $.get("${pageContext.request.contextPath}/PersonAction_findFans",
            function(data2){
                $('#fans').empty();
                $.each( data2  , function(i, json2){
                    $("#fans").append(
                        "<div id='topPhoto'  >"+"<img src="+${basePath}/headPortrait/+json2[1]+" id='img-rounded'>" +
                        "<a id='addDiv' href='UserAction_showUser?showUserId="+json2[2]+"'>" + json2[0] + "</a>"+"</div>"
                    );
                });
            },"json");
    });
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
</html>
