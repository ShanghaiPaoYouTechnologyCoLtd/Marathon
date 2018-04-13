/**
 * 
 */

window.onresize=function(){
	var headH = $("#kode_header_2").height();
	var flagH = $("#result_slide_wrap").height();
	$(".kode_banner_1").css({"height":(document.documentElement.clientHeight-headH-flagH)+"px"});
}