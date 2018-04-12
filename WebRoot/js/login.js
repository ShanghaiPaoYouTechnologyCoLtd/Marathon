function loginFn(){
	var url='back/login.do';
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
		if("ok" == status){
			//登陆成功!
			window.location.href="/Marathon/back/order.do";
		}else{
			showRequestMessage('notice',res.message);
		}
		
		
	},function(){},"POST");
}