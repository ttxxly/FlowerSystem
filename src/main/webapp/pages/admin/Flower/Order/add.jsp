<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/10/23
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增订单</title>
</head>
<body>
<form action="" method="post" >
    <table>
        <tr>
            <td width="10%" class="tableleft">订单id</td>
            <td><input type="text" name="orderId"/></td>
        </tr>
        <tr>
            <td class="tableleft">订单名称</td>
            <td><input type="text" name="orderName"/></td>
        </tr>
        <tr>
            <td class="tableleft">花朵名称</td>
            <td><input type="text" name="orderName"/></td>
        </tr>
        <tr>
            <td class="tableleft">订单金额</td>
            <td><input type="text" name="orderPrice"/></td>
        </tr>
        <tr>
            <td class="tableleft">订单数量</td>
            <td><input type="text" name="orderNumber"/></td>
        </tr>
        <tr>
            <td class="tableleft">订单地址</td>
            <td>
                <div class="controls">
                    <select class="input-small"><option>广东省</option><option>湖南省</option></select>&nbsp;&nbsp;
                    <select class="input-small"><option>广州</option><option>深圳</option></select>
                </div>
            </td>
        </tr>
        <tr>
            <td class="tableleft">订单时间</td>
            <td>  <div class="controls">
                <input type="text" class="calendar" data-rules="{required:true}">
            </div>
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="button">添加</button> &nbsp;&nbsp;
                <button type="button">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
