<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=drvice-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">

<title>中国马拉松护照查询</title>
<%@ include file="../staticFiles/globalCSS.html"%>
<script src="js/jquery.js"></script>
<script src="js/iconfont.js"></script>
<style>
.text h2 a {
	font-size: 14px;
}

#maincontainer {
	width: 100%;
	min-width: 330px;
	margin: 0px auto;
	padding: 20px 0px 0px 20px;
	text-align: center;
}

#passportimg {
	margin-bottom: 5px;
	border: 1px solid #8a0c13;
	border-radius: 10px;
	display: none;
}

#inputdiv {
	width: 385px;
	float: left;
	margin-right: 10px;
	margin-left: calc(( 100% - 445px)/2);
}

#div_buttons {
	width: 100%;
	text-align: center;
	margin-bottom: 20px;
}

#div_title span {
	display: none;
}

#div_buttons {
	display: none;
}

#div_buttons button {
	margin-bottom: 10px;
}

#selfont {
	width: 80px !important;
	height: 30px !important;
	padding: 0px !important;
	font-size: 12px !important;
}

#canvastitle {
	display: none;
}

#p-pno {
	margin-top: 10px;
	width: 100%;
	text-align: center;
	color: #171616;
	display: none;
}

#p-pno span {
	text-decoration: underline;
}

#p-pno a {
	margin-left: 10px;
	color: blue;
	cursor: pointer;
}

#p-pno a:hover {
	text-decoration: underline;
}
</style>
</head>

