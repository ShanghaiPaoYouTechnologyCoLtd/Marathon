/**
 * 
 */

window.onresize = function() {
	var headH = $("#kode_header_2").height();
	var flagH = $("#result_slide_wrap").height();
	$(".kode_banner_1").css({
		"height" : (document.documentElement.clientHeight - headH - flagH) + "px"
	});
}

$(".slick-slide").click(function(){
	location.href="pages/olympicGames.jsp";
});

window.onload = function() {
	$.ajax({
		type : "POST",
		url : "tlist/getList.do",
		data : {
			"pageSize" : 10,
			"pageNumber" : 0,
			"qType" : '男',
			"gType":0
		},
		success : function(result) {
			var jsonS = JSON.parse(result);
			if (jsonS != null) {
				$("#ul_tlist").append('<li><div class="table_no" style=""><span>男子组</span></div></li>');
				for (var i = 0; i < jsonS.rows.length; i++) {
					$("#ul_tlist").append('<li><div class="table_no"><span>' + jsonS.rows[i].ranking + '</span></div><div class="team_logo"><a href="javascript:;">' + jsonS.rows[i].name + '</a></div><div class="team_point"><span>' + jsonS.rows[i].gameName + '</span></div></li>');
				}
			} else {
			}
		}
	});
	$.ajax({
		type : "POST",
		url : "tlist/getList.do",
		data : {
			"pageSize" : 10,
			"pageNumber" : 0,
			"qType" : '女',
			"gType":1
		},
		success : function(result) {
			var jsonS = JSON.parse(result);
			if (jsonS != null) {
				$("#ul_tlist").append('<li><div class="table_no" style=""><span>女子组</span></div></li>');
				for (var i = 0; i < jsonS.rows.length; i++) {
					$("#ul_tlist").append('<li><div class="table_no"><span>' + jsonS.rows[i].ranking + '</span></div><div class="team_logo"><a href="javascript:;">' + jsonS.rows[i].name + '</a></div><div class="team_point"><span>' + jsonS.rows[i].gameName + '</span></div></li>');
				}
			} else {
			}
		}
	});
}
