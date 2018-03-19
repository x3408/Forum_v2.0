<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: daidai
  Date: 2018/3/14
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<html>
<head>
    <meta charset="utf-8" />
    <title>try try try</title>
    <link rel="stylesheet" href="css/try.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
    $.get("${pageContext.request.contextPath}/Recommend_list",
        function(data){

            $.each( data , function(i, json){
                document.getElementById("span1").innerHTML=json['recommend_topic']

                var src=$('#left').children("img").attr("src",json['recommend_image'])


            });
        },"json");


</script>

</head>
<body>
<div id="main">

    <div id="left"><img src="" > </div>
    <div id="right">
        <p id="title" name="recommend_title"> </p>
        <p id="content" name="recommend_text"></p>
        <span id="span1"></span>
        <span id="span2"></span>
    </div>

</div>






</body>
</html>
</html>
