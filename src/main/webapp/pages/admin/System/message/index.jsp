<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/10/23
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言管理</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/jquery.min.js"/>
    <link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/bootstrap.min.js"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system.css">
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script>
        function deleteUserById(userId) {
           if(confirm("确定要删除该用户吗？"))
            $.post("/pages/admin/System/User/index/deleteUser",{"userId":userId},function (data) {
                if (data =="OK"){
                    alert("删除成功");
                    window.location.reload();
                } if (data =="FAIL"){
                    alert("删除失败");
                    window.location.reload();
                }
            })
        }


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
</head>
<body onLoad="goPage(1,11);">
<div class="head">
<form  action="/pages/admin/System/User/index/getUserByName" method="get">
    用户名称：
    <input type="text"  placeholder="" name="userName" id="userName">
    <button type="submit" >查询</button>&nbsp;&nbsp;
    <button type="button" onclick="window.location.href='/pages/admin/System/message/edit.jsp'">回复留言</button>
</form>
</div>
<table class="table table-striped" id="idData">
    <thead>
    <tr>
        <th>留言管理id</th>
        <th>留言用户</th>
        <th>留言内容</th>
        <th>留言时间</th>
        <th>留言特别说明</th>
        <th>商家回复时间</th>
        <th>商家回复内容</th>
        <th colspan="2">操作</th>
    </tr>
    </thead>
    <c:forEach items="${USERS}" var="users">
        <tr>
            <td>${users.userId}</td>
            <td>${users.userName}</td>
            <td>${users.userPassword}</td>
            <td>${users.userMoney}</td>
            <td>${users.userEmail}</td>
            <td>${users.userPhone}</td>
            <td>
                <a href="/pages/admin/System/User/Index/findUserById?userId=${users.userId}">编辑</a>
            </td>
            <td>
                <a href="#" onclick="deleteUserById(${users.userId})">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<table width="60%" align="right">
    <tr><td><div id="barcon" name="barcon"></div></td></tr>
</table>

</body>
</html>
