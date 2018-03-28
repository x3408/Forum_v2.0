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
        $.get("${pageContext.request.contextPath}/CommentAction_list?tid=1003",
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
                            $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid: 1003,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
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
                                    $.post("${pageContext.request.contextPath}/CommentAction_save", { replyName:"<s:property value="#session.user.username"></s:property>" , comment_content: obj.content,uid:"<s:property value="#session.user.uid"></s:property>",tid:1003,headPortrait:"<s:property value="#session.user.headPortrait"></s:property>"}
                                    );
                                }
                            });
                        })
                    });
                }
            });

    </script>
    <link rel="stylesheet" href="css/recommend4.css">
</head>
<body>
<div id="recommendFour">
    <div id="recommendFour-head">
        <p>一个健身爱好者最朴实的自白</p>
    </div>
    <div id="recommendFour-main">
        <p>
            —— 谨以此文献给那些曾经甚至现在依然为身材困扰的朋友，
            以及那些热爱健身的朋友，希望能给你们一些灵感，一些动力。
        </p>
        <p>
            这一切都源自一场兴起之下的旅行。动身前的某一天，我和闺蜜满怀期待地逛街购物，
            为即将到来的旅程添购衣物。在商场内的咖啡店休憩时，不知是谁先提出来减肥这件事。
        </p>
        <p>
            闺蜜放下手中的摩卡，郑重其事地告诉我，刚好有人送她一个自拍杆，这无疑为旅行拍照带来了更多方便。
            还未等她继续，我就明白了她的心思，要想留下唯美的照片，除了在衣着和装备上做好准备，还需要在身体上做好准备。
            身体上的准备无非是吹弹可破的肌肤，以及纤细柔美的身材。配上碧海蓝天和时髦装扮，在朋友圈刷屏也可免遭“有黑眼圈”或
            是“好像胖了”之类的口舌
        </p>
        <p>
            然而，皮肤易改，身材难变。皮肤只要临行稍加护理并且化妆修饰，
            就还说得过去，但是身材的改变却非朝夕之事。讨论了大半天，吃货闺蜜痛下决心，
            最近几天一定要少吃。我也兴冲冲地决定，在少吃的基础上适度运动。凭借以前快速减肥的经验，
            我们都坚信，临时抱个佛脚也多少会有些效果。
        </p>
        <p>
            然而，我们都遭遇到了不同程度的滑铁卢。闺蜜依旧没能管住嘴，而我则充分体会到了一个久未运动的人突然运动所产生的酸痛感。
            临行前的那晚，我包着浴巾、涂着面膜站在穿衣镜前，看着露在外面的手臂轻轻叹了口气。以前，母亲大人一听说我要去打网球就异常开心，
            迫切希望我把过瘦的手臂练得粗一些。现在，她倒是不用担心了。当我把手臂紧贴身体两侧时，大臂侧面突出的赘肉显得额外刺眼。
            我称了一下体重，看着几天折腾之下依然不变的数字，我突然领悟，自己已经过了那个“饿两顿，瘦三斤”、“做一个月瑜伽，减掉六斤”
            的年纪了。
        </p>
        <img src="img/water.png">
        <p>
            当然，旅行的照片依然美好，选对了服装搭配和拍摄角度，依旧可以扬长避短。但是，回到家以后，我就开始迫不及待地搜寻一些
            相关的帖子和视频，我得改头换面才行。
        </p>
        <p>
            “减肥意识”渐渐在心中萌芽，我开始重新练习《玉珠铉减肥瑜伽》和《Pump It Up 2005版》。从时长和难度角度来说，
            它们都比较适合我，更重要的是，它们曾经助我30天内减掉6斤。重拾的过程是痛苦的，不论是保持椅子姿势时大腿传来的灼烧感，
            还是健身操没跳到20分钟就气喘吁吁的狼狈。坚持了一个月左右，那种不适感就逐渐消失了。然而，体重秤上的数字依然没有变化，
            曾经的“奇迹”并没有重现，每天称体重的过程也只是从期待转为失落的循环。
        </p>
        <img src="img/land.png">
        <p>
            在这迷茫的时期，我刚好去参加了高中同学会。大家许久未聚，所以参加聚会前的心情总是额外激动。班上有位女生原来很丰满，
            后来听许多同学说，她节食减肥，成功瘦成了“以前的一半”。我好奇她现在的模样，也想着有机会探讨一下减肥的问题，所以兴奋的
            心情中还多了些好奇。
        </p>
        <p>
            然而，见面后才发现，她并没能保持闪电般的身材。我开始笑自己傻，又不是没吃过节食的亏，也不是没见过身边类似的例子，
            怎么还会心生动摇呢。以前也做过晚上不吃饭的事，结果瘦是瘦了很多，但是免疫力下降，总愿意生病，而且脸色也不好看。还有一
            位朋友对自己更严苛，一天只吃一顿饭，没一个月就迅速瘦了十多斤，但是“老朋友”却不准时了。她还跟我说，曾经饿到不行，结果
            抱着一大盒饼干吃掉一半，之后却又气自己没忍住，简直恨不得捶自己的肚子。
        </p>
        <img src="img/land2.png">
        <p>
            也许，那个年纪的少女大部分都会为身材而困扰吧。青春的年纪，大多受到日韩流行时尚的影响，以前会羡慕藤井莉娜嘴边的美人
            痣和纤细的筷子腿，现在会追捧朴邵拉浓密的长发和苗条的身材。我们都以为那样才是绝对的美，天生纤瘦的女孩自然就备受钦羡。只是我
            很清楚，自己哪怕天天不吃饭，也无法拥有Twiggy那样孩童般纤细的身材。内心总会不自信，哪怕妈妈辈的人觉得我属于很瘦的类型。
        </p>
        <p>
            直到后来，看过维多利亚的秘密的大秀和泳装特辑，我才知道还存在这样一种“strong and sexy”的美。随着INS一类的社交媒体
            的流行，我的审美观再度被那些身材fit的欧美姑娘改变了。她们好像常住在海边，每天的工作就是晒晒各种健康的早餐和奶昔，
            以及被各式各样的漂亮泳衣包裹（其实没包住多少）的美好肉体。审美观好像被灌了一剂提神醒脑药，我不禁感慨，这才是女人，
            这才是上帝赋予女性的美好曲线，这才是我要追求的完美身材！
        </p>
        <p>
            就是这个时候，我萌生了练出马甲线的念头，而几个健身控男性好友也向我推荐了更为专业的健身视频。我开始在腹肌撕裂的路上慢慢前行。
            刚开始是痛到不行，坚持不下来，腹部的酸痛感也好几天都难消。凭借着想要“晒”的虚伪目的，我熬过了那段时期。慢慢地，疼痛感不那么
            明显了，动作也可以坚持做下来。有一次，和几位朋友一起吃饭，饭席间聊到了健身的话题。其中一位女生的男友得知我能坚持做完腹肌撕裂
            的时候，还有些惊讶，声称他都无法完成。那一刻，内心充满了自豪感。
        </p>
        <img src="img/water2.png">
        <p>
            开心归开心，马甲线却迟迟不肯出现。看了一些帖子才知道，光做卷腹还不够，还需要减脂，否则肌肉被厚厚的脂肪盖住，撕裂多少次都没用。
            我开始将卷腹与有氧运动结合，也渐渐形成了体脂肪比体重更重要的观念。其实，很多看上去很瘦的人，体脂肪率却很高，这些脂肪隐藏在内脏
            器官中，并不代表健康。于是，曾经被体重数值困扰的我不再称重，而是开始关注身材上的实质变化。
        </p>

        <p>
            坚持运动一段时间，周围人都说我变瘦了，而且气色很好。虽然体重没有什么改变，但是脂肪减少，肌肉增加，所以视觉上会有明显变化。我也
            不再将“减肥”挂在嘴边，因为一般人常说的“减肥”仅仅是针对体重而言。通过的方式也多是不健康的节食，速效却有害健康。这样做减下去的不
            是脂肪，身体代谢会减慢，而且一旦停止节食还会立即反弹，十分不可取。
        </p>
        <p>
            我也听到过一些不理解的声音，有人知道我在运动，张口就会问瘦了几斤，就好像曾经的我，固执地认为体重数代表了一切。也有人会说，
            练出马甲线能怎么样，女人以后怀孕生子，还不是白练。其实，不少朋友都存在这样的误解。首先，与体重数值相比，体脂肪才是更科学的
            衡量方法。其次，健身需要坚持，如果把它当成一种减重的手段，那么多半难以坚持，如果把它当作一种健康的生活方式，那结果就会很不
            一样。这就是为什么有人会说，如果你不能坚持，那就完全不要健身。
        </p>
        <img src="img/yes.png">
        <p>
            在身材慢慢改变的过程里，有不少朋友向我寻求“减肥”意见。但是我知道，我给说的答案过于直白简单，让满怀期待的她们愿望落空。我甚至
            怀疑，在我告诉她们方法之后，有多少人能坚持。
        </p>
        <p>
            清淡饮食，少食多餐，适度运动，充足饮水，保证睡眠。很简单的道理，却并不能满足想要减肥的人们的猎奇心理。许多人总是想寻求捷径，
            所以一切快捷、不费力气的方法总是深得人心，比如30天突破四六级的方法，10天内帮你提升人际关系的方法，诸如此类的方法特别抓人眼球。事实上，
            许多事情并无捷径可言，成功的秘方无非坚持而已。健身尤为如此，你付出多少，就会在身材上体现多少，这里不是与人比较，而是对比之前的自己。
        </p>
        <p>
            可惜的是，大部分人对此并不买账。所以，每当有人在我面前兜售不用锻炼的速效减肥秘诀时——不论是不吃早餐，还是晚饭喝代餐奶昔，我都只是礼貌微笑。
            如果有人问到我，我会如实告之自己的经验，但是我已经学会不去将自己的观念强加给别人，毕竟愿不愿意努力是件非常个人的事情。
        </p>
        <img src="img/land3.png">
        <p>
            当然也会遇到更为消极的评论。每次发一些穿搭图片，总会有人评论，唯有瘦才能穿衣好看。这么说或许只对了一半，并不是所有瘦子穿衣服都好看，含胸驼背、
            缺乏气场的，或者品味不佳、不了解自身风格的，再瘦都穿得不美。当然，不可否认的是，很多身材fit（我说的是fit）、品味出众的女子，的确穿衣更容易出彩，
            哪怕穿最简单的白色T恤都比旁人多了些神采与韵味。只是，她们背后的努力却常被别人忽略掉。如果说维秘天使算是比较极端的例子，天生的好基因，加上后天的努力，
            这都是常人无法企及的。那么，每个人身边也未必没有积极向上的榜样。为什么有人还是宁肯动动嘴皮抱怨，却依旧不肯活动活动身体呢？
        </p>
        <p>
            没时间运动，没钱买设备或者去健身房，这些是再常见不过的借口。有时间追韩剧、刷朋友圈，怎么会没有时间健身
            ，哪怕每天20分钟都可以。没钱买设备、办健身卡，那就选择最低廉的健身方式，跑步、在家照着视频做瑜伽都可以。
            其实找理由无非就是不愿意，何必说得那样无奈。
        </p>
        <img src="img/land4.png">
        <p>
            我刚开始健身的时候，买了一套最便宜运动上衣和短裤，因为那时候我还不确定自己能否坚持。后来真的坚持下来了，也非常确定自己不想中途放弃，这才去买了
            一套好一点的运动文胸和紧身裤。上衣和裤子的里层都贴着一颗小小的红色爱心，似乎提醒我好好爱护自己的身体，所以更应该坚持。以后每完成一个目标，就给
            自己买点东西，或者是健身衣，或者是想要的设备，还能激励自己前进。
        </p>
        <p>
            现在，健身真的融入了我的生活，成为了我的生活方式。我戒掉了最爱的提拉米苏和巧克力布朗尼，也学会了多去补充优质蛋白。我不再需要在朋友圈健身打卡来做记录，
            因为我会自发地想去健身。面对压力的时候，我会来一场搏击操，大汗淋漓之后，烦恼也会忘却。而在清晨时分，伴着初升的太阳做瑜伽，那一种静谧与安心也是令人精神愉悦的。
            我甚至清理掉了衣橱中的许多衣物，觉得身材变好了，选择很简单的款式都不会觉得信心不足。
        </p>
        <p>
            我离自己的梦想的完美身材依然遥远，但是，正是这种不完美才让人更有追求的动力。其实，真正把健身变为一种习惯以后，就会发现好身材、好气色不过是附赠商品。健身带来的愉悦，
            以及坚持做一件事情的自豪感，才是它最好的礼物。
        </p>
        <p>
            这一切都始于一场说走就走的旅行，却把我引入了一场更加美好的旅程。
        </p>
        <p>
            希望此文能给你一些影响，一些动力，一些共鸣。如果有了健身的想法，不妨看看露珠写过的推荐健身视频的帖子，和健身搭配的帖子，一点点开始，改变自己，
            让自己更加自信！
        </p>
        <div id="recommendFour-evaluate">
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
