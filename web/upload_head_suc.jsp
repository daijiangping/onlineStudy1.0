<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8"> 
<title>头像设置成功</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width, minimal-ui">
	<link rel="stylesheet" href="msite/styles/f3d0a03a.m.css" />
	<link rel="stylesheet" href="msite/styles/bee116ff.site.css" type="text/css" />
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="msite/images/43de0067.apple-touch-icon-114x114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="msite/images/258bbb41.apple-touch-icon-72x72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="msite/images/5da37614.apple-touch-icon-precomposed.png">
	<style>
		.min{height: 500px;text-align: center;}
		.myhead{  width: 100px;height: 100px;border-radius: 100px;}
		.update-tell,.update-realName{color: gray;font-size: 12px}
		.newRealName{border:0}
		.saveBtn{width: 50px;height: 30px;border:1px solid #EAEAEA}
	</style>
</head>
	<script src="/bootstrap/js/jquery-1.11.1.min.js"></script>
<style type="text/css">
.con4{
     width: 300px;
     height: auto;
     overflow: hidden;
     margin: 20px auto;
     color: #FFFFFF;
}
.con4 .btn{
     width: 100%;
     height: 40px;
     line-height: 40px;
     text-align: center;
     background: #43ccb5;
     display: block;
     font-size: 16px;
     border-radius: 5px;
}
.upload{
     float: left;
     position: relative;
}
.upload_pic{
     display: block;
     width: 100%;
     height: 40px;
     position: absolute;
     left: 0;
     top: 0;
     opacity: 0;
     border-radius: 5px;
}
#cvs{
	border: 1px solid #E5E5E5;
	margin:20px 0 20px 50px;
}
</style>
</head>
<body>

<header class="nav" id="nav">
	<div class="nav-top">
		<a href="javascript:void(0);" class="nav-btn" id="navBtn"><span class="icon-nav"></span></a>
		<a href="index.html" class="nav-logo icon-logo"><h1>在线学习社区</h1></a>

		<a href="#"class="nav-right">
			<span class="icon-pc">PC版</span>
		</a>

	</div>
	<nav class="nav-btm">
		<div class="nav-unlogin">
			<c:choose>
				<c:when test="${empty sessionScope.userInfo}">
					<a href="login.jsp"><span class="icon-user"></span>用户登录</a>
					<a href="register.jsp"><span class="icon-reg"></span>加入社区</a>
				</c:when>
				<c:otherwise>
					<a href="my.jsp"><span class="icon-user"></span>个人中心</a>
					<a href="send/send.jsp"><span class="icon-reg"></span>我要提问</a>
				</c:otherwise>
			</c:choose>
		</div>
		<ul id="navMenu" class="tab tab-fixed">
			<li class="current"><a href="index.jsp">首页</a></li>
			<li><a href="${pageContext.request.contextPath}/problem!pageFindAllProblem.action?problemSort.id=0">最新提问</a></li>
			<li><a href="${pageContext.request.contextPath}/problem!pageFindAllProblem.action?problemSort.id=-1">全部热门</a></li>
			<li><a href="${pageContext.request.contextPath}/sort_list.jsp">分类</a></li>
		</ul>
	</nav>
</header>
	<div>
		<ul class="page-tab">

			<li class="current" style="width: 95%">
				<h2><a href="myinfo.jsp">头像保存成功！点我查看新头像</a></h2>
			</li>
		</ul>

	</div>
<script>
	$(function () {
		//点击查看回复
		$(".findAllBtn").click(function () {
			$(this).hide();
		});
		//点击顶部按钮显示菜单
		$("#navBtn").click(function () {
			$("#navMenu").toggle();
		});
		$(".upload_pic").change(function () {
			$(".updateForm").submit();
		});
	});
</script>
</body>

</html>