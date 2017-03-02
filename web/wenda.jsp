<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <title>在线学习答疑社区</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="msite/styles/f3d0a03a.m.css"/>
    <link rel="stylesheet" href="msite/styles/34c4b789.ask.css" type="text/css"/>
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="msite/images/43de0067.apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="msite/images/258bbb41.apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="msite/images/5da37614.apple-touch-icon-precomposed.png">
    <style>
        .seach-input {
            width: 70%;
            height: 30px;border:1px solid #E5E5E5;
        }

        .seach-div {
            background: white;
            border:1px solid #E5E5E5;
            border-top-radius: 5px;
            position: absolute;
            z-index: 5;
            width: 63%;margin-top: -2px;
            left: 24%;-webkit-box-shadow: gray 0px 0px 5px;
            -moz-box-shadow: gray 0px 0px 5px;
            box-shadow: gray 0px 0px 5px;
            border-top: 0;
            display: none;
        }
        .seach-div div{
            width: 100%;
            text-align: left;text-indent: 2em;
            border-bottom: 1px solid #E5E5E5;
        }.search-btn{ height: 30px;border:0;color:white;}
    </style>
</head>
<body>

<header class="nav" id="nav">
    <div class="nav-top">
        <a href="javascript:void(0);" class="nav-btn" id="navBtn"><span class="icon-nav"></span></a>
        <div>
            <form class="search-form" action="${pageContext.request.contextPath}/problem!serach.action" method="post">
                <input class="seach-input" type="search" name="keyword" placeholder="请输入搜索内容">
                <button type="submit" class="search-btn">搜索</button>
            </form>
        </div>
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
            <li><a href="${pageContext.request.contextPath}/problem!pageFindAllProblem.action?problemSort.id=0">最新提问</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/problem!pageFindAllProblem.action?problemSort.id=-1">全部热门</a>
            </li>
            <li><a href="${pageContext.request.contextPath}/sort_list.jsp">分类</a></li>
        </ul>
    </nav>
</header>


<div class="main">
    <div class="block-title">
        <h2>搜索结果</h2>
    </div>
    <!--贴换关键字-->
    <input class="replace" type="hidden" value="${requestScope.keyword}"/>
    <ul class="ask-list">
        <c:if test="${empty requestScope.serachProblemsList}">
            <li>没有搜索到结果...<br>你还可以更换关键字再试！</li>
        </c:if>
        <c:forEach items="${requestScope.serachProblemsList}" var="p">
        <li>
            <a href="${pageContext.request.contextPath}/problem!findBySortIdAndId.action?problem.id=${p.id}">
                <h4>${p.title}</h4>
                <c:set var="con" value="${p.content}"  ></c:set>
                <c:if test="${fn:length(con)<50}">
                <p> <c:out value='${fn:substring(con, 0, 60)}'></c:out><p>
                </c:if>
                <c:if test="${fn:length(con)>50}">
                <p> <c:out value='${fn:substring(con, 0, 60)}'></c:out>......</p>
                </c:if>
                <c:set var="date" value="${p.addTime}"  ></c:set>
                <span class="ask-descrip"><c:out value='${fn:substring(date, 5, 19)}'></c:out>&nbsp;${p.problemSort.name}领域&nbsp;已有${p.answerNumber}人回答</span>
            </a>
        </li>
        </c:forEach>
    </ul>
</div>


<a href="javascript:void(0);" class="gotop-btn" id="to-top">
    <span class="icon-up"></span>回到顶部
</a>

<script type="text/javascript">
    var ukey = null,
            url_signup = "https:\/\/account.guokr.com\/sign_up\/?success=http%3A%2F%2Fm.guokr.com%2Fsso%2Fask%2F%3Fsuppress_prompt%3D1%26lazy%3Dy%26success%3Dhttp%253A%252F%252Fwww.guokr.com%252Fgroup%252Fuser%252Frecent_replies%252F",
            url_signin = "../sso/ask/mobile/@suppress_prompt=1&lazy=y&success=http_253A_252F_252Fm.guokr.com_252Fask_252F";
</script>
<script src="msite/scripts/7e1793a0.zepto.js"></script>
<script src="msite/scripts/a9468bf8.m.js"></script>
</body>
</html>