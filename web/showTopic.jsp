<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 许晨
  Date: 2018/3/16
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>评论插件</title>
    <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
    <style>
        .container{
            width: 1000px;
        }
        .commentbox{
            width: 900px;
            margin: 20px auto;
        }
        .mytextarea {
            width: 100%;
            overflow: auto;
            word-break: break-all;
            height: 100px;
            color: #000;
            font-size: 1em;
            resize: none;
        }
        .comment-list{
            width: 900px;
            margin: 20px auto;
            clear: both;
            padding-top: 20px;
        }
        .comment-list .comment-info{
            position: relative;
            margin-bottom: 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid #ccc;
        }
        .comment-list .comment-info header{
            width: 10%;
            position: absolute;
        }
        .comment-list .comment-info header img{
            width: 100%;
            border-radius: 50%;
            padding: 5px;
        }
        .comment-list .comment-info .comment-right{
            padding:5px 0px 5px 11%;
        }
        .comment-list .comment-info .comment-right h3{
            margin: 5px 0px;
        }
        .comment-list .comment-info .comment-right .comment-content-header{
            height: 25px;
        }
        .comment-list .comment-info .comment-right .comment-content-header span,.comment-list .comment-info .comment-right .comment-content-footer span{
            padding-right: 2em;
            color: #aaa;
        }
        .comment-list .comment-info .comment-right .comment-content-header span,.comment-list .comment-info .comment-right .comment-content-footer span.reply-btn,.send,.reply-list-btn{
            cursor: pointer;
        }
        .comment-list .comment-info .comment-right .reply-list {
            border-left: 3px solid #ccc;
            padding-left: 7px;
        }
        .comment-list .comment-info .comment-right .reply-list .reply{
            border-bottom: 1px dashed #ccc;
        }
        .comment-list .comment-info .comment-right .reply-list .reply div span{
            padding-left: 10px;
        }
        .comment-list .comment-info .comment-right .reply-list .reply p span{
            padding-right: 2em;
            color: #aaa;
        }
    </style>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.comment.js" ></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">

        //初始化数据
        $.get("${pageContext.request.contextPath}/CommentAction_list?tid="+"<s:property value="#session.topic.tid"></s:property>",
            function(data){
                var date = new Date();
                var seperator1 = "-";
                var year = date.getFullYear();
                var month = date.getMonth() + 1;
                var strDate = date.getDate();
                if (month >= 1 && month <= 9) {
                    month = "0" + month;
                }
                if (strDate >= 0 && strDate <= 9) {
                    strDate = "0" + strDate;
                }
                var currentdate = year + seperator1 + month + seperator1 + strDate;
                if(data==""){
                    var arr = [
                        {id:3,img:"./images/img.jpg",replyName:"帅大叔",beReplyName:"匿名",content:"同学聚会，看到当年追我的屌丝开着宝马车带着他老婆来了，他老婆是我隔壁宿舍的同班同学，心里后悔极了。",time:"2017-10-17 11:42:53",replyBody:[]}
                    ];
                    $(function(){
                        $(".comment-list").addCommentList({data:arr,add:""});
                        $("#comment").click(function(){
                            var obj = new Object();
                            obj.img="./images/img.jpg";
                            obj.replyName="<s:property value="#session.user.username"></s:property>";
                            obj.content=$("#content").val();
                            obj.replyBody="";
                            $(".comment-list").addCommentList({data:[],add:obj});
                            $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid: "<s:property value="#session.topic.tid"></s:property>"}
                            );
                        });
                    })
                }
                else{
                $.each( data, function(i, json){
                    var arr=[
                        {id:1,img:"./images/img.jpg",replyName:json['uid_name'],beReplyName:"",content:json['comment_content'],time:currentdate,replyBody:[]}
                    ];
                    $(function(){
                        $(".comment-list").addCommentList({data:arr,add:""});
                        $("#comment").click(function(){
                            var obj = new Object();
                            obj.img="./images/img.jpg";
                            obj.replyName=json['uid_name'];
                            obj.content=$("#content").val();
                            obj.replyBody="";
                            if(i==0){
                                $(".comment-list").addCommentList({data:[],add:obj});
                                $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid: "<s:property value="#session.topic.tid"></s:property>"}
                                );
                            }
                        });
                    })
                });
                }
            });
    </script>
    <meta charset="utf-8" />
    <title>user</title>

    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/user.css?2 ">

</head>
<body>
<div class="header">
    <div class="header-content">
        <div class="logo"><a href="${pageContext.request.contextPath}/home.jsp"><img src="img/logo.png"></a></div><div class="search" id="search-form">
    </div>
    </div>
</div>
</div>
<!--下面是我的代码-->
<div id="specificWrite">
    <div id="specificWrite-left">
        <div id="specificWrite-left--headImg">
            <img src="/headPortrait/${topicUser.headPortrait}" class="img-circle">
            <p>${topicUser.username}</p>
        </div>
        <div id="specificWrite-left-follow"></div>
    </div>
    <div id="specificWrite-right">
        <div id="specificWrite-right--top">
            <p>${topic.title}</p>
        </div>
        <div id="specificWrite-right--center">
            <jsp:include page="${topic.content}"></jsp:include>
        </div>
        <div id="specificWrite-right--buttom">

            <div class="container">
                <div class="commentbox">
                    <textarea cols="80" rows="50" placeholder="来说几句吧......" class="mytextarea" id="content"></textarea>
                    <div class="btn btn-info pull-right" id="comment">评论</div>
                </div>
                <div class="comment-list">



                </div>
            </div>


        </div>
    </div>


</div>
</body>
<script src="js/user.js?1"></script>
</html>
