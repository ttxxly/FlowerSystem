<%@ page import="com.gdcp.bishe.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/10/23
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
    <script type="text/css" src="${pageContext.request.contextPath }/js/index.js"></script>

<script>

</script>
</head>
<body>
<div class="contain">
    <div class="header">
        <div class="header-banner clearfix">
            <div class="header-left">
                <img src="${pageContext.request.contextPath}/images/timg4.jpg" height="94" width="216">
            </div>
            <div class="header-right">
                <div class="reg-login">

                    <%
                        User user = (User) session.getAttribute("USER_SESSION");
                        if (user != null){%>

                    <a href="#"> Hello! <span></span>${USER_SESSION.userName}</a>
                    <span></span>
                    <a href>账号余额：${USER_SESSION.userMoney}</a>
                    <span></span>
                    <a href="/pages/view/order/find">订单查询</a>
                    <span></span>
                    <a href="${pageContext.request.contextPath}/pages/view/money.jsp" class="car"><b></b>充值</a>
                    <span></span>
                    <a href="/pages/view/shopCart/list" class="car"><b></b>购物车<em><span class="glyphicon glyphicon-shopping-cart"></span></em></a>
                    <span></span>
                    <a href="/login/logout">退出</a>
                    <span></span><span></span>

                    <%}else{%>
                    <a href="/pages/login/login.jsp">你好，请登录</a>
                    <span>|</span>
                    <a href="/pages/view/register.jsp">注册</a>
                    <span></span>
                    <a href="/pages/login/Rlogin.jsp">管理员模式</a>

                    <%}%>

                </div>
                <form action="/pages/view/userSelectFlower" method="post"
                      >
                    <div class="input-group col-md-3">
                        <input type="text" class="form-control" placeholder="请输入搜索内容"
                               name="flowerName" id="flowerName" value="${flowerList.flowerName}">
                        <span class="input-group-btn" >
                        <button type="submit" class="btn btn-info btn-search" style="position: relative;right: -60px" >查找</button>
                    </span>
                    </div>
                    <div class="sort">
                        ￥ <input type="number" id="firstMoney" name="firstMoney" min="0">
                        -
                        <input type="number" id="lastMoney" name="lastMoney" min="0">
                    </div>
                </form>
            </div>
            <!-- 头部右边结束 -->
            <!-- 导航条 -->
            <div class="navbar">
                <div class="navbar-inner">
                    <ul class="nav nav-pills">
                        <li ><a href="/pages/view/User/selectFlowerByType?flowerType=爱情鲜花">爱情鲜花</a></li>
                        <li class="dropdown" class="active"><a href="/pages/view/User/selectFlowerByType?flowerType=生日鲜花">生日鲜花</a>

                        </li>
                        <li><a href="/pages/view/User/selectFlowerByType?flowerType=友情鲜花">挚友鲜花</a></li>
                        <li><a href="/pages/view/User/selectFlowerByType?flowerType=婚庆鲜花">婚庆鲜花</a></li>
                        <li class="dropdown"><a href="/pages/view/User/selectFlowerByType?flowerType=祝贺鲜花">祝福鲜花</a>

                        </li>
                        <li><a href="/pages/view/User/selectFlowerByType?flowerType=商务鲜花">商务鲜花</a></li>
                    </ul>
                </div>
            </div>


            <div class="phone">
                <a href="#">
                    <span class="glyphicon glyphicon-user"></span><span> 0624-75495</span></a>
            </div>
        </div>
    </div>
</div>




</body>
<style type="text/css">
    .input-group{
        top: 80px;
        left: 100px;

    }
    .input-group .form-control{

        width: 250px;
        height: 40px;
        margin-right: 8px;
        margin-left: 60px;

    }
    .input-group .btn{
        height: 40px;
        left: 60px;
    }
    .sort{
        position: absolute;
        top: 90px;
        left: 20px;
    }
    .sort input{
        width: 50px;
    }

    .navbar .nav > li .dropdown-menu {
        margin: 0;
    }
    .navbar .nav > li:hover .dropdown-menu {
        display: block;
    }

    .navbar{
        background: #f6f6f7;
        width: 800px;
        height: 50px;
        position: relative;
        padding-bottom: 30px;
        top: 140px;
        left: 300px;

    }
    .navbar .nav li{
        margin-right: 30px;
    }
    .navbar .navbar-inner{
        position: absolute;
        left: 30px;
        top: 5px;
    }
    .navbar li a{
        color: #555555;
    }

    .navbar  li a:hover{
        background:#e7e7e7;
    }
    .navbar .nav .dropdown  .dropdown-menu li{
        margin-bottom: 10px;
    }
</style>
</html>
