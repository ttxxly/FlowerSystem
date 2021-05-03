<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/10/23
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>产品管理</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../../../css/flower.css">
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script>
        function deleteFlowerById(flowerId) {
            if(confirm("确定要删除该用户吗？"))
                $.post("/pages/admin/Flower/Product/index/deleteFlower",{"flowerId":flowerId},function (data) {
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
<body onLoad="goPage(1,7);">
<div class="head">
    <form  action="/pages/admin/Flower/Product/index/selectFlower" method="get">
        产品名称：
        <input type="text"  placeholder="" name="flowerName" id="flowerName">
        <button type="submit" >查询</button>
        &nbsp;&nbsp;
        <button type="button" onclick="window.location.href='/pages/admin/Flower/Product/add.jsp'">新增产品</button>
    </form>
</div>
<table class="table table-striped" id="idData">
    <thead>
    <tr>
        <th>花朵图片</th>
        <th>花朵编号</th>
        <th>花朵名称</th>
        <th>花朵数量</th>
        <th>花的单价</th>
        <th>花朵类型</th>
        <th colspan="2">操作</th>
    </tr>
    </thead>
    <c:forEach items="${FLOWER_LIST}" var="flowerList">
        <tr>
        <td><img src="../../../../../${flowerList.flowerImg}" width="60px" height="50px" ></td>
        <td>${flowerList.flowerId}</td>
        <td>${flowerList.flowerName}</td>
        <td>${flowerList.flowerNumber}</td>
        <td>${flowerList.flowerPrice}</td>
        <td>${flowerList.flowerType}</td>
        <td>
            <a href="/pages/admin/Flower/Product/Index/findFlowerById?flowerId=${flowerList.flowerId}">编辑</a>
        </td>
        <td>
            <a href="#" onclick="deleteFlowerById(${flowerList.flowerId})">删除</a>
        </td>
        </tr>
    </c:forEach>

</table>
<table width="60%" align="right">
    <tr><td><div id="barcon" name="barcon"></div></td></tr>
</table>

</body>
</html>
