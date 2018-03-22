<%--
  Created by IntelliJ IDEA.
  User: 许晨
  Date: 2018/3/10
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="css/enrllPage.css?1" />
    <script type="text/javascript" src="js/enroll.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        function changeVerify() {
            var verifyImg = document.getElementById("verifyImg");
            verifyImg.src="${pageContext.request.contextPath}/UserAction_verifyImg?" + new Date().getTime();
        }

        function checkUser() {
            var username = document.getElementById("username").value;
            $.post(
//                请求地址
                "${pageContext.request.contextPath}/UserAction_checkUser",
//                请求参数
                {checkname: username},
//                返回数据接受
                function (data){
//                    数据中isExist表示符 后端给出
                    var isExist = data.isExist;
                    var alp=document.getElementsByTagName('p');
                    var usernameTip=alp[0];
                    if(isExist) {
                        usernameTip.style.color = "red";
                        usernameTip.innerHTML = '用户已存在';
                    } else {
                        usernameTip.style.color = "green";
                        usernameTip.innerHTML = '可以使用';
                    }
                },
                "json"
            );
        }

    </script>
</head>
<body>
<div class="enroll">
    <div class="nav">
        <span class="nav-enroll">欢迎注册</span>

    </div>
    <div class="content">
        <form name="reg"method="post" id="content-form" action="${pageContext.request.contextPath}/UserAction_add">
            <div ><label><span>用户名</span><input type="text" id="username" name="username" class="username"placeholder="您的昵称" onblur="checkUser()"/></label></div>
            <p id="username-tip	"></p>
            <div ><span>设置密码</span><input type="password" name="password" class="password" placeholder="     建议至少使用两种字符组合" /></div>
            <p></p>
            <div ><span>确认密码</span><input type="password"class="certain-password"placeholder=" 请再次输入密码"/></div>
            <p></p>
            <div ><span>手机号码</span><input type="text"name="phoneNumber" class="number"placeholder="请输入常用手机号"/></div>
            <p></p>
            <div >
                <span>验证码</span>
                <span><input type="text"class="identifyCode" placeholder="请输入验证码" name="verifyCodeFromUser"/></span>
                <span class="identify-number"><img id="verifyImg" src="${pageContext.request.contextPath}/UserAction_verifyImg" onclick="return changeVerify()"></span>
            </div>
            <p>${msg}</p>

            <button class="content-enroll"/>立即注册</button>
        </form>
    </div>
</div>
</body>
</html>

