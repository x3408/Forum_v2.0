<%--
  Created by IntelliJ IDEA.
  User: x3408
  Date: 2018/3/13
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>kindeditor</title>
  <script src="js/kindeditor-all-min.js"></script>
  <script src="kindeditor/lang/zh-CN.js"></script>
  <script type="text/javascript" >
      var editor;
      KindEditor.ready(function(k){
          editor=k.create('textarea[name="content"]',{
              allowFileManager:true,
              cssPath : 'kindeditor/plugins/code/prettify.css',
              uploadJson : 'KeAction.action',//提交地址，action要自己配置
              fileManagerJson : 'kindeditor/jsp/file_manager_json.jsp',
              afterCreate : function() {
                  var self = this;
                  K.ctrl(document, 13, function() {
                      self.sync();
                      document.forms['content'].submit();
                  });
                  K.ctrl(self.edit.doc, 13, function() {
                      self.sync();
                      document.forms['content'].submit();
                  });
              }
          });
          k('input[name=getHtml]').click(function(e){
              alert(editor.html());
          });
          k('input[name=getText]').click(function(e){
              alert(editor.text());
          });
      })

  </script>
  <link rel="stylesheet" href="kindeditor/themes/default/default.css">
</head>
<body>
<textarea id="editor_id" name="content">
			<img src="img/2.jpg">
			<p>html</p>
		</textarea>
<input type="button" name="getHtml" value="取得HTML"/>
<input type="button" name="getText" value="取得文本(img)"/>
</body>
</html>
