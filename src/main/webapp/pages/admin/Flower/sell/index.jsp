<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/10/23
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>销售管理</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/jquery.min.js"/>
    <link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/bootstrap.min.js"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flower.css">
</head>
<body onLoad="goPage(1,11);">
<div class="head" class="head">
    <form  action="/pages/admin/Flower/Order/index/selectOrderList" method="get">
        输入你要查询的收件人：
        <input type="text"  name="orderUser" id="orderUser">
        <button type="submit" >查询</button>&nbsp;&nbsp;
    </form>
</div>
<table class="table table-striped" id="idData">
    <thead>
    <tr>
        <th>订单ID</th>
        <th>订单编号</th>
        <th>花朵名称</th>
        <th>用户ID</th>
        <th>订单数量</th>
        <th>订单金额</th>
        <th>订单地址</th>
        <th>订单时间</th>
        <th>收件人</th>
        <th>电话</th>
        <th colspan="2">操作</th>
    </tr>
    </thead>
    <c:forEach items="${ORDER_LIST}" var="order">
        <tr>
            <td>${order.orderId}</td>
            <td>${order.orderN}</td>
            <td>${order.flowerName}</td>
            <td>${order.userId}</td>
            <td>${order.orderNumber}</td>
            <td>${order.orderPrice}</td>
            <td>${order.orderAddress}</td>
            <td>${order.orderTime}</td>
            <td>${order.orderUser}</td>
            <Td>${order.orderPhone}</Td>
            <td>
                <a href="/pages/admin/Flower/Order/Index/selectOrderById?orderId=${order.orderId}">编辑</a>
            </td>
        </tr>
    </c:forEach>
</table>

<table width="60%" align="right">
    <tr><td><div id="barcon" name="barcon"></div></td></tr>
</table>

</body>
<script>
    $(function () {
        $('#addOrder').click(function(){
            window.location.href="add.jsp";
        });
    });

    /* 分页*/
    function goPage(pno,psize) {
        var itable = document.getElementById("idData");
        var num = itable.rows.length;//表格所有行数(所有记录数)
        console.log(num);
        var totalPage = 0;//总页数
        var pageSize = psize;//每页显示行数
        //总共分几页
        if (num / pageSize > parseInt(num / pageSize)) {
            totalPage = parseInt(num / pageSize) + 1;
        } else {
            totalPage = parseInt(num / pageSize);
        }
        var currentPage = pno;//当前页数
        var startRow = (currentPage - 1) * pageSize + 1;//开始显示的行  31
        var endRow = currentPage * pageSize;//结束显示的行   40
        endRow = (endRow > num) ? num : endRow;
        40
        console.log(endRow);
        //遍历显示数据实现分页
        for (var i = 1; i < (num + 1); i++) {
            var irow = itable.rows[i - 1];
            if (i >= startRow && i <= endRow) {
                irow.style.display = "block";
            } else {
                irow.style.display = "none";
            }
        }
        var pageEnd = document.getElementById("pageEnd");
        var tempStr = "共" + num + "条记录 分" + totalPage + "页 当前第" + currentPage + "页";
        if (currentPage > 1) {
            tempStr += "<a href=\"#\" onClick=\"goPage(" + (1) + "," + psize + ")\">首页</a>";
            tempStr += "<a href=\"#\" onClick=\"goPage(" + (currentPage - 1) + "," + psize + ")\"><上一页</a>"
        } else {
            tempStr += "首页";
            tempStr += "<上一页";
        }

        if (currentPage < totalPage) {
            tempStr += "<a href=\"#\" onClick=\"goPage(" + (currentPage + 1) + "," + psize + ")\">下一页></a>";
            tempStr += "<a href=\"#\" onClick=\"goPage(" + (totalPage) + "," + psize + ")\">尾页</a>";
        } else {
            tempStr += "下一页>";
            tempStr += "尾页";
        }

        document.getElementById("barcon").innerHTML = tempStr;
    }
</script>
</html>
