<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>    <title>在线学习答疑社区</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width, minimal-ui">
    <link rel="stylesheet" href="msite/styles/f3d0a03a.m.css" />
    <link rel="stylesheet" href="msite/styles/34c4b789.ask.css" type="text/css" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="msite/images/43de0067.apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="msite/images/258bbb41.apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="msite/images/5da37614.apple-touch-icon-precomposed.png">
    <style>
        .huifa-btn{
            font-weight: bold;
        }
       .input-answer{
            width: 95%;
            height: 80px;margin: 10px auto;
       }
       .author{color:#4682B4;font-size: 12px }
       .tuo-an{text-indent: 2em}
        .add-answer-win{text-align: center}
        .send-btn{color:white;margin-right: 10px;width: 70px;height: 30px;border:0px;background: #4682B4;margin-top: 2px;margin-left: 70%}
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
    <aside class="current-path gclear">问答</aside>
    <article class="content-main question">
        <header class="header">
            <h1 class="title"><c:out value="${problem.title}"></c:out>
            </h1>
            <div class="publish gclear">
                <h6 class="author gfl">${problem.user.realName}&nbsp;提问于</h6>
                <c:set var="testStr" value="${problem.addTime}"  ></c:set>
                <time class="date gfl" ><c:out value='${fn:substring(testStr, 5, 19)}'></c:out>
                提问领域&nbsp;${problem.problemSort.name}
                </time>
            </div>
        </header>

        <div id="askContent" class="html-text-mixin">
           <c:out value=" ${problem.content}"></c:out>
        </div>
        <div class="share-box">
        </div>
    </article>
    <div class="quality-answer">

        <section class="content-block">
            <div class="block-title">
                <h2>最佳答案</h2>
            </div>
              <!--回复窗口-->
            <div class="add-answer-win">
                <textarea placeholder="请输入你的答案" class="input-answer"></textarea>
                <c:if test="${sessionScope.userInfo==null}">
                <button class="send-btn" >发送</button>
                </c:if>
                <c:if test="${sessionScope.userInfo!=null}">
                <button class="send-btn alery-login" onclick="sendAnswer()">发送</button>
                </c:if>

            </div>
            <!--回复窗口-->
            <c:if test="${sessionScope.userInfo==null}">
                <h2 class="tuo-an" >还没有登录，立即<a href="login.jsp" style="color: #4682B4">登录</a></h2>
            </c:if>
            <div id="answersList" class="content-main">
                <div class="error-info">
                    <c:if test="${empty requestScope.answers}"><br><br>
                        <h3>遗憾！还没有任何回答哟...</h3>
                        <div style="height: 130px"></div>
                    </c:if>
                </div>
                <div class="not-answer"></div>
                <input type="hidden" class="problemId" value="${problem.id}">
            <c:forEach items="${requestScope.answers}" var="aw">
                <div answer549210 class="answer-padding15 answerItem">
                    <footer class="publish quality-answer-author">
                        <h6 class="author"> ${aw.user.realName}<span class="author-major"></span></h6>
                        <c:set var="testStr" value="${aw.addTime}"  ></c:set>
                        <time class="date" ><c:out value='${fn:substring(testStr, 0, 19)}'></c:out></time>
                    </footer>

                    <div class="askcontent">
                       <c:out value=" ${aw.content}"></c:out>
                    </div>
                    <div class="mi-attitude">
                        <a class="mi-btn " onclick="ding(this)"  >顶
                            <input type="hidden" class="awId" value="${aw.id}">
                            <b class="mi-atti-num" >${aw.support}</b>
                        </a>
                        <a class="mi-btn " onclick="cai(this)"  >踩
                            <input type="hidden" class="awId" value="${aw.id}"/>
                            <b class="mi-atti-num">${aw.oppose}</b>
                        </a>
                    </div>
                </div>
            </c:forEach>
            </div>
            <c:if test="${not empty requestScope.answers}">
                <a class="extend gclear get-comments findAllBtn" id="showRestBtn" href="javascript:"><b class="extend-icon extend-icon-down gfr"></b><span class="extend-txt gfl">查看更多答案</span></a>
            </c:if>
        </section>

    </div>

</div>
<div>

</div>

<a href="javascript:void(0);" class="gotop-btn" id="to-top">
    <span class="icon-up"></span>回到顶部
</a>


<script src="msite/scripts/7e1793a0.zepto.js"></script>
<script src="msite/scripts/a9468bf8.m.js"></script>
<script src="msite/scripts/4c0f3579.askContent.js"></script>
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
    });
//发送答案
    function sendAnswer() {
        var content = $(".input-answer").val();
        if(content!=""){
            var html = "<div id=answer549211 class='answer-padding15 answerItem answer-list'>"+
                    " <footer class='publish quality-answer-author'>"+
                    "<h6 class='author'> ${sessionScope.userInfo.realName}<span class='author-major'></span></h6>"+
                    " <time class='date' >刚刚</time>"+
                    "   </footer>"+
                    "    <div class='askcontent'>"+content+""+
                    "       </div>"+
                    "       <div class='mi-attitude'>"+
                    "       <a class='mi-btn ' onclick='ding(this)' >顶"+
                    "       <b class='mi-atti-num'>0</b>"+
                    "       </a>"+
                    "       <a class='mi-btn ' onclick='cai(this) '>踩"+
                    "       <b class='mi-atti-num'>0</b>"+
                    "       </a>"+
                    "       </div>"+
                    "       </div>";
            var arr =  $(".answerItem");
           if(arr.length<=0){
                $(".not-answer").html(html);
           }else{
               $(arr[0]).before(html);
           }
            $(".input-answer").val("");
            var data = {"answer.content":content,"problem.id":$(".problemId").val()};
            var url = "${pageContext.request.contextPath}/problem!addAnswer.action";
            $.post(url,data);
            $(".error-info").remove();
        }else{
            alert("请输入答案");
        }
    }

    //顶一下
    function ding(the) {
        var old = $(the).find("b").text();
        var id =$(the).find("input").val();
        var check = localStorage.getItem(id+"d");
        if(check==null){
            $($(the).find("b").text(parseInt(old)+1));
            localStorage.setItem(id+"d",id);
        }else {
            localStorage.removeItem(id+"d");
            $($(the).find("b").text(parseInt(old)-1));
        }
        var data = {"answer.support":$(the).find("b").text(),"answer.id":id};
        var url = "${pageContext.request.contextPath}/problem!updateSupport.action";
        $.post(url,data);

    }
    //踩一下
    function cai(the) {
        var old = $(the).find("b").text();
        var id =$(the).find("input").val();
        var check = localStorage.getItem(id+"c");
        if(check==null){
            $($(the).find("b").text(parseInt(old)+1));
            localStorage.setItem(id+"c",id);
        }else {
            localStorage.removeItem(id+"c");
            $($(the).find("b").text(parseInt(old)-1));
        }
        var data = {"answer.support":$(the).find("b").text(),"answer.id":id};
        var url = "${pageContext.request.contextPath}/problem!updateOppose.action";
        $.post(url,data);
    }
</script>
<input type="hidden">
</body>
</html>