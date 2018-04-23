<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-62-p
  Date: 2018/4/13
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>登录注册页面</title>
    <script src="js/jquery.min.js"></script>
    <link rel="stylesheet" href="css/NewWeb-Sign.css?7">
    <!--<link rel="stylesheet" href="css/bootstrap.min.css">-->
    <!--<script src="js/register.js"></script>-->
    <script src="js/NewWeb-Sign.js?3"></script>
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
                        usernameTip.style.color = "#238823";
                        usernameTip.innerHTML = '可以使用';
                    }
                },
                "json"
            );
        }

    </script>
</head>
<body>
<div class="bgImg">
    <img class="bg-img" src="img1/bgImg.jpg">
    <!--//我的登录界面-->
    <div id="mainSignIn" class="front">
        <div id="loginTip">
            <div id="login-logo">
                <img src="img1/logo.png">
                <span>账户登录</span>
            </div>
        </div>
        <div id="toSignUp">
            <a id="rightnow" href="javascript:;">立即注册</a>
        </div>
        <!--下面是表单的部分-->
        <form  action="${pageContext.request.contextPath}/UserAction_login" id="myForm" method="post">
            <div class="form-group">
                <div class="form-group--user">
                    <img src="img1/user.png">
                    <lable class="control-label" for="loginform-username"></lable>
                    <input type="text" id="loginform-username" name="username" placeholder="用户名/邮箱"/>
                </div>
                <div id="form-group--warn">
                    <span id="userNotNull">账户不能为空</span>
                </div>
            </div>
            <!--密码-->
            <div class="form-groupTwo" id="follow">
                <div class="form-groupTwo--secret">
                    <img src="img1/psw.png">
                    <lable class="control-label" for="loginform-secret"></lable>
                    <input type="password" id="loginform-secret" name="password" placeholder="密码"/>
                </div>
                <div id="form-groupTwo--warn">
                    <span id="pswNotNull">密码不能为空</span>
                </div>
            </div>
            <div class="signBtn">
                <input type="submit" id="btn" value="登&nbsp;录" name="按钮" class="btn-block">
            </div>
            <div class="autoSign">
                <div id="autoSign-box">
                    <input  type="checkbox" id="checkbox-1" name="自动登录">
                </div>
                <span>自动登录</span>
            </div>
            <div class="forgetSecert">
                <span>忘记密码</span>
            </div>
        </form>
        <p style="margin-top: -40px;" id="error">${msg}</p>
    </div>
    <!--//我的登录界面结束下面开始注册界面-->
    <div id="register" class="back">
        <div class="main">
            <div class="header">
                <span id="logo"><img src="img1/logo.png"/></span>
                <span id="welcome">欢迎注册</span>
            </div>
            <div id="turnTo">转去登陆</div>
            <form action="${pageContext.request.contextPath}/UserAction_add" name="reg" method="post" id="content-form">
                <div class="control">
                    <lable>用户名</lable>
                    <input class="ip" type="text" name="username" id="username" placeholder="您的昵称" value="" onblur="checkUser()"/>
                </div>
                <p></p>
                <div class="control">
                    <lable>设置密码</lable>
                    <input class="ip" type="password" name="password" id="password"placeholder="建议至少使用两种字符组合" value="" />
                </div>
                <p></p>
                <div class="control">
                    <lable>确认密码</lable>
                   <span><input class="ip" type="password" name="verifyCodeFromUser" id="identifyCode"placeholder="请确认密码" value="" /></span> 

                </div>
                <p></p>
                <div class="control">
                    <lable>验证码</lable>
                    <input class="ip" type="text" name="identifyCode"value="" />
                    <span id="identityNumber"><img id="verifyImg" src="${pageContext.request.contextPath}/UserAction_verifyImg" onclick="return changeVerify()"></span>
                </div>
                <p id="error">${msg}</p>
                <input type="submit" id="btn2" value="立即注册" name="按钮" class="btn-block">
            </form>
        </div>
    </div>
    <!--注册界面结束-->
</div>
</body>
</html>

