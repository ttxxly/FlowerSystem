<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>欢迎注册|鲜花网</title>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-responsive.min.css" />
	<%--<link rel="stylesheet" href="../css/base.css">--%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
	<link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/css" src="${pageContext.request.contextPath}/js/index.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/getCode.js"></script>
	<script type="text/javascript">
        function check() {
            var userName = $('#userName').val();
            var userPassword = $('#userPassword').val();
            var reUserPassword = $('#reUserPassword').val();
            var userPhone = $('#userPhone').val();
            var userEmail = $('#userEmail').val();
            var regPhone =/^[1][3,4,5,7,8][0-9]{9}$/;
            var regEmail =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

            var Fdata = $("#newUser").serialize();

            if (userName == '' || userPassword == ''){
                $("#message").text("账号或者密码不能为空！");
                return false;
            }if(reUserPassword != userPassword){
                $("#message").text("两次输入密码不同");
                return false;
            }if(userPhone==''){
                $("#message").text("移动电话不能为空");
                return false;
            }if(regPhone.test(userPhone)==false){
                $("#message").text("电话号码格式错误");
                return false;
            }if(userEmail==''){
                $("#message").text("邮箱不能为空");
                return false;
            }if(regEmail.test(userEmail)==false){
                $("#message").text("邮箱格式错误");
                return false;
            }
            $.ajax({
				url:"/pages/view/register/register",
				data:Fdata,
                type:"POST",
				success:function (Sdata) {
                    if (Sdata == "OK"){
                        window.location.href='../login/login.jsp';
                        alert("注册成功");
                    } if(Sdata == "FAIL"){
                        window.location.href='./register.jsp';
                        alert("注册失败");
                    }if(Sdata == "IN"){
                        window.location.href='./register.jsp';
                        alert("账号已存在");
                    }
                }
			})
			return true;
        };
	</script>
</head>
<body>
<%--页面头部开始--%>
<div class="contain">
	<div class="header">
		<div class="header-banner clearfix">
			<%--头部左边 --%>
			<div class="header-left">
				<a href="/pages/index/list">
					<img src="${pageContext.request.contextPath}/images/timg4.jpg"
						 height="94" width="216"></a>
			</div>
			<div class="left-text"><p> | 欢迎注册</p></div>
			<%--头部右边 --%>
			<div class="header-right">
				<div class="input-group col-md-3" style="margin-top:0px; positon:relative">
				</div>
			</div>
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
		<div class="registerbox">
			<h2>欢迎注册</h2>
				<span id ="message" style="color: red;">${msg}</span>
			<form id ="newUser" action="##" method="post"
				   accept-charset="UTF-8">
			<ul>
					<li>
						<input type="text" id="userName" name="userName" placeholder="请输入您的用户名"/>
					</li>
					<li>
						<input type="password" id="userPassword" name = "userPassword" placeholder="输入密码">
					</li>
					<li>
						<input type="password" id = "reUserPassword" name="reUserPassword" placeholder="再次输入密码">
					</li>
					<li>
						<input type="text" id="userPhone" name="userPhone" placeholder="移动电话">
					</li>
					<li>
						<input type="text" id="userEmail" name="userEmail" placeholder="电子邮件">
					</li>
				</ul>
				<label for="answer"><input type="checkbox" class="answer" id="answer">我已阅读并同意</label>&nbsp;<a href="#">网站服务条款</a>
					<button  class="register" type="button" onclick="check()">立即注册</button>
			</form>
			<%--<input type="button" value = "返回" class="register" onclick="window.location.href='index.jsp' "/>--%>

			<div class="other">已有账户？<a href="${pageContext.request.contextPath}/pages/login/login.jsp">直接登录></a>
			</div>

		</div>
	</div>
</div>
<!-- 内容结束 -->


</body>
</html>