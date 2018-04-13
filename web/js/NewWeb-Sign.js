window.onload = function() {
	var inputUser = document.getElementById("loginform-username");
	var inputPsw = document.getElementById("loginform-secret");
	var divs = document.getElementById('form-group--warn');
	var divs_one = document.getElementById('form-groupTwo--warn');

	inputUser.onfocus = function() {
		if(this.value.length == 0) {
			divs.style.visibility = "visible";
		}
	}
	inputUser.onkeyup = function() {
		if(this.value.length == 0) {
			divs.style.visibility = "visible";
		} else {
			divs.style.visibility = "hidden";
		}
	}

	inputPsw.onfocus = function() {
		if(this.value.length == 0) {
			divs_one.style.visibility = "visible";
			// btn.disabled=true;
		}
	}
	inputPsw.onkeyup = function() {
		if(this.value.length == 0) {
			divs_one.style.visibility = "visible";
		} else {
			divs_one.style.visibility = "hidden";
		}
	}
	var control = document.getElementsByClassName('control');
	var inp = document.getElementsByClassName('ip');
	for(var i = 0; i < control.length; i++) {
		control[i].onclick = function() {
			for(var j = 0; j < control.length; j++) {
				control[j].id = "";
			}
			this.id = "text";
		}
	}
	var p = document.getElementsByTagName('p');

	//用户名注册所需要的判断
	inp[0].onfocus = function() {
		p[0].innerHTML = "由3-25个字符组成，支持中英文、数字";
		p[0].style.color = "darkseagreen";
	};
	inp[0].onblur = function() {
		var re = /[^\w\u4e00-\u9fa5]/g;
		if(this.value == "") {
			p[0].innerHTML = "不能为空！";
			p[0].style.color = "indianred";
		} else if(re.test(this.value)) {
			p[0].innerHTML = "含有非法字符！";
			p[0].style.color = "indianred";
		} else {
			p[0].innerHTML = " 设置成功！";
			p[0].style.color = "darkseagreen";
		}
	}

	//密码设置判断
	inp[1].onfocus = function() {
		p[1].innerHTML = "密码长度6-20个字符，建议使用字母加数字的组合";
		p[1].style.color = "darkseagreen";

	}
	inp[1].onblur = function() {
		if(this.value == '') {
			p[1].innerHTML = '不能为空！';
			p[1].style.color = "indianred";
		} else {
			p[1].innerHTML = '密码设置完成！';
			p[1].style.color = "darkseagreen";
		}
	}

	//确认密码设置判断
	inp[2].onblur = function() {
		if(this.value != inp[1].value) {
			p[2].innerHTML = "两次密码输入不一致！";
			p[2].style.color = "indianred";
		} else {
			p[2].innerHTML = "密码设置完成！";
			p[2].style.color = "darkseagreen";
		}
	}

	//回车实现提交功能
	var btn = document.getElementById('btn2');
	btn.keydown = function(evt) {
		e = evt || window.event;
		if(keyCode == 13) {
			contentForm.submit();
		}
	}
   
	$('#rightnow').click(function(e){
		$('.bgImg').addClass('flip');
	})
	/*$('#btn2').click(function(e){
		e.preventDefault();
		$('.bgImg').removeClass('flip');
	})*/
}