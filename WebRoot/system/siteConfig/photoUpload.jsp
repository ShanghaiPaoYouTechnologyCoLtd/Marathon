<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@ include file="../master/systemHeader.jsp" %>

<form method="post" action="servlet/UploadServlet" enctype="multipart/form-data">
    选择一个文件:
    <input type="file" name="uploadFile" />
    <br/><br/>
    <input type="submit" value="上传" />
</form>

<%@ include file="../master/systemFooter.jsp" %>