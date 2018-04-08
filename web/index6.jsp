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
        $.get("${pageContext.request.contextPath}/CommentAction_list?tid=1005",
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
                            $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid:1005,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
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
                                    $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid: 1005,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
                                    );
                                }
                            });
                        })
                    });
                }
            });

    </script>
<<<<<<< HEAD
    <link rel="stylesheet" href="css/recommend6.css?3">
=======
    <link rel="stylesheet" href="css/recommend6.css?1">
>>>>>>> 549995a37d5b9ea4ff4c16a174e5dfb8efa263dd
</head>
<body>
<div id="recommendSix">
    <div id="recommendSix-head">
        <p>最快最有效减肥方法运动饮食结合</p>
    </div>
    <div id="recommendSix-main">
        <p>一.饮食方面</p>
        <p>1.合理安排三餐</p>
        <p>
            早餐不容忽视，不仅要吃，还要吃好。但是早餐只吃高纤麦片、低脂鲜乳，
            可以适当搭配水果之类的，如苹果、香蕉、葡萄都是有利于的减肥的水果之一。
            这样的饮食搭配不仅可以帮助排便，同时也非常营养的健康减肥餐，午餐好吃饱，
            以蔬菜为主，相应的减少主食量，至于吃肉，就吃精瘦肉;晚餐可以提前吃，但是一
            定不要吃得太多，主要以清淡为主，多喝汤，吃海鲜食物。
        </p>
        <img src="img/food1.png">
        <p>2.睡前三小时禁食</p>
        <p>
            减肥最大的忌讳就是晚上吃东西，尤其是有一些减肥mm习惯在看电视的时候吃零食。
            这是最不好的一种生活习惯。当晚上睡觉的时候身体处于完全不运动状态，吃下的东
            西全部会被身体吸收变成脂肪囤积起来。所以最好不要在吃东西，实在想吃的话，最好
            给自己身边多准备一些水果之类的，这是完全可以的。
        </p>
        <img src="img/food2.png">
        <p>3.吸收适合身体生长的能量</p>
        <p>
            对于减肥，吃合适的食物是很重要的。然而，与之同样重要的是，吃适当的食物数量吸收
            体内所需的能量。
        </p>
        <p>
            为了快速减肥，你会希望尽可能消耗几卡路里的热量。但你并不想饿死自己，所以，最好每天
            吃1200卡路里左右。这数字听起来不多，但请相信，1200卡路里的健康食品比起1200卡路里
            的不健康的食物会让你觉得更加充满了精力，去完成一天繁重的工作。
        </p>
        <img src="img/food3.png">
        <p>4.多喝水，喝够水</p>
        <p>
            水乃生命之源。也是减肥的最重要物质之一，每天喝够八杯水才是我们正常的喝水量。具体的饮水必须是
            1800ml-2000ml。夏天减肥的话，那就要每天至少喝3000ml方可正常。多喝水能帮助你排除体内的多余
            毒素、清理肠道、增加饱腹感，是减肥瘦身的佳品。所以说减肥的mm们一定要记得多喝水哦!
        </p>
        <img src="img/food4.png">
        <p>二.运动方面</p>
        <p>1.爱上运动，并且坚持</p>
        <p>
            在运动减肥的道路上或许你应该明显的能感觉到，即使是最好的运动减肥方式，如果你不坚持的话，减后肯定
            会反弹。原因很简单，就是因为你没有坚持去做。推荐运动：慢跑、游泳、慢跑、骑自行车等。
        </p>
        <img src="img/play1.png">
        <p>2.举重训练</p>
        <p>燃烧脂肪的，有氧运动是方便易行的活动，但你也应该做做举重训练，每周两次就可以了。</p>
        <p>
            进行举重训练去健身房是比较有保证的方式，而且还有教练可以指导你。但是如果你工作繁忙，也可以买
            举重器在家里锻炼。举重锻炼能确保尽可能多进行肌肉训练，这将有利于你燃烧大部分吸收的热量。
        </p>
        <p>
            举重训练不仅帮助你燃烧卡路里，加快你的新陈代谢，而且有益保持健康，增加免疫力。所以不管多繁忙，
            都不要错过一周两次的举重锻炼。
        </p>
        <img src="img/play2.png">
        <p>3.有氧运动</p>
        <p>
            要尽快减肥，你应该坚持每星期的有氧锻炼。每天锻炼至少半个小时，逐渐增加到每天一个小时。
            千万不要半途而废，或者三天打渔两天晒网，这样子可能没有效果。即使有效果也不明显。
        </p>
        <p>
            至于做什么有氧运动并没有真正规定你具体做哪些运动，只要和运动有关都可以。你可以去跑跑步，
            踢踢球，郊游远足等等。只要你迈出运动的第一步，并且积极去参与，坚持下去，那么很快你就减肥成功了。
        </p>
        <img src="img/play3.png">
        <p>注意事项</p>
        <p>
            有很多朋友说运动减肥坚持不下来，这也是许多肥胖者的共同特点，运动减肥确实比较辛苦，怎样简单轻松的减肥呢？
            网传现在有一种特别火的”蒙蒙睡眠减肥法”，它通过改善睡眠质量及睡眠时的新陈代谢使脂肪转化为能量，从而达到减肥的目的,
            还有养生的效果!据说已经帮助上千人减肥成功了，在睡眠中不知不觉达到减肥效果，听起来确实非常诱惑。
        </p>
        <div id="recommendSix-evaluate">
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
