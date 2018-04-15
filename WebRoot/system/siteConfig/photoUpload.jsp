<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="../master/systemHeader.jsp"%>
<style>
.div_block {
	
}

.p_title {
	border-bottom: 1px solid skyblue;
	font-size: 20px;
}

.btn_delete {
	margin-left: 10px;
}
</style>

<div class="div_block" id="div_bigBanner">
	<p class="p_title">
		首页大banner图 <input type="submit" value="增加" onclick="addBigBanner()" />
	</p>
	<%
		String diskPath = application.getRealPath("");
		String[] bigBanners = com.apew.marathon.controller.FileReader.GetAllBigBanner(diskPath);
		for (String f : bigBanners) {
			out.print(
					"<form method='post' action='servlet/UploadServlet'enctype='multipart/form-data' class='frm_bigbanner'><input type='hidden' name='bigBanner' /><input class='hid_name' type='text' name='"
							+ f + "' style='width:0px;'/><input class='txt_fileN' type='text' value='" + f
							+ "' /><input type='button' value='替换文件'class='btn_fileC' /> <input class='file_upload' name='uploadFile' type='file' style='width:0px;' accept='image/*'/> <input type='submit' value='上传' /><input type='button' value='删除' class='btn_delete'/></form>");
		}
	%>
</div>
<div class="div_block">
	<p class="p_title">
		二维码
	</p>
	<form method='post' action='servlet/UploadServlet'enctype='multipart/form-data' class='frm_bigbanner'>
	<input type='hidden' name='bigBanner' />
	<input class='hid_name' type='text' name='' style='width:0px;'/>
	<input class='txt_fileN' type='text' value='' />
	<input type='button' value='上传文件'class='btn_fileC' /> 
	<input class='file_upload' name='uploadFile' type='file' style='width:0px;' accept='image/*'/> 
	<input type='submit' value='上传' /><input type='button' value='删除' class='btn_delete'/></form>
</div>
<script>
	eventReg();
	function eventReg() {
		$('.btn_fileC').unbind("click");
		$('.file_upload').unbind("change");
		$('.btn_delete').unbind("click");

		$(".btn_fileC").click(function() {
			$(this).next().click();
		});

		$(".file_upload").change(function() {
			$(this).siblings(".txt_fileN").val($(this).val());

			$(this).siblings(".hid_name").removeAttr("name");

			var suffix = $(this).val().substring($(this).val().lastIndexOf("."));
			var fileName = "bigBanner_";
			for (var i = 1; true; i++) {
				var fileNameNew = fileName + i;
				if ($(".frm_bigbanner input[name^='" + fileNameNew + "']").length <= 0) { //该名称唯一
					fileName = fileNameNew + suffix;
					break;
				}
			}

			$(this).siblings(".hid_name").attr("name", fileName);
		});

		$(".btn_delete").click(function() {
			var fname = $(this).siblings(".hid_name").attr("name");
			$(this).siblings(".hid_name").attr("name", "delete@@" + fname);
			$(this).parent("form").submit();
		});
	}

	function addBigBanner() {
		if ($(".frm_bigbanner").length >= 5) {
			alert("最多添加5个大banner图！");
			return;
		}

		var html = "<form method='post' action='servlet/UploadServlet'enctype='multipart/form-data' class='frm_bigbanner'><input type='hidden' name='bigBanner' /><input type='text' class='hid_name' style='width:0px;'/><input class='txt_fileN' type='text' /><input type='button' value='选择文件'class='btn_fileC'  /> <input class='file_upload' type='file' style='width:0px;' name='uploadFile' accept='image/*'/> <input type='submit' value='上传' /><input type='submit' value='删除' /></form>";
		$("#div_bigBanner").append(html);
		eventReg();
	}
</script>
<%@ include file="../master/systemFooter.jsp"%>