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
    <title>编辑用户</title>
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <script type="text/javascript">
        function checkUpdate() {
            var data = $("#editUser").serialize();
            $.ajax({
                url:"/pages/admin/System/User/edit/updateUser",
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
<%
    request.setCharacterEncoding("UTF-8");
%>
<form  method="post" name="editUser" id="editUser" action="##">
    <table>
        <span id ="message" style="color: red;">${msg}</span>
        <tr>
            <td width="10%">用户名称</td>
            <td><input type="text" name="userName" value="${user.userName}"/></td>
        </tr>
        <tr>
            <td>用户密码</td>
            <td><input type="text" name="userPassword" value="${user.userPassword}"/></td>
        </tr>
        <tr>
            <td>用户金额</td>
            <td><input type="text" name="userMoney" value="${user.userMoney}"/></td>
        </tr>
        <tr>
            <td>用户电话</td>
            <td><input type="text" name="userPhone" value="${user.userPhone}"/></td>
        </tr>
        <tr>
            <td>用户邮箱</td>
            <td><input type="text" name="userEmail" value="${user.userEmail}"/></td>
        </tr>
        <Tr>
            <Td><input type="hidden" name="userId" value="${user.userId}"></Td>
        </Tr>
        <tr>
            <td></td>
            <td>
                <button type="button" onclick="checkUpdate()">修改</button>
                &nbsp;&nbsp;<button type="button" onclick="history.back()">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
