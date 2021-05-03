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
    <title>新增产品</title>
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
<form action="/pages/admin/Flower/Product/add/addFlower"
      method="post"
      enctype="multipart/form-data">
    <table>
        <span id="message" style="color: red;">${msg}</span>
        <tr>
            <td width="10%" class="tableleft">花朵图片</td>
            <td><input type="file" name="file" id="file" multiple="multiple"/></td>
        </tr>
        <tr>
            <td class="tableleft">花朵名称</td>
            <td><input type="text" name="flowerName" id="flowerName"/></td>
        </tr>
        <tr>
            <td class="tableleft">花朵数量</td>
            <td><input type="text" name="flowerNumber" id="flowerNumber"/></td>
        </tr>
        <tr>
            <td class="tableleft">花朵单价</td>
            <td><input type="text" name="flowerPrice" id="flowerPrice"/></td>
        </tr>
        <tr>
            <td class="tableleft">花的类型</td>
            <td><input type="text" name="flowerType" id="flowerType"/></td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="submit" onclick="abc();">添加</button> &nbsp;&nbsp;
                <button type="button" onclick="history.back()">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
