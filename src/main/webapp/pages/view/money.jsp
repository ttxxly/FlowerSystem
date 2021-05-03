<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>充值</title>
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
    <link rel="stylesheet" href="../../css/login.css">
    <script type="text/javascript">
        function checkMoney() {
            var data = $("#moneyForm").serialize();
            $.ajax({
                url:"/pages/view/money/in",
                data:data,
                success:function (data) {
                    if (data == "OK"){
                        alert("充值成功!");
                        history.back();
                    }if (data =="FAIL"){
                        alert("充值失败！");
                        window.location.reload();
                    }
                },error:function (s) {
                    alert("请输入正确的金额")
                    window.location.reload();
                }
            })
        }
    </script>
<body>

<%--页面头部开始--%>
<div class="contain">
    <div class="header">
        <div class="header-banner clearfix">
            <%--头部左边 --%>
            <div class="header-left">
                <a href="${pageContext.request.contextPath}/pages/view/User/list">
                    <img src="${pageContext.request.contextPath}/images/timg4.jpg"
                         height="94" width="216"></a>
            </div>
            <div class="left-text"><p> | 充值系统</p></div>
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
            <h2>欢迎充值</h2>
            <form method="post" action="##"
                  accept-charset="UTF-8" id="moneyForm">
                <ul>
                    <li>
                        <span id="message" style="color: red;">${msg}</span>
                    </li>
                    <li>
                        <input type="text" name="userMoney" id="userMoney" placeholder="充值金额">
                    </li>
                </ul>
                <input type="button" onclick="checkMoney()" value="确认充值" class="login" id="in">
            </form>
        </div>
    </div>
</div>
<!-- 内容结束 -->

</body>
</html>