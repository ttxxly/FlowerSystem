<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>管理员,欢迎您</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/jquery.min.js"/>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/bootstrap.min.js"/>
	<link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/popper.min.js"/>
	<script type="text/javascript">
        function check() {
            var userName = $("#userName").val();
            var userPassword = $("#userPassword").val();

            if(userName =="" || userPassword =="") {
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
			<div class="left-text"><p>|管理员模式</p></div>

			<div class="phone">
				<a href="#">
					<span class="glyphicon glyphicon-user"></span><span>123456</span></a>
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
			<form method="post" action="/login/Rlogin"
				  onsubmit="return check()" accept-charset="UTF-8" id="myform">
				<ul>
					<li>
					<span id ="message" style="color: red;">${msg}</span>
					</li>
					<li>
						<input type="text" id="rooterName" name="rooterName" placeholder="请输入管理员账号">
					</li>
					<li>
						<input type="password" id="rooterPassword" name="rooterPassword" placeholder="输入密码">
					</li>

				</ul>

				<input type="submit" value="登录" class="login" id="in">
				<input type="button" value="返回" class="login"
					   onclick="window.location.href='/pages/index/list'">
			</form>

		</div>
	</div>
</div>
<!-- 内容结束 -->

</body>
</html>