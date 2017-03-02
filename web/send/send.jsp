<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>我要提问</title>
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<!-- 强制让文档的宽度与设备的宽度保持1:1，并且文档最大的宽度比例是1.0，且不允许用户点击屏幕放大浏览 -->
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width, minimal-ui">
	<!-- iphone设备中的safari私有meta标签，它表示：允许全屏模式浏览 -->
	<meta name="apple-mobile-web-app-capable" content="yes">
	<link rel="stylesheet" href="example/css/style.css">
<style>
	body{
		background: white;
	}
	.title-top{
		height:40px;
		line-height: 40px;
		text-align: center;
		width: 100%;color: white;
		background: #2E2E2E;
	}
	.send-btn{
		border: 1px solid #ccc;
		width: 100%;
		height:35px;
		line-height: 35px;background: white;
	}
</style>
</head>
<body>
<br>
	<div style="width:95%;margin: 0 auto;">
		<div class="title-top">在这里发布你的问题</div>
		<div class="publish-article-title">
			<div class="title-tips">标题</div>
			<input type="text" id="title" name="problem.title" class="w100" placeholder="请输入标题" style="width: 90%;border-bottom: 1px solid #EAEAEA">
			<br><br>提问领域&nbsp;&nbsp;&nbsp;<select id="sortId" name="problem.problemSort.id" style="width: 70%">
			<c:forEach items="${applicationScope.sorts}" var="s">
				<option value="${s.id}">${s.name}</option>
			</c:forEach>
			</select>
		</div>
		<div class="publish-article-content">
			<div class="title-tips">详细描述</div>
			<input type="hidden" id="target" >
			<div class="article-content" id="content">

			</div>
			<div class="footer-btn g-image-upload-box">
				<%--<div class="upload-button">
					<span class="upload"><i class="upload-img"></i>插入图片</span>
					<input class="input-file" id="imageUpload" type="file" name="fileInput" capture="camera" accept="image/*" style="position:absolute;left:0;opacity:0;width:100%;">
				</div>--%>
			</div>
		</div>
		<br>
		<input type="button" value="立即提问" class="send-btn" onclick="submitSave()">
	</div>
	<script src="example/js/jquery-1.11.2.js"></script>
	<script src="artEditor.min.js"></script>
	<script src="example/js/index.js"></script>
<script>
	function submitSave() {
		var content = $("#content").text();
		var title = $("#title").val();
		var sortId = $("#sortId").val();
		if(content==""){
			alert("请输入问题描述");
		}else if(title==""){
			alert("标题还没写");
		}
		if(content!=""&&title!=""){
			var url = "${pageContext.request.contextPath}/problem!add.action";
			var data={"problem.content":content,"problemSort.id":sortId,"problem.title":title};
			$(".send-btn").val("发布中...");
			$.post(url,data,function (state) {
				if(state==1){
					alert("发布成功！");
					location.href="${pageContext.request.contextPath}/problem!pageFindAllProblem.action?problemSort.id=0";
				}else if(state==-1){
					alert("用户未登录！");
				}else if(state==-1){
					alert("发布失败！原因：未知");
				}
			});
		}
	}
</script>
</body>
</html>
