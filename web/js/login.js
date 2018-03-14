window.onload=function(){
	var inputs=document.getElementsByTagName('input');
	var oName=inputs[0];
	var oName_two=inputs[1];
	var ps=document.getElementsByTagName('p');
	var name_msg=ps[0];
	var name_msg_two=ps[1];
	var divs=document.getElementById('form-group--warn');
	var divs_one=document.getElementById('form-groupTwo--warn');
	oName.onfocus=function(){
		if(this.value.length==0){
         divs.style.display="block";
        }
	}
	oName.onkeyup=function(){
		if(this.value.length==0){
			divs.style.display="block";
		}
		else{
			divs.style.display="none";
		}
	}
	oName_two.onfocus=function(){
		if(this.value.length==0){
         divs_one.style.display="block";
       }
	}
	oName_two.onkeyup=function(){
		if(this.value.length==0){
			divs_one.style.display="block";
		}
		else{
			divs_one.style.display="none";
		}
	}
}

