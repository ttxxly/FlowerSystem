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
    <title>编辑产品</title>
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script>
        function checkFlowerUpdate() {
            var data = $("#editFlower").serialize();
            $.ajax({
                url:"/pages/admin/Flower/Product/edit/updateFlower",
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
<form method="post" name="editFlower" id="editFlower" action="##" >
    <table>
        <span id ="message" style="color: red;">${msg}</span>
        <tr>
            <td width="10%" class="tableleft">花朵图片</td>
            <td><img src="${pageContext.request.contextPath}/${flower.flowerImg}" width="90" height="70"></td>
        </tr>
        <tr>
            <td class="tableleft">花朵名称</td>
            <td><input type="text" name="flowerName" value="${flower.flowerName}"/></td>
        </tr>
        <tr>
            <td class="tableleft">花朵数量</td>
            <td><input type="text" name="flowerNumber" value="${flower.flowerNumber}"/></td>
        </tr>
        <tr>
            <td class="tableleft">花朵单价</td>
            <td><input type="text" name="flowerPrice" value="${flower.flowerPrice}"/></td>
        </tr>
        <tr>
            <td class="tableleft">花类型</td>
            <td><input type="text" name="flowerType" value="${flower.flowerType}"/></td>
        </tr>
        <tr>
            <Td><input type="hidden" name="flowerId" value="${flower.flowerId}"></Td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button  type="button" onclick="checkFlowerUpdate()">修改</button>
                &nbsp;&nbsp;
                <button type="button" onclick="history.back()">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
