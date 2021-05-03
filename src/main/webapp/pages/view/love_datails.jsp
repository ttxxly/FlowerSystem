<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/10/31
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
<%--头部--%>
<jsp:include page="head.jsp"/>
<%--专区名字--%>
<div class="name">
</div>
<%--该专区的全部花朵--%>
<div class="love_flowers">
    <div class="row" style="margin-right: 100px;margin-left: 100px;margin-top: 20px">
        <c:forEach items="${flower_type_list}" var="flower_list">
            <div class="col-xs-3 "><a href="/pages/view/User/buyFlowerById?flowerId=${flower_list.flowerId}" class="info">
                <img src = "${pageContext.request.contextPath}/${flower_list.flowerImg}"  style="width: 400px; height: 300px;">
                <h5>${flower_list.flowerName}</h5>
                <p>
                    <span>￥</span>${flower_list.flowerPrice}
                </p>
                <input type="hidden" value="${flower_list.flowerId}">
            </a></div>
            <c:if test="${status.count % 4 == 0}">
            </tr>
            <tr>
                </c:if>
        </c:forEach>
    </div>
</div>
<%--底部--%>
<jsp:include page="footer.jsp"/>
</body>