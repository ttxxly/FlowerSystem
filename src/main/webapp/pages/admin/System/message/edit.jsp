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
            <td width="10%" class="tableleft">留言用户</td>
            <td><input type="text" name="userName" id="userName"/></td>
        </tr>
        <tr>
            <td class="tableleft">留言内容</td>
            <td><input type="text" name="userPassword" id="userPassword"/></td>
        </tr>
        <tr>
            <td class="tableleft">留言时间</td>
            <td><input type="text" name="userMoney" id="userMoney"/></td>
        </tr>
        <tr>
            <td class="tableleft">留言特别说明</td>
            <td><input type="text" name="userPhone" id="userPhone"/></td>
        </tr>
        <tr>
            <td class="tableleft">商家回复时间</td>
            <td><input type="text" name="userPhone" id="sdf"/></td>
        </tr>
        <tr>
            <td class="tableleft">商家回复内容</td>
            <td><input type="text" name="userPhone" id="aaa"/></td>
        </tr>
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
