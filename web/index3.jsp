<%--
  Created by IntelliJ IDEA.
  User: daidai
  Date: 2018/3/24
  Time: 21:12
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
        $.get("${pageContext.request.contextPath}/CommentAction_list?tid=1002",

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
                            $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid: 1002}
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
                                    $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid: 1002}
                                    );
                                }

                            });
                        })
                    });
                }




            });



    </script>
    <link rel="stylesheet" href="css/recommend3.css">
</head>
<body>
<div id="recommendThree">
    <div id="recommendThree-head">
        <p>慢跑减肥正确方法 轻松快速燃烧脂肪</p>
    </div>
    <div id="recommendThree-main">
        <p>1.慢跑多久可以减肥</p>
        <p>
            慢跑要取得减肥的效果，需要跑多远和跑多久呢。由于每个人的步幅和跑步的速度都不同。
            因此慢跑减肥在时间上并没有明确的要求。但是在路程上却要求达到5000米，跑步的速度也不能太慢哦。
        </p>
        <p>
            5000米结束后，双腿已经处于紧绷和僵硬的状态。因此这个时候你需要对小腿和大腿进行拉伸运动。
            拉伸运动可以选择压腿、捶打小腿和大腿外侧等。拉伸运动的时间为15分钟。慢跑后的拉伸运动很重要哦，
            它可以预防小腿长出肌肉。
        </p>
        <img src="img/run.jpeg">
        <p>2.慢跑前的准备动作</p>
        <p>
            知道了慢跑的路程后，接下来就开始慢跑减肥吧。慢跑前先来做热身运动，
            让肌肉变得柔软，避免拉伤。转动脚踝和手腕多次。
        </p>
        <p>3.慢跑减肥的正确方法</p>
        <p>
            热身运动后就开始正式的慢跑。慢跑的姿势决定了跑步的时间和速度。肌肉达到有氧阶段
            的时间为20-30分钟。时间太长并不一定减肥效果越好。反而会造成肌肉疲劳。
        </p>
        <img src="img/run2.jpeg">
        <p>4.慢跑的姿势很重要</p>
        <p>
            慢跑时两脚交替太高，活动髋关节，太高速度，让膝盖尽可能触及上腹部，手臂前后摆动即可。
            跑步的时候前脚掌先着地，然后过渡到全脚掌着地。
        </p>
        <p>5.慢跑减肥的速度不能过快</p>
        <p>
            将有氧心率控制在60%-80%最好，这样可以避免无效运动。练习慢跑的最佳时间为清晨或者傍晚。
        </p><br/>
        <div id="recommendThree-evaluate">
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