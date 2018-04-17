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
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.comment.js" ></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        //初始化数据
        $.get("${pageContext.request.contextPath}/CommentAction_list?tid=1004",
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
                            $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid:1004,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
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
                                    $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid: 1004,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
                                    );
                                }
                            });
                        })
                    });
                }
            });

    </script>
<<<<<<< HEAD
    <link rel="stylesheet" href="../css/recommend5.css?3">
=======
    <link rel="stylesheet" href="../css/recommend5.css?1">
>>>>>>> 549995a37d5b9ea4ff4c16a174e5dfb8efa263dd
</head>
<body>
<div id="recommendFive">
    <div id="recommendFive-head">
        <p>第一次去健身房的新手小白攻略！纯干货</p>
    </div>
    <div id="recommendFive-main">
        <p>
            求助！只认识跑步机的健身菜鸟，怎么才能第一天去健身房不被嚯嚯哈嘿练的肌肉男吓到，
            不被香汗淋漓的美女们鄙视呢？！
        </p>
        <p>听说很多人第一次去健身房，不是瞎练一通就是羞涩的跑走。</p>
        <p>今天就说说第一次去健身房到底要练什么？怎么练！</p>
        <p>菜鸟去健身房练什么</p>
        <p>菜鸟只所以叫菜鸟，是因为不认识器械，不知道技术，没有力量。</p>
        <p>
            那么可以先做有氧运动，去跑步机上跑跑步，记得热身哦！有人会说了，既然到健身房只是跑
            步的话，自己也可以到外面夜跑啊，小风吹着多惬意！这里科普一个小常识，体脂高、体重基数大、
            没有运动习惯的亲，要跑步最好是在跑步机上跑步。简单来说，就是胖子跑步特外伤膝盖，跑步机
            可以缓冲减震！
        </p>
        <img src="../img/room1.png">
        <p>错误示范↑</p>
        <p>
            如果看到美女在运动，不要恬不知耻的一直围观或者不停搭讪！乖乖在后面排队等位，或者等
            运动完再出手，当然如果你帅的话当我没说！
        </p>
        <img src="../img/room2.png">
        <p>
            除了跑步机，你还可以去跳操、瑜伽什么的，很多亲们觉得动感单车很带感，运动难度不高，而且
            减脂效果奇佳，非常适合新手，但是请不要久骑。图上还是错误示范，这种花式单车的骑法，非常
            伤膝盖和腰椎。而RPM课程这种高冷的方法又需要专业指导，很明显不适合新手。
        </p>
        <p>
            那么有氧练完了，练无氧就需要上器械了！上手快、难度小、强度低的器械有哪些呢？！练胸的除了
            卧推哑铃、杠铃之外，入门级的还是以坐姿为主的器械，有推胸的有夹胸的，而且还可以练手臂。
        </p>
        <p>夹胸</p>
        <p>
            练完胸还可以练背，练背方式有很多，引体向上、杠铃然而难度太高。所以还是以坐姿为主，可以练坐
            姿下拉和坐姿划船，当然也可以练手臂，对肩周炎非常有疗效。
        </p>
        <img src="../img/room3.png">
        <p>练了胸和背，那么接着练练腿!练腿的器械不用说，大多都是坐姿了，有蹬腿的、有外展和内展的，还有屈伸的。</p>
        <img src="../img/room4.png">
        <p>蹬腿</p>
        <img src="../img/room5.png">
        <p>内展</p>
        <p>
            无氧运动一次一般在45分钟左右，所以如果连完这几个部位还有那么一点时间和气力，可以用一下史密斯机练一下深蹲或者硬拉。
            史密斯机的杠铃是有轨道的，所以是有安全防护的，新手可以试试感觉。
        </p>
        <img src="../img/room6.png">
        <p>硬拉</p>
        <p>深蹲</p>
        <p>
            如果第一次到健身房，先从今天介绍的这些固定器械开始练习吧！他们有固定的轨道，非常安全，而且可以帮助我们找到肌肉正确发
            力的感觉，非常适合新入健身房的小白们。
        </p>
        <p>妈妈再也不用担心我去健身房丢脸加浪费钱啦！</p>
        <div id="recommendFive-evaluate">
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
