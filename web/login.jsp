<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>    <title>在线学习答疑社区</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width, minimal-ui">
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <script src="/bootstrap/js/jquery-1.11.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <style type="text/css">
        body{
            background: #2E2E2E;
        }
        .panel-heading{  background:#43ccb5 ; text-align: center}
        .register{float: left;text-decoration: none}
        .forget{float: right;text-decoration: none}
        .banquan{position: fixed;bottom: 0;height: 55px;text-align: center;width: 100%;color: gray}
        .form-control{
            height: 45px;border: 1px solid #43ccb5;
        }  .info{
               display: block;
               width: 100%;
               text-align: center;
               color: darkred;
           }
    </style>
    <script>
        $(function () {
          //提交登录
            $(".submit-btn").click(function () {
                var username = $("[name=username]").val();
                var password = $("[name=password]").val();
                if(username==""){
                    infoShowAndHide("请输入用户名",1000);
                }else if(password==""){
                    infoShowAndHide("请输入密码",1000);
                }else{
                    var data={"user.userName":username,"user.password":password};
                    var url = "${pageContext.request.contextPath}/user!login.action";
                    $.post(url,data,function (state) {
                        if(state==1){
                            infoShowAndHide("登录成功！",1000);
                            location.href="${pageContext.request.contextPath}/index.jsp";
                        }else{
                            infoShowAndHide("账户名或密码错误！",2000);
                        }
                    })
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
</head>
<body>
<br>
<br>
<br>
<div class="panel panel-default" style="border:0;height: 100%;">
    <div class="panel-heading" style="background: #43ccb5;color: white">
        在线学习社区登录
    </div>
    <div class="panel-body"><br>
        <input type="text" name="username" class="form-control" style=""  placeholder="用户名"><br>
        <input type="password" name="password" class="form-control"  style="border: 1px solid #43ccb5;" placeholder="密码"><br>
        <button type="button" class="btn btn-default btn-block submit-btn" style="background: #43ccb5;color: white">立即登录</button><br>
        <span class="info">&nbsp;</span>
        <a class="register" href="register.jsp">2秒加入社区</a>
      <%--  <a class="forget" href="">忘记密码?</a>--%>
    </div>
</div>
<div class="banquan">版权所有:ZWL<br>技术支持:405632154@qq.com</div>
</body>
</html>