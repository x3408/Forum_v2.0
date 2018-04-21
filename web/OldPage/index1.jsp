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
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.comment.js" ></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        //初始化数据
        $.get("${pageContext.request.contextPath}/CommentAction_list?tid=1000",
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
                            $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid: 1000,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
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
                                    $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid:1000,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
                                    );
                                }
                            });
                        })
                    });
                }
            });
    </script>

    <link rel="stylesheet" href="../css/recommend.css">
</head>
<body>
<div id="recommend">
    <div id="recommend-head">
        <p>如何选择优质瑜伽垫</p>
    </div>
    <div id="recommend-main">
        <p>一.正位线条</p>
        <p>
            这是目前瑜伽人选择垫子最重要的一个细节标准。垫面上的正位线条可以引导辅助练习者习炼更正确、更精准的瑜伽体式。正位线条的选择基本上抓住两点就可以了：
            首先要看线条的设计原理（即系统的正宗性），其次是否与你的身高相符（正位线条的宽度与长度与你的身体各部位相契合才更精准）。
        </p>
        <img src="../img/yjd.png">
        <p>二.材质</p>
        <p>
            目前市面上的主流瑜伽垫材质一般分为PVC，TPE，天然橡胶，软木，棉麻和混合材质瑜伽垫。如果对于乳胶过敏，要注意甄别标签中是否注明不含乳胶（latex-free）。
            <br/> 1.PVC<br/>优点：耐用性好，原材料成本低，因此价格比较亲民，也是目前使用相对较普遍的瑜伽垫；不含乳胶，适合对乳胶过敏的伽人；材料吸收性差，所以，容易清洁。
        </p>
        <img src="../img/yjd1.png">
        <p>不足：因为材料吸收性差，所以干燥情况下防滑性好，但对于流汗多的伽人来说，防湿滑性较差；塑料制品无法自然降解。</p>
        <p>2.天然橡胶</p>
        <p>优点：原材料来源天然，环保；表面的天然纹理和开孔结构，帮助吸收水分，因此，不论防干滑或湿滑效果都很好。</p>
        <img src="../img/trxj.png">
        <p>不足：刚买回来时气味较重；开孔结构容易吸收污渍，需要市场清洗。</p>
        <p>3.软木</p>
        <p>优点：环保无毒，几乎没有异味；木质更有回归自然的感觉；防干滑和湿滑效果都极佳</p>
        <img src="../img/软木.png">
        <p>不足：价格相对昂贵；木质结构吸收性好，不易清洗。</p>
        <p>4.棉麻</p>
        <p>优点：亲肤温和不刺激，是热爱传统编制工艺者的首选；容易清洗。</p>
        <img src="../img/mm.png">
        <p>不足：抓地效果差，仅限于动作少的瑜伽课程或者冥想练习，比较较小众。</p>
        <div id="recommend-evaluate">
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
