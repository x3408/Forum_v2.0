<%--
  Created by IntelliJ IDEA.
  User: 许晨
  Date: 2018/3/13
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>kindeditor</title>
    <script src="js/kindeditor-all-min.js"></script>
    <script src="lang/zh-CN.js"></script>
    <script src="js/kd.js"></script>
    <link rel="stylesheet" href="default/default.css">
    <script type="text/javascript">
        KindEditor.ready(function(K) {
            K.create('#textarea_id', {
                uploadJson : '../jsp/upload_json.jsp',
                fileManagerJson : '../jsp/file_manager_json.jsp',
                allowFileManager : true
            });
        });
    </script>
</head>
<body>
<textarea id="editor_id" name="content">

</textarea>
<input type="button" name="getHtml" value="取得HTML"/>
<input type="button" name="getText" value="取得文本(img)"/>
</body>
</html>