<body>
	<div class="kode_wrapper">
		<%@ include file="../staticFiles/head.html"%>
		<div class="kode_content_wrap section">
			<div class="kf_shoppage">
				<div class="container">
					<div class="row">
						<aside class="col-md-3">
							<div class="widget widget_category2">
								<div class="kf_h5">
									<h5>中国马拉松护照</h5>
								</div>
								<div class="kf_border-2">
									<%@ include file="../staticFiles/passportMenu.html"%>
								</div>
							</div>
						</aside>
						<div class="col-md-9 kf_shop_wrap">
							<div class="kf_overview kf_overview_roster">
								<h6 class="kf_hd1 margin_0">
									<span>中国马拉松护照查询</span>
								</h6>
							</div>
							<div class="kf_featured_thumb">
								<div class="text_wrper" id="outcontainer">
									<div id="maincontainer">
										<div class="input-group" id="inputdiv">
											<span class="input-group-addon" id="basic-addon1">证件号</span>
											<input type="text" class="form-control" placeholder="请输入证件号"
												id="cardno" aria-describedby="basic-addon1">
										</div>
										<div style="text-align: initial;">
											<button class="btn btn-primary" type="button" id="btnQuery">查询</button>
											<p id="p-pno">
												护照编号：<span id="sp-pno"></span><a onclick="copyNo()">复制</a>
											</p>
										</div>
										<div id="div_title">
											<img src="extra-images/passport-imgs/normalquery.png" /> <br />
											<span style="font-size:14px; color:red;">没有查询到您的马拉松护照
												:(</span><br />
										</div>
										<input type="file" name="image" accept="image/*"
											style="opcity:0; width:0px;height:0px !important;"
											id="photoUpload" /> <span style="font-size:12px; color:red"
											id="canvastitle">*本页面仅供模拟，新的马拉松护照发放至您手上时没有照片与签名。</span><br />
										<span style="font-size:12px; color:red" id="canvastitle">*使用电脑打开网页生成的图片更清晰！。</span><br />
										<canvas id="passportimg" width="442" height="292">您的浏览器版本过低，请使用更高版本浏览器~</canvas>
										<script>
											var imgUrl = 'extra-images/passport-imgs/passportReal_back_pc.bmp';
											var isMobile = $("#maincontainer").width() <= 460;
											if (isMobile) { //小屏幕，启用第二套尺寸
												$("#passportimg").attr("height", 208);
												$("#passportimg").attr("width", 320);
												imgUrl = 'extra-images/passport-imgs/passportReal_back_mob.bmp';
												$("#inputdiv").width("calc(100% - 54px - ((100% - 320px) / 2) - 10px)"); //算法：总宽度-按钮（54）宽度-左边距宽度-右边距宽度
												$("#inputdiv").css(
													"margin-left", "calc((100% - 320px) / 2)"
												);
												$("#outcontainer").css("overflow-x", "scroll");
											}
										</script>
										<div id="div_buttons">
											<button class="btn btn-primary" type="button"
												id="idUploadPhoto">上传我的头像</button>
											<button class="btn btn-primary" type="button" id="idGeneSign">制作持照人签名</button>
											<button class="btn btn-primary" type="button" id="idSaveImg">保存我的护照照片</button>
										</div>
										<div class="modal fade" id="div_infoCheck" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalCenterTitle"
											aria-hidden="true">
											<div class="modal-dialog modal-dialog-centered"
												role="document">
												<div class="modal-content">
													<div class="modal-header">
														<div class="input-group" id="signtitle"
															style="width:300px; float:left; margin-right:10px;">
															<span class="input-group-addon" id="basic-addon1">姓名</span>
															<input type="text" class="form-control"
																placeholder="请输姓名" id="inputname"
																aria-describedby="basic-addon1">
														</div>
														<div style="text-align: initial;">
															<select id="selfont">
																<option value="SimSun">宋体</option>
																<option value="NSimSun">新宋体</option>
																<option value="FangSong">仿宋</option>
																<option value="Microsoft YaHei">微软雅黑</option>
																<option value="STCaiyun">华文彩云</option>
																<option value="STXinwei">华文新魏</option>
																<option value="FZShuTi">方正舒体</option>
																<option value="FZYaoti">方正姚体</option>
															</select>
															<button class="btn btn-primary" type="button"
																id="btnSignInput">写上去</button>
														</div>
														<p class="modal-title" id="exampleModalLongTitle"
															style="color:red; font-size:14px; text-align:left; margin-top:10px;">请在下方线框内绘制您的签名,或直接在此写入</p>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<div class="canvasDiv">
															<div id="editing_area">
																<canvas
																	style="width:100%; height:100%;border:1px solid #ccc"
																	id="canvasEdit"></canvas>
															</div>
														</div>
														<script type="text/javascript" src="js/eSign/esign.js"></script>
														<script type="text/javascript">
															$(function() {
																$().esign("canvasEdit", "sign_show", "sign_clear", "sign_ok");
															});
														</script>
													</div>
													<div class="modal-footer">
														<div style="display:none" id="div_loading">
															<img src="images/loading.gif" /> 正在加载,清稍后...
														</div>
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">返回</button>
														<button class="btn btn-info" type="button" id="sign_clear">清除画布</button>
														<button type="button" class="btn btn-primary"
															onclick="addSign()">确定添加</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="thumb_footer">
										<div class="admin_thumb">
											<img src="extra-images/admin.png" class="marathon-img">
											<h6>中国马拉松赛事联盟</h6>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			var canvas = document.getElementById('passportimg');
			var ctx = canvas.getContext('2d');
			var signCanvas = document.getElementById('canvasEdit');
			var signCtx = signCanvas.getContext('2d');
			var iconImgs = new Array("extra-images/passport-imgs/normalquery.png", "extra-images/passport-imgs/nonequery.png");
			var userName = "";
			window.onload = function() {
				if (isMobile) {
					$("#signtitle").width(150);
				}
			}
		
			function copyNo() {
				var text = document.getElementById("sp-pno");
				if (document.body.createTextRange) {
					var range = document.body.createTextRange();
					range.moveToElementText(text);
					range.select();
				} else if (window.getSelection) {
					var selection = window.getSelection();
					var range = document.createRange();
					range.selectNodeContents(text);
					selection.removeAllRanges();
					selection.addRange(range);
				}
				document.execCommand("Copy"); // 执行浏览器复制命令
		
				$("#p-pno a").css({
					"color" : "green"
				});
				$("#p-pno a").html("复制成功");
				window.setTimeout(function() {
					$("#p-pno a").css({
						"color" : "blue"
					});
					$("#p-pno a").html("复制");
				}, 3000);
			}
		
			$("#idUploadPhoto").click(function() {
				if (typeof FileReader === 'undefined') {
					alert("您的浏览器版本过低！")
					return;
				}
		
				$("#photoUpload").trigger("click");
			});
		
			$("#selfont").change(function() {
				$("#inputname").css("font", "bold 14px " + $("#selfont").val());
			});
		
			$("#sign_input").click(function() {});
		
			$("#photoUpload").change(function() {
				var iLen = this.files.length;
				for (var i = 0; i < iLen; i++) {
					var reader = new FileReader();
					var fileName = this.files[i].name; // 获取文件名  
					var fileType = this.files[i].type; // 文件后缀  
					reader.readAsDataURL(this.files[i]); // 转成base64，此方法执行完后，base64数据储存在reader.result里   
					reader.onload = function(e) {
						var image = new Image(); // 创建一个image对象，供canvas绘图使用      
						image.src = this.result; // this.result即base64的数据  
						image.onload = function() {
							ctx.drawImage(this, posi[26], posi[27], posi[28], posi[29]);
						}
					}
				}
			});
		
			$("#btnSignInput").click(function() {
				signCtx.clearRect(0, 0, canvas.width, canvas.height);
				signCtx.fillStyle = 'black'; // 文字填充颜色  
				signCtx.font = "bold 90px " + $("#selfont").val();
				signCtx.fillText($("#inputname").val(), 20, 100);
			});
		
			$("#idGeneSign").click(function() {
				$("#div_infoCheck").modal("toggle");
			});
		
			$("#idSaveImg").click(function() {
				var tempSrc = canvas.toDataURL("image/png");
		
				var aLink = document.createElement('a');
				aLink.href = tempSrc;
				aLink.download = userName + "的护照照片.png";
				var event;
				if (window.MouseEvent)
					event = new MouseEvent('click');else {
					event = document.createEvent('MouseEvents');
					event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
				}
				aLink.dispatchEvent(event);
		
			});
		
			$("#btnQuery").click(function() {
				var params = {
					idCard : $("#cardno").val(),
					version : "V1.5"
				};
				async("http://run.geexek.com/geeRunner/webapi/getPassportByIdCard", params, function(res) {
					if (typeof res == "string")
						res = JSON.parse(res);
					if (res != null && res.code == 200) {
						passportDraw(res.data);
					} else {
						$("#div_title img").attr("src", "extra-images/passport-imgs/nonequery.png");
						$("#div_title span").show();
						$("#maincontainer").height("auto");
						$("#div_title").show();
						$("#passportimg").hide();
						$("#div_buttons").hide();
						$("#canvastitle").hide();
						$("#p-pno").hide();
					}
				}, function() {}, 'GET');
			});
		
			var img = new Image;
			img.src = imgUrl;
			var posiList = {
				pcPosi : [ 160, 45, 130, 60, 50, 95, 50, 140, 50, 180, 50, 230, 55, 115, 55, 160, 55, 205, 300, 255, 305, 270, 60, 230, 80, 50, 300, 80, 100, 130 ],
				mobPosi : [ 115, 25, 85, 40, 25, 65, 25, 100, 25, 140, 25, 180, 30, 80, 30, 115, 30, 155, 235, 185, 240, 200, 40, 180, 55, 35, 230, 50, 70, 100 ]
			};
			var fontSizes = {
				pcPost : [ 14, 11, 8, 7 ],
				mobPost : [ 10, 7, 5, 4 ]
			};
			var posi = isMobile ? posiList.mobPosi : posiList.pcPosi;
			var fontsize = isMobile ? fontSizes.mobPost : fontSizes.pcPost;
			var p_back_load = false;
			img.onload = function() {
				p_back_load = true;
			}
		
			function passportDraw(user) {
				$("#maincontainer").height(isMobile ? 440 : 472);
				$("#div_title").hide();
				$("#passportimg").fadeIn(2000);
				$("#div_buttons").fadeIn(1000);
				$("#canvastitle").show();
		
				while (!p_back_load) {
					//锁定图片加载状态
				}
		
				ctx.drawImage(img, 0, 0);
		
				ctx.fillStyle = 'black'; // 文字填充颜色  
				ctx.font = "bold " + fontsize[0] + "px Arial"
				ctx.fillText('中国马拉松护照', posi[0], posi[1]);
				ctx.fillText('CAA Marathon Passport', posi[2], posi[3]);
		
				ctx.font = "bold " + fontsize[1] + "px Arial"
				ctx.fillText('姓名/Name', posi[4], posi[5]);
				ctx.fillText('性别/Sex', posi[6], posi[7]);
				ctx.fillText('身份证号码/Identification number', posi[8], posi[9]);
				ctx.fillText('持照人签名/Bearer`s signature', posi[10], posi[11]);
		
				ctx.fillStyle = '#999999'; // 文字填充颜色  
				ctx.fillText(user.name, posi[12], posi[13]);
				ctx.fillText(user.sex == "0" ? "男" : "女", posi[14], posi[15]);
				ctx.fillText(hideCard(user.idCard), posi[16], posi[17]);
		
				ctx.fillStyle = 'black';
				ctx.font = "bold " + fontsize[2] + "px Arial"
				ctx.fillText('护照编号', posi[18], posi[19]);
				ctx.font = "bold " + fontsize[3] + "px Arial"
				ctx.fillText(user.passportNo, posi[20], posi[21]);
		
				ctx.stroke();
		
				userName = user.name;
				$("#inputname").val(user.name);
		
				$("#sp-pno").html(user.passportNo);
				$("#p-pno").show();
			}
		
			function hideCard(card) {
				var sindex = 6;
				var eindex = 13;
				if (card.length <= 13) {
					sindex = eindex.length - 5;
					eindex = length - 1;
				}
				var cardNew = "";
				for (var i in card) {
					if (i >= sindex && i <= eindex) {
						cardNew += "*";
					} else {
						cardNew += card[i];
					}
				}
				return cardNew;
			}
		
			function addSign() {
				var imgsign = new Image();
				imgsign.src = signCanvas.toDataURL("i/png");
				imgsign.onload = function() {
					ctx.drawImage(this, posi[22], posi[23], posi[24], posi[25]);
				}
				$("#div_infoCheck").modal("toggle");
			}
		</script>
		<%@ include file="../staticFiles/foot.html"%>
	</div>
</body>
</html>

