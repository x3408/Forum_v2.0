//判断是否加new标志
			$.get("new_file.json", function(data) {
				if(data.msg == "1") {
					//使test界面的new出现
					$('#news').css("display", "block");
				} else {
					//无变化
					$('#news').css("display", "none");
				}
			})
			oli[3].onclick=function(){
				$('#news').css("display","none");
			}