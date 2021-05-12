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
    <title>新增用户</title>
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script>
        function RooteraddUser() {
            var data = $("#addUser").serialize();
            $.ajax({
                type:"post",
                url:"/pages/admin/System/User/add/addUser",
                data:data,
                async: false,
                success:function (data) {
                    if(data =="OK"){
                        history.back();
                        alert("添加成功");
                    }if (data == "FAIL"){
                        alert("添加失败");
                        window.location.reload();
                    }if (data == "IN"){
                        alert("用户已存在");
                    }
                }
            })
        };
    </script>

</head>
<body>
<form name="addUser" id="addUser" >
    <table>
        <tr>
            <td width="10%" class="tableleft">配送品类</td>
            <td><input type="text" name="userName" id="userName"/></td>
        </tr>
        <tr>
            <td class="tableleft">配送地区</td>
            <td><input type="text" name="userPassword" id="userPassword"/></td>
        </tr>
        <tr>
            <td class="tableleft">配送费用</td>
            <td><input type="text" name="userMoney" id="userMoney"/></td>
        </tr>
        <tr>
            <td class="tableleft">配送说明</td>
            <td><input type="text" name="userPhone" id="userPhone"/></td>
        </tr>


        <tr>
            <td></td>
            <td>
                <button type="button" onclick="RooteraddUser()">添加</button>
                &nbsp;&nbsp;<button type="button" onclick="history.back()">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
