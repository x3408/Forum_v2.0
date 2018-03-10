//function getLength(str){
//	return str.replace(/[^\X00-xff]/g,'xx');
//}
window.onload=function(){
	var alinput=document.getElementsByTagName('input');
	var  username=alinput[0],
			password=alinput[1],
			certainPassword=alinput[2];
			number=alinput[3];
			identifyCode=alinput[4];
			nameLength=0;
	var alp=document.getElementsByTagName('p');
	var usernameTip=alp[0],
		   passwordTip=alp[1],
		   certainPasswordTip=alp[2];
	/*username.onblur=function () {
        // var username = $("#username").val();
        // var username = document.getElementById("username").value;
        // var alinput=document.getElementsByTagName('input');
        // var  username=alinput[0];
        alert(username.value);
        $.post(
            "${pageContext.request.contextPath}/UserAction_checkUser",
            {"username":username.value},
            function (data){
//                    数据中isExist表示符 后端给出
                var isExist = data.isExist;
                var usernameInfo = "";
                if(isExist) {
                    alert("已存在");
                    usernameInfo = "该用户名已经被注册!";
                } else {
                    alert("不存在");
                    usernameInfo = "该用户名可以使用!";
                }
                //显示到相应位置
                $("#usernameInfo").html(usernameInfo);
            },
            "json"
        );
    }	   */
	username.onfocus=function(){
		usernameTip.innerHTML='由5-25个字符组成，支持中英文、数字';
	};
	/*username.onblur=function(){
		var re=/[^\w\u4e00-\u9fa5]/g;
		if(this.value==''){
			usernameTip.innerHTML='不能为空！';
		}
		else if(re.test(this.value)){
			usernameTip.innerHTML='含有非法字符！';
		
		}
		else{
			usernameTip.style.color='green';
			usernameTip.style.fontWeight='bold';
			usernameTip.innerHTML='OK!';
		}
	}*/
	password.onfocus=function(){
		passwordTip.innerHTML='密码长度6-20个字符，建议使用字母加数字的组合';
	}
	password.onblur=function(){
		if(this.value==''){
			usernameTip.innerHTML='不能为空！';
		}
		else{
			passwordTip.style.color='green';
			passwordTip.style.fontWeight='bold';
			passwordTip.innerHTML='OK!';
		}
	}
	certainPassword.onblur=function(){
		if(this.value!=password.value){
			certainPasswordTip.innerHTML='两次密码输入不一致';
			
		}
		else{
			certainPasswordTip.style.color='green';
			certainPasswordTip.style.fontWeight='bold';
			certainPasswordTip.innerHTML='OK!';
		}
	}
}
