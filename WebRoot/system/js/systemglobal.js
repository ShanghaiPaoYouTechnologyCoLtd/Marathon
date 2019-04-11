/**
 * type:0 primary,1 danger,2 warning,3success
 */
function showConfirm(str, type, funcok, funcclose) {
	var DIALOG_TYPES = new Array(BootstrapDialog.TYPE_PRIMARY, BootstrapDialog.TYPE_DANGER, BootstrapDialog.TYPE_WARNING, BootstrapDialog.TYPE_SUCCESS);
	BootstrapDialog.confirm({
		title : '确认',
		message : str,
		type : DIALOG_TYPES[type], // BootstrapDialog.TYPE_PRIMARY
		closable : true, // <-- Default value is false，点击对话框以外的页面内容可关闭
		draggable : true, // <-- Default value is false，可拖拽
		btnCancelLabel : '取消', // <-- Default value is 'Cancel',
		btnOKLabel : '确定', // <-- Default value is 'OK',
		btnOKClass : 'btn-warning', // <-- If you didn't specify it, dialog type
		callback : function(result) {
			if (result) {
				funcok();
			}
		}
	});
}
;

function getPar(par) {
	//获取当前URL
	var local_url = document.location.href;
	//获取要取得的get参数位置
	var get = local_url.indexOf(par + "=");
	if (get == -1) {
		return false;
	}
	//截取字符串
	var get_par = local_url.slice(par.length + get + 1);
	//判断截取后的字符串是否还有其他get参数
	var nextPar = get_par.indexOf("&");
	if (nextPar != -1) {
		get_par = get_par.slice(0, nextPar);
	}
	return get_par;
}