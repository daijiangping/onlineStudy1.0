<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>在线学习答疑社区</title>
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
<body>
<!--修改窗口-->
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
   <div class="min">
       <br><img class="myhead" src="${pageContext.request.contextPath}/upload/user/${sessionScope.userInfo.headImg}" onclick="javscript:location.href='${pageContext.request.contextPath}/upload_head.jsp'">
       <ul class="titles" style="text-align: left">
           <li>
               <a >
                   <h4> 昵
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称&nbsp;&nbsp;
                     <span class="update-realName-win">
                         <span class="realName">  <c:out value="${sessionScope.userInfo.realName}"/></span>
                       <span class="update-realName">点击修改</span>
                     </span></h4>
               </a>
           </li>
           <li>
               <a >
                   <h4>学习账号&nbsp;&nbsp;${sessionScope.userInfo.userName}</h4>
               </a>
           </li>
           <li onclick="updateTell()">
               <a>
                   <h4 style="display: block">联系方式&nbsp;&nbsp;<span class="tell">${sessionScope.userInfo.tell}</span>  <span class="update-tell"></span></h4>
               </a>
           </li>
           <li>
               <a >
                   <h4>加入时间&nbsp;&nbsp;${sessionScope.userInfo.addTime}</h4>
               </a>
           </li>
           <li>
               <a>
                   <h4>社区等级&nbsp;&nbsp;${sessionScope.userInfo.role.name}</h4>
               </a>
           </li>
        </ul>
   </div>
</nav>
<a href="javascript:void(0);" class="gotop-btn" id="to-top">
  <span class="icon-up"></span>回到顶部
</a>
<footer class="footer">
  <a href="tel:10086" class="footer-nav-item">
    <span class="icon-pc"></span>联系我们
  </a>
  <a href="login.jsp" class="footer-nav-lastitem">
    <span class="icon-mb"></span>切换账号
  </a>
</footer>
<script type="text/javascript">
    var ukey=null,GM_PAGE_TYPE = "post",
            url_signup = "https:\/\/account.guokr.com\/sign_up\/?success=http%3A%2F%2Fm.guokr.com%2Fsso%2F%3Fsuppress_prompt%3D1%26lazy%3Dy%26success%3Dhttp%253A%252F%252Fwww.guokr.com%252Fgroup%252Fuser%252Frecent_replies%252F",
            url_signin = "../../sso/mobile/@suppress_prompt=1&lazy=y&success=http_253A_252F_252Fm.guokr.com_252Fpost_252F415405_252F";
    var post_id = 415405;
</script>
<script src="msite/scripts/7e1793a0.zepto.js"></script>
<script src="msite/scripts/a9468bf8.m.js"></script>
<script>
    $(function () {
        $(".realName").click(function () {
            updateRealName();
        });
        $(".update-realName").click(function () {
            updateRealName();
        });
    });
    //修改realname
    function updateRealName() {
        var old = $(".realName").text();
        var html = "<input type='text' maxlength='12' placeholder='请输入新昵称' class='newRealName' value='"+old+"'>&nbsp;&nbsp;" +
                "<input type='submit' class='saveBtn' onclick='saveRealName()' value='保存'>";
        $(".update-realName-win").html(html);
    }
    //提交修改呢成
    function saveRealName() {
        var newRealName=$(".newRealName").val();
        if(newRealName.length>0){
            var url="${pageContext.request.contextPath}/user!updateRealName.action?user.realName="+newRealName;
            var html = " <span class='realName' onclick='updateRealName()'> "+newRealName+"</span>"+
            "<span class='update-realName' onclick='updateRealName()'>&nbsp;&nbsp;点击修改</span>";
            $(".update-realName-win").html(html);
            $.post(url);

        }
    }
</script>
</body>
</html>