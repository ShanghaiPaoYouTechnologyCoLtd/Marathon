function loginFn(){
	var url='back/login2.do';
	var $username=$('#username');
	var $password=$('#password');
	var username=$username.val();
	var password=$password.val();
	if(username.trim()==''){
		showRequestMessage('notice','用户名不能为空');
		return false;
	}else if(password.trim()==''){
		showRequestMessage('notice','密码不能为空');
		return false;
	}
	var params={
			username:username,
			password:password
	};
	async(url,params,function(res){
		var status = res.status;
		if(1 == status){
			//登陆成功!
			window.location.href="system/systemIndex.jsp";
		}else{
			showRequestMessage('notice',"登录失败！");
		}
		
	},function(){},"POST");
}

window.onkeydown=function(e){
	var keynum

	if(window.event) // IE
	  {
	  keynum = e.keyCode
	  }
	else if(e.which) // Netscape/Firefox/Opera
	  {
	  keynum = e.which
	  }
	
	if(e==13){
		loginFn();
	}
}