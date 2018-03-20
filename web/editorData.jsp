<%--
  Created by IntelliJ IDEA.
  User: dell3020mt-62-p
  Date: 2018/3/18
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>编辑资料</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/editorData.css">
    <script src="js/editorData.js"></script>
</head>
<body>
<div id="editorData">
    <div id="editorData-top">
        <span>个人信息</span>
        <form action="personCenter.jsp">
            <button class="btn btn-danger btn-sm">返回首页</button>
        </form>

    </div>
    <form action="${pageContext.request.contextPath}/PersonAction_updateData" method="post">
        <div id="editorData-main">
            <c:forEach items="${listData}" var ="list">
            <div id="editorData-headImg">
                <span>当前头像</span>
                <img src="img/timg (1).jpeg">
                <a href="">修改头像</a>
            </div>
            <div id="editorData-ip" class="form-horizontal">
                <div class="form-group">
                    <label class="control-lable col-lg-3">用户名</label>
                    <div class="col-lg-7">
                        <input type="text" id="txtUserName" class="form-control" value="${list.username}" name="username"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-lable col-lg-3">性别</label>
                    <div class="col-lg-7">
                        <input type="text" id="txtUserSex" class="form-control"value="${list.sex}" name="sex" />
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
        <button type="submit" id="btn" class="btn btn-danger btn-lg">保存</button>
    </form>
</div>
</body>
</html>
