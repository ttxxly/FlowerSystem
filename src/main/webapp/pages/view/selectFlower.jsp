<%--
  Created by IntelliJ IDEA.
  User: Mi-Shit
  Date: 2018/11/6
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
    <script type="text/css" src="${pageContext.request.contextPath }/js/index.js"></script>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<%--头部--%>
<jsp:include page="head.jsp"/>

<c:forEach items="${FLOWER_LIST}" var="flower_list">
<div class="col-xs-3"><a href="/pages/view/User/buyFlowerById?flowerId=${flower_list.flowerId}" class="info">
    <img src = "${pageContext.request.contextPath}/${flower_list.flowerImg}">
    <h5>${flower_list.flowerName}</h5>
    <p>
        <span>￥</span>${flower_list.flowerPrice}
    </p>
    <input type="hidden" value="${flower_list.flowerId}">
</a></div>
<c:if test="${status.count % 4 == 0}">
<tr></tr>
    </c:if>
</c:forEach>

<%--底部--%>

<%--<jsp:include page="footer.jsp"/>--%>

<div class="footer" style="background-color: #f6f6f6; margin-top:20px; padding-top: 30px">
    <div class="wrap">
        <div class="row" style=" margin-left: 30px;margin-right: 30px;color: #1b1b1b; border-bottom: 2px solid grey;padding-bottom: 30px">
            <div class="col-xs-2">
                   <span>
                   <i class="glyphicon glyphicon-lock" style="font-size:24px"></i>
                       <a href="#" target="_blank">销量领先</a>
                   </span>
            </div>

            <div class="col-xs-2">
                    <span>
                   <i class="glyphicon glyphicon-registration-mark" style="font-size:24px;"></i>
                       <a href="#" target="_blank">百万客户信赖</a>
                   </span>
            </div>
            <div class="col-xs-2">
                   <span>
                   <i class="glyphicon glyphicon-camera" style="font-size:24px"></i>
                       <a href="#" target="_blank">订单实拍</a>
                   </span>
            </div>
            <div class="col-xs-2">
                     <span>
                   <i class="glyphicon glyphicon-usd" style="font-size:24px"></i>
                       <a href="#" target="_blank">低价保障</a>
                   </span>
            </div>
            <div class="col-xs-2">
                   <span>
                   <i class="glyphicon glyphicon-time" style="font-size:24px"></i>
                       <a href="#" target="_blank">3小时配送</a>
                   </span>
            </div>
            <div class="col-xs-2">
                    <span>
                   <i class="glyphicon glyphicon-hand-up" style="font-size:24px"></i>
                       <a href="#" target="_blank">时尚原创花艺</a>
                   </span>
            </div>
        </div>
    </div>

    <div class="bootom">
        <div class="row"  style=" margin-left: 30px; color:dimgrey;margin-right: 30px; margin-top: 20px">
            <div class="col-xs-2">
                <h4>售后服务</h4>
                <p>配送说明</p>
                <p>配送范围</p>
                <p>订单查询</p>
                <p>取消订单</p>
                <p>补交货款</p>
            </div>
            <div class="col-xs-2">
                <h4>服务条款</h4>
                <p>关于我们</p>
                <p>隐私条款</p>
                <p>安全条款</p>
                <p>支付说明</p>
            </div>
            <div class="col-xs-2">
                <h4>热门咨询</h4>
                <p>好花网购物流程</p>
                <p>能配送哪些城市</p>
                <p>售后服务是怎么样的</p>
                <p>提前多久预定鲜花</p>
            </div>
            <div class="col-xs-2">
                <h4>支付方式</h4>
                <p>支付宝/微信支付</p>
                <p>实体店支付</p>
                <p>优惠券使用</p>
                <p>礼品券支付</p>
            </div>
            <div class="col-xs-2">
                <h4>联系我们</h4>
                <p>全国热线：6620-5582</p>
                <p><button>在线客服</button></p>
                <p>客服工作时间;8:30-21:00</p>
                <p>售后服务电话：13378216662</p>
            </div>
            <div class="col-xs-2">
                <p><img src="${pageContext.request.contextPath}/images/erweima.png" width="120" height="120"> </p>
                <p>公众号</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
