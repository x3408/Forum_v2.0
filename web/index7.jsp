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
    <meta charset="utf-8" />
    <title></title>
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
        $.get("${pageContext.request.contextPath}/CommentAction_list?tid=1006",
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
                            $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid:1006,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
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
                                    $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid: 1006,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
                                    );
                                }
                            });
                        })
                    });
                }
            });
    </script>
    <link rel="stylesheet" href="css/recommend7.css?3">
</head>
<body>
<div id="recommendSeven">
    <div id="recommendSeven-head">
        <p>一篇文章，让你明白“健身”是非做不可的事</p>

    </div>
    <div id="recommendSeven-main">
        <p>健身是一种习惯</p>
        <p>如果你从不运动</p>
        <p>如果你毕业很多年</p>
        <p>你的身体轨迹大概是这样的：</p>
        <p>刚毕业，身体脂肪含量10%-13%</p>
        <img src="img/fat1.png">
        <p>毕业2年，身体脂肪含量14%-18%</p>
        <img src="img/fat2.png">
        <p>毕业4年，身体脂肪含量19%-22%</p>
        <img src="img/fat3.png">
        <p>毕业8年，身体脂肪含量23%-26%</p>
        <img src="img/fat4.png">
        <p>毕业10年以上，身体脂肪含量30%以上</p>
        <p>而毕业10年以上</p>
        <p>身体的脂肪量超过30%后</p>
        <p>你的身体也就开始走下坡路了</p>
        <p>一胖生百病，你的噩梦就开始了</p>
        <img src="img/fat.png">
        <p>运动是维持身体的基本条件</p>
        <p>看书是升华思想的必备课程</p>
        <p>这是绝对值得投资的两件事</p>
        <img src="img/fat6.png">
        <p>不运动</p>
        <p>你也可以活下去</p>
        <p>拖着臃肿和虚弱的身体走在路上</p>
        <p>但，那真的是你想要的生活吗？</p>
        <p>年轻时</p>
        <p>我们喜欢三五成群的打篮球</p>
        <p>踢足球，游泳，跑步，跳绳等</p>
        <img src="img/fat7.png">
        <p>这期间我们几乎很少往医院跑</p>
        <p>长大后</p>
        <p>我们渐渐的忙碌于生存交际中</p>
        <p>却忘记了曾经热衷的运动</p>
        <p>路过大学球场，你会想起</p>
        <p>曾经我也喜欢这些运动啊</p>
        <p>但也只是感慨而已...</p>
        <img src="img/fat9.png">
        <p>回到家中</p>
        <p>脱掉外套，坐在沙发上</p>
        <p>要么打开电视，要么打开手机</p>
        <p>开始刷朋友圈，刷微博，刷社交软件</p>
        <img src="img/fat0.png">
        <p>久而久之你会会发现</p>
        <p>自己的体能在下降</p>
        <p>接下来就是忙碌于各大医院</p>
        <p>买保险，检查身体</p>
        <p>确诊，治疗</p>
        <p>...</p>
        <p>所以，健身</p>
        <p>是你工作后必须坚持的一件事</p>
        <p>哪怕从30岁开始健身</p>
        <img src="img/fat8.png">
        <p>十年后，你还会在健身房举铁</p>
        <p>而不运动的同龄人身体已经开始虚弱了</p>
        <p>二十年后，别人依旧能听见你与铁片对抗的声音</p>
        <p>而不运动的同龄人隔三差五的就要进一次医院</p>
        <p>健身和不健身</p>
        <p>完全两种生活，两种人生</p>
        <p>你，会选择哪种？</p>
        <div id="recommendSeven-evaluate">
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
