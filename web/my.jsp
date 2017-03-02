<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>    <title>在线学习答疑社区</title>
<meta charset="UTF-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width, minimal-ui">
<link rel="stylesheet" href="msite/styles/f3d0a03a.m.css" />
<link rel="stylesheet" href="msite/styles/bee116ff.site.css" type="text/css" />
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="msite/images/43de0067.apple-touch-icon-114x114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="msite/images/258bbb41.apple-touch-icon-72x72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="msite/images/5da37614.apple-touch-icon-precomposed.png">

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
<nav class="content-block mobile-site gclear">

    <a class="gfl entry gellipsis" href="myinfo.jsp">我的资料</a>

    <a class="gfl entry gellipsis" href="update_pwd.jsp">修改密码</a>

    <a class="gfl entry gellipsis" href="${pageContext.request.contextPath}/problem!findMyProblem.action?op=ok">已解决</a>

    <a class="gfl entry gellipsis" href="${pageContext.request.contextPath}/problem!findMyProblem.action?op=all">我的提问</a>

    <a class="gfl entry gellipsis" href="${pageContext.request.contextPath}/problem!pageFindAllProblem.action?problemSort.id=0">最新提问</a>
    <a class="gfl entry gellipsis" href="${pageContext.request.contextPath}/problem!pageFindAllProblem.action?problemSort.id=-1">热门回答</a>
    <c:if test="${sessionScope.userInfo.role.id==2}">
        <a class="gfl entry gellipsis" href="${pageContext.request.contextPath}/problem!findUserAllProblem.action?op=adminDelete">用户提问管理</a>
    </c:if>
    <a class="gfl entry gellipsis" href="login.jsp">切换账号</a>

</nav>

        <a href="javascript:void(0);" class="gotop-btn" id="to-top">
  <span class="icon-up"></span>
</a>

<script type="text/javascript">
var ukey=null,GM_PAGE_TYPE = "minisiteList",
url_signup = "https:\/\/account.guokr.com\/sign_up\/?success=http%3A%2F%2Fm.guokr.com%2Fsso%2F%3Fsuppress_prompt%3D1%26lazy%3Dy%26success%3Dhttp%253A%252F%252Fwww.guokr.com%252Fgroup%252Fuser%252Frecent_replies%252F",
url_signin = "../sso/mobile/@suppress_prompt=1&lazy=y&success=http_253A_252F_252Fm.guokr.com_252Fsite_252F";
</script>
<script src="msite/scripts/7e1793a0.zepto.js"></script>
<script src="msite/scripts/a9468bf8.m.js"></script>

</body>
</html>