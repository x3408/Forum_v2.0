<%--
  Created by IntelliJ IDEA.
  User: daidai
  Date: 2018/4/23
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>签到效果实现</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/sign2.css" />

    <script type="text/javascript" src="js/calendar2.js"></script>
    <script type="text/javascript">
        $(function(){
            //ajax获取日历json数据
            $.get("${pageContext.request.contextPath}/SignAction_get",
                function(data){
                    $("#arr").val(data)
                });

            var arr=JSON.parse(document.getElementById("arr").value)
            var signList=arr
            calUtil.init(signList);
        });
    </script>
</head>
<body>
<div id="calendar">
    <div class="sign" id="sign_cal">
        <input type="hidden" name="arr" id="arr">

    </div>
</div>
</div>
</body>
</html>
