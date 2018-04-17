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
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>编辑资料</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/editorData.css?3">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/editorData.js"></script>

</head>
<body>
<div id="editorData">
    <div id="editorData-top">
        <span>个人信息</span>
        <form action="${pageContext.request.contextPath}/PersonAction_findAllData">
            <button class="btn btn-danger btn-sm">返回首页</button>
        </form>

    </div>
    <form action="${pageContext.request.contextPath}/PersonAction_updateData" method="post" enctype="multipart/form-data">
        <input type="hidden" value="${listData.uid}" name="uid">
        <input type="hidden" value="${listData.password}" name="password">
        <div id="editorData-main">
            <div id="editorData-headImg">
                <span id="imgtext">当前头像

                <img src="${basePath}/headPortrait/${listData.headPortrait}">

                </span>
                <%--<input type="file" name ="headPortrait">--%>
                <input id="fileupload" name ="photo" type="file"   onchange="imagesSelectedForHead(this.files)" class="btn"   />
                <%--<input type="hidden" name="photo2"  value="${listData.headPortrait}"  />--%>
                <a id="changeImg"><!--改变头像--></a>
            </div>
            <div id="editorData-ip" class="form-horizontal">
                <div class="form-group">
                    <label class="control-lable col-lg-3">用户名</label>
                    <div class="col-lg-7">
                        <input type="text" id="txtUserName" class="form-control" value="${listData.username}" name="username"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-lable col-lg-3">个性签名</label>
                    <div class="col-lg-7">
                        <input type="text" id="txtSignature" class="form-control" value="${listData.signature}" name="signature"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-lable col-lg-3">性别</label>
                    <div class="col-lg-7">
                        <input type="text" id="txtUserSex" class="form-control"value="${listData.sex}" name="sex" />
                    </div>
                </div>
            </div>
        </div>
        <button type="submit" id="btn" class="btn btn-danger btn-lg">保存</button>
    </form>

</div>
</body>
<script type="text/javascript">
function imagesSelectedForHead(myFiles) {
    for (var i = 0, f; f = myFiles[i]; i++) {
        var imageReader = new FileReader();
        imageReader.onload = (function(aFile) {
            return function(e) {
                $('#imgtext').html('<img  class="images" style="width: 100px;height: 100px" src="'+e.target.result+'" title="'+aFile.name
                                    +'"/>');
                // $('#imageUrl').val(e.target.result);
            };
        })(f);
        imageReader.readAsDataURL(f);
    }
}

</script>
</html>
