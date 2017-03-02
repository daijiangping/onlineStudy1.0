<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>    <title>在线学习答疑社区</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width, minimal-ui">
    <link rel="stylesheet" href="msite/styles/f3d0a03a.m.css"/>
    <link rel="stylesheet" href="msite/styles/a0fc97c4.index.css" type="text/css"/>
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
            <li><a href="${pageContext.request.contextPath}/problem!pageFindAllProblem.action?problemSort.id=0">最新提问</a></li>
            <li><a href="${pageContext.request.contextPath}/problem!pageFindAllProblem.action?problemSort.id=-1">全部热门</a></li>
            <li><a href="${pageContext.request.contextPath}/sort_list.jsp">分类</a></li>
        </ul>
    </nav>
</header>

<section class="content-block">
    <%--<ul class="focus" id="focus">
        <li>
            <a href="#">
                <img width="320" height="228" src="img/1.jpg">
                <h4 class="gellipsis">紫禁城的石头是怎么运来的？</h4>
            </a>
        </li>
        <li>
            <a href="#">
                <img width="320" height="228" src="img/2.jpg">
                <h4 class="gellipsis">ISON过近日点，冰与火今夜决战！</h4>
            </a>
        </li>

        <li>
            <a href="#">
                <img width="320" height="228" src="img/3.jpg">
                <h4 class="gellipsis">美国的“人造鸡蛋”到底是个啥？</h4>
            </a>
        </li>

        <li>
            <a href="#">
                <img width="320" height="228" src="img/4.jpg">
                <h4 class="gellipsis">更薄更快更强，这才是安全套精神！</h4>
            </a>
        </li>

        <li>
            <a href="#">
                <img width="320" height="228" src="img/5.jpg">
                <h4 class="gellipsis">搭讪要像光一样，嗖！</h4>
            </a>
        </li>

    </ul>--%>
        <div class="block-title">
            <h2>热门推荐</h2>
            <a href="sort_list.jsp" data-gaevent="home_more_questions:home" class="icon-more">更多</a>
        </div>
    <ul class="titles">
        <c:forEach items="${applicationScope.mapHot.dataList}" var="p">
        <li>
            <a href="${pageContext.request.contextPath}/problem!findBySortIdAndId.action?problem.id=${p.id}" class="article">
                <h4>${p.title}</h4>
            </a>
        </li>
        </c:forEach>

    </ul>
</section>
<section class="content-block" id="askBlock">

    <div class="block-title">
        <h2>热门问答</h2>
        <a href="sort_list.jsp" data-gaevent="home_more_questions:home" class="icon-more">更多</a>
    </div>
    <nav>
        <ul class="tab">
            <c:forEach items="${applicationScope.initIndexSortPageData}" varStatus="d" var="s">
                <c:choose>
                    <c:when test="${d.index==0}">
                        <li class="current">
                            <h3>${s.name}</h3>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li >
                            <h3>${s.name}</h3>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
    </nav>
    <section class="titles-list">

        <ul class="titles">
            <c:forEach items="${applicationScope.sortPageData.sort0}" var="p">
            <li >
                <a href="${pageContext.request.contextPath}/problem!findBySortIdAndId.action?problem.id=${p.id}">
                    <h4>${p.title}</h4>
                </a>
            </li>
            </c:forEach>
        </ul>

        <ul class="titles">
            <c:forEach items="${applicationScope.sortPageData.sort1}" var="p">
            <li>
                <a href="${pageContext.request.contextPath}/problem!findBySortIdAndId.action?problem.id=${p.id}">
                    <h4>${p.title}</h4>
                </a>
            </li>
            </c:forEach>
        </ul>

        <ul class="titles">
            <c:forEach items="${applicationScope.sortPageData.sort2}" var="p">
            <li>
                <a href="${pageContext.request.contextPath}/problem!findBySortIdAndId.action?problem.id=${p.id}">
                    <h4>${p.title}</h4>
                </a>
            </li>
            </c:forEach>
        </ul>

        <ul class="titles">
            <c:forEach items="${applicationScope.sortPageData.sort3}" var="p">
            <li>
                <a href="${pageContext.request.contextPath}/problem!findBySortIdAndId.action?problem.id=${p.id}">
                    <h4>${p.title}</h4>
                </a>
            </li>
            </c:forEach>
        </ul>

        <ul class="titles">
            <c:forEach items="${applicationScope.sortPageData.sort4}" var="p">
            <li>
                <a href="${pageContext.request.contextPath}/problem!findBySortIdAndId.action?problem.id=${p.id}">
                    <h4>${p.title}</h4>
                </a>
            </li>
            </c:forEach>
        </ul>
    </section>

</section>


<a href="javascript:void(0);" class="gotop-btn" id="to-top">
    <span class="icon-up"></span>回到顶部
</a>

<script type="text/javascript">
    var ukey = null, GM_PAGE_TYPE = "home",
            url_signup = "https:\/\/account.guokr.com\/sign_up\/?success=http%3A%2F%2Fm.guokr.com%2Fsso%2F%3Fsuppress_prompt%3D1%26lazy%3Dy%26success%3Dhttp%253A%252F%252Fwww.guokr.com%252Fgroup%252Fuser%252Frecent_replies%252F",
            url_signin = "sso/mobile/@suppress_prompt=1&lazy=y&success=http_253A_252F_252Fm.guokr.com_252F";
</script>
<script src="msite/scripts/7e1793a0.zepto.js"></script>
<script src="msite/scripts/a9468bf8.m.js"></script>
<script src="msite/scripts/4e06de78.index.js"></script>
<script>
    $(function () {
        $(".seach-div div").click(function () {
            $(".seach-input").val($(this).text());
            $(".seach-div").hide();
        });
        //提交搜索
        $(".seach-input").keyup(function (e) {
              var keycode = e.which;
            if(keycode==13){
                $(".search-form").submit();
            }
        });
    });
</script>
</body>
</html>