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
        }
        .info{
            display: block;
            width: 100%;
          text-align: center;
            color: darkred;
        }

    </style>
    <script>
        $(function () {
            //检查用户名是否存在
            $("[name=username]").blur(function () {
                var username=$("[name=username]").val();
                if(username!=""){
                    var data = {"user.userName":username};
                    var url = "${pageContext.request.contextPath}/user!checkUserNameIsExist.action";
                    $.post(url,data,function (state) {
                        if(state==2){
                            infoShowAndHide("该用户已经被注册！",10000);
                        }
                    });
                }
            });

            //提交注册
            $(".submit-btn").click(function () {
                var username=$("[name=username]").val();
                var password=$("[name=password]").val();
                var password1=$("[name=password1]").val();
                var tell=$("[name=tell]").val();
                if(username==""){
                    infoShowAndHide("用户名不能为空！",1000);
                }else if(username.length>15||username.length<6){
                    infoShowAndHide("用户名在6到15之间！",1000);
                }else if(password==""){
                    infoShowAndHide("密码不能为空！",1000);
                }else  if(password.length>15||password.length<6){
                    infoShowAndHide("密码在6到15之间！",1000);
                }else if(password1!=password){
                    infoShowAndHide("两次密码不一致请重新输入！",1000);
                }else if(tell==""){
                    infoShowAndHide("请输入联系方式！",1000);
                }else if(!(tell && /^1[3|5|4|7|5|8]\d{9}$/.test(tell))){//正则表达式验证
                    infoShowAndHide("请输入正确的手机号！",1000);
                }else{
                    var data = {"user.userName":username,"user.password":password,"user.tell":tell};
                    var url = "${pageContext.request.contextPath}/user!register.action";
                    $.post(url,data,function (state) {
                        if(state==1){
                            infoShowAndHide("注册成功！",800);
                            location.href="login.jsp";
                        }else if(state ==2){
                            infoShowAndHide("注册失败！此用户名已经被注册",1000);
                        }else {
                            infoShowAndHide("注册失败！原因:未知500",1000);
                        }

                    })
                    infoShowAndHide("正在注册....",10000);
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
<body><br><br>
<div class="panel panel-default" style="border:0;height: 100%;">
    <div class="panel-heading" style="background: #43ccb5;color: white">
        申请加入在线学习社区
    </div>
    <div class="panel-body"><br>
        <input type="text" class="form-control" name="username"  placeholder="用户名" maxlength="16"><br>
        <input type="password" class="form-control" name="password"  placeholder="密码" maxlength="16"><br>
        <input type="password" class="form-control" name="password1"  placeholder="确认密码" maxlength="16"><br>
        <input type="tel" class="form-control" name="tell"  placeholder="联系方式" maxlength="11"><br>
        <button type="button" class="btn btn-default btn-block submit-btn" style="background: #43ccb5;color: white">立即加入</button><br>
        <span class="info">&nbsp;</span><br>

        <a class="register" href="login.jsp">已有账号？立即登录</a>
        <a class="forget" href="">忘记密码?</a>
    </div>
</div>
<div class="banquan">版权所有:ZWL<br>技术支持:405632154@qq.com</div>
</body>
</html>