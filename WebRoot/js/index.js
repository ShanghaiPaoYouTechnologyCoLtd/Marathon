/**
 * 
 */

window.onresize=function(){
	var headH = $("#iframe_head").height();
	var flagH = $(".result_slide_wrap").height();
	$(".kode_banner_1").css({"height":(document.documentElement.clientHeight-headH-flagH)+"px"});
}