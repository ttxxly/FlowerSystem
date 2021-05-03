<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mi-Shit
  Date: 2018/11/6
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<html>
<head>
    <title>订单查询</title>
</head>
<body>
<%--头部开始--%>
<div class="reg-login">
    <a href="#"> Hello! <span></span>${USER_SESSION.userName}</a>
    <span></span>
    <a href>账号余额：${USER_SESSION.userMoney}</a>
    <span></span>
    <a href="/login/logout">退出</a>
    <span></span><span></span>
    <a href="${pageContext.request.contextPath}/pages/view/money.jsp" class="car"><b></b>充值</a>
    <span></span><span></span>
    <a href="/pages/view/User/list" class="phold"><b></b>返回主页</a>
    <span></span>
</div>
<%--头部结束--%>
<%--订单列表开始--%>
<div class="order_table">
    <table class="table"  width="1400"  cellspacing="0" cellpadding="0">
        <thead>
        <tr class="order_table_title">
            <th>订单Id</th>
            <th>订单号</th>
            <th>花朵名称</th>
            <th>用户ID</th>
            <th>花朵数量</th>
            <th>地址</th>
            <th>总价</th>
            <th>时间</th>
            <th>收件人</th>
            <Th>电话</Th>
        </tr>
        </thead>
        <c:forEach items="${ORDER_LIST}" var="orderList">
            <tr class="order_list">
                <td>${orderList.orderId}</td>
                <td>${orderList.orderN}</td>
                <td>${orderList.flowerName}</td>
                <td>${orderList.userId}</td>
                <td>${orderList.orderNumber}</td>
                <td>${orderList.orderAddress}</td>
                <td>${orderList.orderPrice}</td>
                <td>${orderList.orderTime}</td>
                <td>${orderList.orderUser}</td>
                <td>${orderList.orderPhone}</td>

            </tr>
        </c:forEach>
    </table>
</div>
<%--订单列表结束--%>
<a href="/pages/view/User/list" class="phold p2"><b></b>继续购买</a>
</body>
</html>
