//判断是否加new标志
$.get("PersonAction_checkMessageStatus", function(data) {
	if(data.msg == 1) {
		//使test界面的new出现
		$('#news').css("display", "block");
	} else {
		//无变化
		$('#news').css("display", "none");
	}
},"json")
function showMessage(send_id) {
    $('#content').empty();
    $(".bigTalk").fadeIn(300);
    $("#return").click(function() {
        $(".bigTalk").fadeOut(200);
    })
    $('#sendId').val(send_id);

    $.post(
        "${pageContext.request.contextPath}/PersonAction_showMessage",
        {send_id: send_id},
        function (data) {
            if(data.status == "noUser") {
                alert("请登录后再尝试该操作");
                window.location.href = "./loginRegister.jsp";
                return;
            }
            for(var i=0;i<data.length;i++) {
                if(data[i].status == 0) {
                    $('#content').append('<div class="theybox"><div class="they">' + data[i].content + '</div></div>');
                } else {
                    $('#content').append('<div class="ourbox"><div class="me">' + data[i].content + '</div></div>');
                }
            }
        },
        "json"
    );
}
//获取填写数据并填写
var talk = document.getElementById('talk');
$('#btn').click(function() {

    $('#content').append('<div class="ourbox"><div class="me">' + talk.value + '</div></div>');
    var send_id = $('#sendId').val();
    $.post(
        "${pageContext.request.contextPath}/PersonAction_addMessage",
        {message: talk.value, send_id: send_id},
        function (data) {
            alert(data)
            if(data.status == "noUser") {
                alert("请登录后再尝试该操作");
                window.location.href = "./loginRegister.jsp";
                return;
            }
        },
        "json"
    )
    $('#talk').val("");
})
/*oli[3].onclick=function(){
	$('#news').css("display","none");
}*/
