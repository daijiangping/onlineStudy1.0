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
    <style>
        .input-f{
            width: 70%;height: 30px;border- : 5px;margin: 0 auto;
            border:1px solid #43ccb5;text-indent: 1em;
        }
        .save{width: 70%;height: 30px;border-radius: 5px;margin: 0 auto;border:1px solid #EAEAEA;}
        .info{color: darkred;}
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
            
<nav class="content-block mobile-site gclear">
    <section class="content-block">
        <div class="block-title">
            <h2>修改密码</h2>
        </div>
        <div class="comments">

            <article class="comment" style="text-align: center">
             <input type="password" class="input-f oldPwd" placeholder="请输入原密码"><br><br>
                <input type="password" class="input-f newPwd" placeholder="请输入新密码"><br><br>
                <input type="password" class="input-f newPwd1" placeholder="请再次输入新密码"><br>
            </article>
            <article class="comment" style="text-align: center;height: 150px">
                <span class="info">&nbsp;</span>
                <br>
                <input type="button" value="保存" class="save">
            </article>
        </div>
    </section>

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

        $(".save").click(function () {
            var oldPwd=$(".oldPwd").val();
            var newPwd=$(".newPwd").val();
            var newPwd1=$(".newPwd1").val();
            if(oldPwd==""){
                infoShowAndHide("请输入原密码",1000);
            }else if(newPwd==""){
                infoShowAndHide("请输入新密码",1000);
            }else if(newPwd1==""){
                infoShowAndHide("请再次输入新密码",1000);
            }else if(newPwd1!=newPwd){
                infoShowAndHide("两次密码输入不一致",1000);
            }else{
                var data = {"user.password":oldPwd,"newPwd":newPwd};
                var url = "${pageContext.request.contextPath}/user!updatePwd.action";
               $.post(url,data,function (state) {
                   if(state==1){
                       infoShowAndHide("修改成功！",2000);
                   } else if(state==2){
                       infoShowAndHide("原密码不正确！",2000);
                   }else{
                       infoShowAndHide("发生未知的错误 稍后再试！",2000);
                   }
               });
                infoShowAndHide("正在验证密码...",100000);
            }
        });
    });
    //提示消息
    function infoShowAndHide(text,millisec) {
        $(".info").text(text);
        setTimeout(function () {
            $(".info").html("&nbsp;");
        },millisec);
    }
</script>
</body>
</html>