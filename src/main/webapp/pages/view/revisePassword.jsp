<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>修改密码</title>
    <meta charset="UTF-8">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css"/>
    <link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/jquery.min.js"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/bootstrap.min.js"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <script type="text/javascript">
        function check() {
            var userName = $("#userName").val();
            var userPassword = $("#userPassword").val();
            var reUserPassword = $("#reUserPassword").val();
            var userPhone = $("#userPhone").val();
            var regPhone = /^[1][3,4,5,7,8][0-9]{9}$/

            if (userName == "" || userPassword == "") {
                $("#message").text("账号或者密码不能为空！");
                return false;
            }
            if (reUserPassword != userPassword) {
                $("#message").text("两次输入密码不同");
                return false;
            }
            if (userPhone == '') {
                $("#message").text("移动电话不能为空");
                return false;
            }
            if (regPhone.test(userPhone) == false) {
                $("#message").text("电话号码格式错误");
                return false;
            }
            $.post("/revisePassword",
                $("#revise").serialize(), function (data) {
                    if (data == "OK") {
                        window.location.href = './login.jsp';
                        alert("修改成功")
                    }
                    if (data == "FAIL") {
                        window.location.reload();
                        alert("修改失败")
                    }
                    if (data == "NOT") {
                        window.location.reload();
                        alert("没有此用户")
                    }
                })
            return true;
        };
    </script>

<body>
<%--页面头部开始--%>
<div class="contain">
    <div class="header">
        <div class="header-banner clearfix">
            <%--头部左边 --%>
            <div class="header-left">
                <a href="/pages/index/list"><img
                        src="${pageContext.request.contextPath}/images/timg4.jpg" height="94" width="216"></a>
            </div>
            <div class="left-text"><p> | 修改密码</p></div>
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
        <div class="registerbox">
            <h2>修改密码</h2>
            <form id="revise" method="post" action="/revisePassword"
                  onsubmit="return check()" accept-charset="UTF-8">
                <ul>
                    <li>
                        <span id="message" style="color: red;">${msg}</span>
                    </li>
                    <li>
                        <input type="text" name="userName" id="userName" placeholder="请输入您的用户名">
                    </li>
                    <li>
                        <input type="text" name="userPhone" id="userPhone" placeholder="输入您的联系电话">
                    </li>
                    <li>
                        <input type="password" name="userPassword" id="userPassword" placeholder="输入新密码">
                    </li>
                    <li>
                        <input type="password" name="reUserPassword" id="reUserPassword" placeholder="确认新密码">
                    </li>
                </ul>
                <input type="submit" value="修改" class="login" id="revisePassword">
            </form>

            <input type="button" value="返回" class="login"
                   onclick="window.location.href='/pages/index/list'">
            <Br/>

        </div>
    </div>
</div>


<!-- 内容结束 -->

</body>
</html>