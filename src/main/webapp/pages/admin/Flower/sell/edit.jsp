<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/10/23
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑订单</title>
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script>
        function checkOrderUpdate() {
            var data = $("#updateOrderForm").serialize();
            $.ajax({
                url:"/pages/admin/Flower/Order/edit/updateOrder",
                type:"post",
                data:data,
                scriptCharset: 'utf-8',
                success:function (data) {
                    if (data=="OK"){
                        alert("修改成功");
                        history.back();
                    } if (data =="FAIL"){
                        alert("修改失败");
                        window.location.reload();
                    }
                }
            })
        };
    </script>
</head>
<body>
<form method="post" id="updateOrderForm" name="updateOrderForm" action="##">
    <table>
        <tr>
            <td width="10%" class="tableleft">订单ID</td>
            <td><input type="text" name="orderId" value="${order.orderId}"
                       readonly="readonly"/></td>
        </tr>
        <tr>
            <td class="tableleft">订单编号</td>
            <td><input type="text" name="orderN" value="${order.orderN}"
                       readonly="readonly"/></td>
        </tr>
        <tr>
            <td class="tableleft">花朵名称</td>
            <td><input type="text" name="flowerName" value="${order.flowerName}"
                       readonly="readonly"/></td>
        </tr>
        <tr>
            <td class="tableleft">用户ID</td>
            <td><input type="text" name="userId" value="${order.userId}"
                       readonly="readonly"/></td>
        </tr>
        <tr>
            <td class="tableleft">订单金额</td>
            <td><input type="text" name="orderPrice" value="${order.orderPrice}"/></td>
        </tr>
        <tr>
            <td class="tableleft">订单数量</td>
            <td><input type="text" name="orderNumber" value="${order.orderNumber}"/></td>
        </tr>
        <tr>
            <td class="tableleft">订单地址</td>
            <td><input type="text" name="orderAddress" value="${order.orderAddress}"/></td>
        </tr>
        <tr>
            <td class="tableleft">订单时间</td>
            <td><input type="text" name="orderTime" value="${order.orderTime}"
                       readonly="readonly"/></td>
        </tr>
        <tr>
            <td class="tableleft">收件人</td>
            <td><input type="text" name="orderUser" value="${order.orderUser}"/></td>
        </tr>
        <tr>
            <td class="tableleft">电话</td>
            <td><input type="text" name="orderPhone" value="${order.orderPhone}"/></td>
        </tr>

        <tr>
            <td class="tableleft"></td>
            <td>
                <button  type="button" onclick="checkOrderUpdate()">修改</button>
                &nbsp;&nbsp;
                <button type="button" onclick="history.back()">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
