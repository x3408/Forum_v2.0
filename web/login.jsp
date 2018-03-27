<%--
  Created by IntelliJ IDEA.
  User: x3408
  Date: 2018/3/11
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>健身登录</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="js/login.js"></script>
</head>
<body>
<div id="sign">
    <div id="loginWrap">
        <div id="loginTit">
            <h1 style="color:#333;">账户登陆</h1>
            <div id="tosignup">
                <a target="_blank" href="" style="color:#AAAAAA;margin-right:7px;">无法登陆？</a>|<a href="${pageContext.request.contextPath}/regist.jsp" style="margin-left:10px;color:#d54e4e;">注册</a>
            </div>
        </div>
        <form action="${pageContext.request.contextPath}/UserAction_login" id="login-form" method="post">

            <div class="form-group">
                <div class="form-group--user">
                    <img src="img/user.png" class="icon">
                    <lable class="control-label" for="loginform-username"></lable>
                    <input type="text" id="loginform-username" name="username" placeholder="用户名/邮箱"/>
                </div>
                <div id="form-group--warn">
                    <img src="img/warn.png">
                    <p class="msg">账户不能为空</p>
                </div>
            </div>
            <div class="form-groupTwo" id="follow">
                <div class="form-groupTwo--secret">
                    <img src="img/secret.png" class="icon-two">
                    <lable class="control-label" for="loginform-secret"></lable>
                    <input type="password" id="loginform-secret" name="password" placeholder="密码"/>
                </div>
                <div id="form-groupTwo--warn">
                    <img src="img/warn.png">
                    <p class="msg" id="msg">密码不能为空</p>
                </div>
            </div>
                <div id="sp">${msg}</div>
            <div id="login-button">
                <button id="btn">登录</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>

