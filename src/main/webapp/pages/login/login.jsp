<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>线上花店</title>
    <meta charset="UTF-8">
    <script src="js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-responsive.min.css"/>

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>

    <%--<link rel="stylesheet" href="../css/base.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script type="text/javascript">
        function check() {
            var userName = $("#userName").val();
            var userPassword = $("#userPassword").val();

            if (userName == "" || userPassword == "") {
                $("#message").text("账号或者密码不能为空！");
                return false;
            }
            return true;
        }
    </script>
<body>

<%--页面头部开始--%>
<div class="contain">
    <div class="header">
        <div class="header-banner clearfix">
            <%--头部左边 --%>
            <div class="header-left">
                <a href="/pages/index/list"><img src="${pageContext.request.contextPath}/images/timg4.jpg" height="94" width="216"></a>
            </div>
            <div class="left-text"><p> | 欢迎登录</p></div>
            <%--头部右边 --%>
            <div class="header-right">
                <div class="input-group col-md-3" style="margin-top:0px; positon:relative">

                </div>
            </div>
            <div class="phone">
                <a href="#">
                    <span class="glyphicon glyphicon-user"></span><span> 0624-75495</span></a>
            </div>
        </div>
    </div>
</div>
<%--页面头部结束--%>

<!-- 内容开始 -->
<div class="content">
    <div class="content-banner clearfix">
        <div class="loginbox">
            <h2>欢迎登录</h2>
            <form method="post" action="/login/login"
                  onsubmit="return check()" accept-charset="UTF-8" id="myform">
                <ul>
                    <li>
                        <span id="message" style="color: red;">${msg}</span>
                    </li>
                    <li>
                        <input type="text" name="userName" id="userName" placeholder="请输入您的用户名">
                    </li>
                    <li>
                        <input type="password" name="userPassword" id="userPassword" placeholder="输入密码">
                    </li>
                    <a class="forget" href="../view/revisePassword.jsp">忘记密码？</a>
                </ul>
                <input type="submit" value="登录" class="login" id="in">
            </form>
        </div>
    </div>
</div>
<!-- 内容结束 -->

</body>
</html>