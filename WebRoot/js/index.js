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
			"pageSize" : 20,
			"pageNumber" : 0,
			"qType" : 0,
		},
		success : function(result) {
			var jsonS = JSON.parse(result);
			if (jsonS != null) {
				for (var i = 0; i < jsonS.rows.length; i++) {
					$("#ul_tlist").append('<li><div class="table_no"><span>' + jsonS.rows[i].ranking + '</span></div><div class="team_logo"><a href="javascript:;">' + jsonS.rows[i].name + '</a></div><div class="team_point"><span>' + arrive_timer_format(jsonS.rows[i].sourceSeconds) + '</span></div></li>');
				}
			} else {
			}
		}
	});
}

function arrive_timer_format(s) {
	var t;
	if (s > -1) {
		hour = Math.floor(s / 3600);
		min = Math.floor(s / 60) % 60;
		sec = s % 60;
		day = parseInt(hour / 24);
		if (day > 0) {
			hour = hour - 24 * day;
			t = day + "day " + hour + ":";
		}
		else
			t = hour + ":";
		if (min < 10) {
			t += "0";
		}
		t += min + ":";
		if (sec < 10) {
			t += "0";
		}
		t += sec;
	}
	return t;
}