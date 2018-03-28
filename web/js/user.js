var userStatus = true;
var addFollow = document.getElementById('addfollow'),
	Follows = document.getElementById('specificWrite-left-follow');

window.onload = function() {
    var showUserId = $('#showUserId').val();
    $.get("${pageContext.request.contextPath}/UserAction_checkStatus",
        function(data) {
            if(data.status == 'follow') {
                Follows.innerHTML = '已关注';
                Follows.onmouseover = function() {
                    change(this);
                }
            } else {
                $('#specificWrite-left-follow').append('<span id="addfollow">+</span>    关注');
                Follows.onclick = function() {
                	$.get(
                        "${pageContext.request.contextPath}/UserAction_follow",
                        function (data) {
                            if(data.status == "noUser") {
                                alert("请登录后再尝试该操作");
                                window.location.href = "login.jsp";
                                return;
                            }
                        },
                        "json"
					)
                    change(this);
                }

            }
        },
		"json")
	function change(userstatus) {
		userstatus.innerHTML = '已关注';
		userstatus.onmouseover = function() {
			userstatus.style.background = 'rgb(245,246,247)';
			userstatus.innerHTML = '取消关注';
		}
		userstatus.onmouseout = function() {
			userstatus.style.background = 'white';
			userstatus.innerHTML = '已关注';
		}
		userstatus.onclick = function() {
			$.get(
                "${pageContext.request.contextPath}/UserAction_unFollow",
				function (data) {
					if(data.status == "noUser") {
                        alert("请登录后再尝试该操作");
                        window.location.href = "login.jsp";
                        return;
					}
                },
				"json"
			)
			userstatus.innerHTML = '';
			userstatus.style.background = 'white';
			$('#specificWrite-left-follow').append('<span id="addfollow">+</span> 关注');
			userstatus.onmouseout = function() {
				userstatus.innerHTML = '';
				userstatus.style.background = 'white';
				$('#specificWrite-left-follow').append('<span id="addfollow">+</span> 关注');

			}
			userstatus.onmouseover = function() {
				userstatus.innerHTML = '';
				userstatus.style.background = 'white';
				$('#specificWrite-left-follow').append('<span id="addfollow">+</span> 关注');
				Follows.onclick = function() {
					change(this);
				}

			}
		}
	}
    window.onscroll=function(){
        var scrollH=document.documentElement.scrollTop;
        var a=parseInt(scrollH);
        var nav=document.getElementById('nav');
        var otherNews=document.getElementById('otherNews');
        if(a>163){
            nav.style.cssText='position: fixed;top:0;'
            otherNews.style.cssText='position: fixed;top: 0;'

        }
        else{
            nav.style.position='absolute';
            otherNews.style.position='static';
        }

    }

}