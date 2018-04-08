<%--
  Created by IntelliJ IDEA.
  User: 许晨
  Date: 2018/3/16
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>publish article</title>
    <link rel="stylesheet" href="css/publishacticle.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="kindeditor/themes/default/default.css">
    <script src="kindeditor/kindeditor-all.js"></script>
    <script src="kindeditor/lang/zh-CN.js"></script>d
    <script src="js/publisharticle.js"></script>
    <script src="js/jquery-1.8.3.js"></script>

</head>
<body>
<div id="publishArticle">
    <div id="publishArticle-top">
        <img src="img/article.png">
        <div id="publishArticle-top--logo" class="btn">
            <img src="img/article1.png">
            <span>写文章</span>
        </div>
        <div id="publishArticle-top--user">
            <img src="/headPortrait/${listAllData.headPortrait}" class="img-circle">
            <a class="btn btn-danger" role="button">退出登录</a>
        </div>
    </div>
    <div id="publishArticle-main">
        <form action="${pageContext.request.contextPath}/TopicAction_addTopic" method="post">

        <div id="publishArticle-main--input">
            <input type="text" placeholder="输入文章标题" name="title"/>
            <textarea id="editor_id" name="content"></textarea>
        </div>
        <div id="publishArticle-main--classify">
            <span>文章分类：</span>
            <lable class="control-label">
                <select id="selectId" class="form-control" name="type">
                    <option>---选择文章类型---</option>
                </select>
            </lable>
        </div>
        <div id="publishArticle-main--btn">
            <button class="btn btn-danger btn-lg" type="submit">发布文章</button>
            <button class="btn btn-danger btn-lg"><a href="">保存草稿</a></button>
            <button class="btn btn-danger btn-lg"><a href="/personCenter.jsp">返回</a></button>
        </div>

        <div id="publishArticle-main--warn">${msg}</div>
        </form>
    </div>
</div>
</body>
</html>
