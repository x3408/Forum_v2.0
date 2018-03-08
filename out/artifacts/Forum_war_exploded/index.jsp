<%--
  Created by IntelliJ IDEA.
  User: x3408
  Date: 2018/3/5
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <script charset="utf-8" src="/js/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="/js/zh-CN.js"></script>
    <link rel="stylesheet" type="text/css" href="../Editor/themes/default/default.css" />
    <script>
        KindEditor.ready(function(K) {
            window.editor = K.create('#editor_id');
        });
    </script>
  </head>
  <body>
  <textarea id="editor_id" name="content" style="width:700px;height:300px;">
      &lt;strong&gt;HTML内容&lt;/strong&gt;
  </textarea>
  </body>
</html>
