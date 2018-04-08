<%--
  Created by IntelliJ IDEA.
  User: daidai
  Date: 2018/3/24
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
        $.get("${pageContext.request.contextPath}/CommentAction_list?tid=1001",
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
                    ];
                    $(function(){
                        $(".comment-list").addCommentList({data:arr,add:""});
                        $("#comment").click(function(){
                            var obj = new Object();
                            obj.img="headPortrait/<s:property value="#session.user.headPortrait"></s:property>";
                            obj.replyName="<s:property value="#session.user.username"></s:property>";
                            obj.content=$("#content").val();
                            obj.replyBody="";
                            $(".comment-list").addCommentList({data:[],add:obj});
                            $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid: 1001,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
                            );
                        });
                    })
                }
                else{
                    $.each( data, function(i, json){
                        var arr=[
                            {id:1,img:"headPortrait/"+json['headPortrait'],replyName:json['uid_name'],beReplyName:"",content:json['comment_content'],time:currentdate,replyBody:[]}
                        ];
                        $(function(){
                            $(".comment-list").addCommentList({data:arr,add:""});
                            $("#comment").click(function(){
                                var obj = new Object();
                                obj.img="headPortrait/<s:property value="#session.user.headPortrait"></s:property>";
                                obj.replyName="<s:property value="#session.user.username"></s:property>";
                                obj.content=$("#content").val();
                                obj.replyBody="";
                                if(i==0){
                                    $(".comment-list").addCommentList({data:[],add:obj});
                                    $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid:1001,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
                                    );
                                }
                            });
                        })
                    });
                }
            });

    </script>

    <link rel="stylesheet" href="css/recommend2.css?4">
</head>
<body>
<div id="recommendTwo">
    <div id="recommendTwo-head">
        <p>瘦腿真的这么难吗？教你一周搞定大粗腿</p>
    </div>
    <div id="recommendTwo-main">
        <p>你是不是总想着自己也有一双大长腿</p>
        <p>偶尔还能大胆地放肆一回！</p>
        <p>可真要是360度欣赏一下，</p>
        <p>自己的腿却是另外一个样子的……</p>
        <p>难怪小粗腿扭不过大长腿，<br/>
            还是先乖乖地瘦腿吧！
        </p>
        <p>
            今天介绍的这组动作，<br/>
            主要锻炼腿和臀。<br/>
            这套动作由4个动作组成，<br/>
            来看一下吧！
        </p>
        <p>
            单脚箭步蹲、跳蹲<br/>
            左右各10-20次，<br/>
            根据自身水平，<br/>
            选择单脚箭步蹲或单脚箭步跳蹲
        </p>
        <img src="img/timg.jpeg">
        <p>
            一个半深蹲<br/>
            20-30次，<br/>
            先做一个全蹲，再做一个半蹲

        </p>
        <img src="img/jump.png">
        <p>
            仰卧屈膝挺髋<br/>
            20-30次<br/>
            挺髋至最上方时稍停，然后再慢慢还原
        </p>
        <img src="img/quxi.jpeg">
        <p>
            深蹲跳<br/>
            10--20次
        </p>
        <img src="img/sdt.jpeg">
        <p>
            全套动作根据自身水平做1-5个循环，<br/>
            练习的过程中尽可能的慢一点，<br/>
            动作标准一点。<br/>
            在练习完之后，<br/>
            还要做一些按摩，帮助肌肉舒缓。
        </p>
        <br />
        <div id="recommendTwo-evaluate">
            <!--放评论语句-->
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
</html>
