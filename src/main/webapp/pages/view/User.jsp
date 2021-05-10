
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8"%>
<%
    response.setHeader("Pragma", "No-Cache");
    response.setHeader("Cache-Control", "No-Cache");
    response.setDateHeader("Expires", 0);
%>
<html>
<head>
    <title>欢迎来到鲜花网~</title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/popper.min.js"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <script type="text/css" src="${pageContext.request.contextPath}/js/index.js"></script>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>

<body>
<%--头部--%>
<jsp:include page="head.jsp"/>
<!--轮播图部分-->
<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="${pageContext.request.contextPath}/images/swipers1.jpg" alt="First slide">
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/images/swipers2.jpg" alt="Second slide">
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/images/swipers3.jpg" alt="Third slide">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!--中心专区部分 -->
<%--爱情鲜花--%>
<div class="center">
    <div class="left" id="loveFlower">
        <h3><a href="/pages/view/User/selectFlowerByType?flowerType=爱情鲜花">爱情鲜花</a><span>意爱的简约而不简单</span></h3>
        <div class="img">
            <img src="${pageContext.request.contextPath}/images/loves.jpg">
        </div>
        <div class="zhuangqu">
            <a href="/pages/view/User/selectFlowerByType?flowerType=爱情鲜花">
                <h5>爱情鲜花专区</h5>
                <p>进入专区</p>
            </a>
        </div>
    </div>
    <div class="right">
        <div class="container">
            <div class="row">
                <c:set var="love_count" value="0"></c:set>
                <c:forEach items="${flower_list}" var="flower_list">
                    <c:if test="${flower_list.flowerType == '爱情鲜花'}">
                        <c:if test="${love_count<8}">
                        <div class="col-xs-3 "><a href="/pages/view/User/buyFlowerById?flowerId=${flower_list.flowerId}" class="info">
                            <img src="${pageContext.request.contextPath}/${flower_list.flowerImg}" height="242" width="200">
                            <h5>${flower_list.flowerName}</h5>
                            <p>
                                <span>¥</span>${flower_list.flowerPrice}
                            </p>
                        </a></div>
                        <c:set var="love_count" value="${love_count+1}"></c:set>
                        </c:if>
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="more"><a href="#">查看更多</a></div>
    </div>

</div>
<%--生日鲜花--%>
<div class="center">
    <div class="left" id="birthdayFlower">
        <h3><a href="/pages/view/User/selectFlowerByType?flowerType=生日鲜花">生日鲜花</a><span>意爱的简约而不简单</span></h3>
        <div class="img">
            <img src="${pageContext.request.contextPath}/images/loves.jpg">
        </div>
        <div class="zhuangqu">
            <a href="/pages/view/User/selectFlowerByType?flowerType=生日鲜花">
                <h5>生日鲜花专区</h5>
                <p>进入专区</p>
            </a>
        </div>
    </div>
    <div class="right">
        <div class="container">
            <div class="row">
                <c:set var="brithday_count" value="0"></c:set>
                <c:forEach items="${flower_list}" var="flower_list" step="1">
                    <c:if test="${flower_list.flowerType == '生日鲜花'}">
                        <c:if test="${brithday_count <8}">
                        <div class="col-xs-3 "><a href="/pages/view/User/buyFlowerById?flowerId=${flower_list.flowerId}" class="info">
                            <img src="${pageContext.request.contextPath}/${flower_list.flowerImg}" height="242" width="200">
                            <h5>${flower_list.flowerName}</h5>
                            <p>
                                <span>¥</span>${flower_list.flowerPrice}
                            </p>
                        </a></div>
                        <c:set var="brithday_count" value="${brithday_count+1}"></c:set>
                        </c:if>
                    </c:if>
                </c:forEach>
            </div>
        </div>
        <div class="more"><a href="#">查看更多</a></div>
    </div>

</div>
<%--友情鲜花--%>
<div class="center">
    <div class="left" id="friendFlower">
        <h3><a href="/pages/view/User/selectFlowerByType?flowerType=友情鲜花">挚友鲜花</a><span>意爱的简约而不简单</span></h3>
        <div class="img">
            <img src="${pageContext.request.contextPath}/images/loves.jpg">
        </div>
        <div class="zhuangqu">
            <a href="/pages/view/User/selectFlowerByType?flowerType=友情鲜花">
                <h5>挚友鲜花专区</h5>
                <p>进入专区</p>
            </a>
        </div>
    </div>
    <div class="right">
        <div class="container">
            <div class="row">

                <c:set var="friend_count" value="0"></c:set>
                <c:forEach items="${flower_list}" var="flower_list" step="1">
                    <c:if test="${flower_list.flowerType == '友情鲜花'}">
                        <c:if test="${friend_count <8}">
                            <div class="col-xs-3 "><a href="/pages/view/User/buyFlowerById?flowerId=${flower_list.flowerId}" class="info">
                                <img src="${pageContext.request.contextPath}/${flower_list.flowerImg}" height="242" width="200">
                                <h5>${flower_list.flowerName}</h5>
                                <p>
                                    <span>¥</span>${flower_list.flowerPrice}
                                </p>
                                <input type="hidden" value="${flower_list.flowerId}">
                            </a></div>
                            <c:set var="friend_count" value="${friend_count+1}"></c:set>
                        </c:if>
                    </c:if>
                </c:forEach>


            </div>
        </div>
        <div class="more"><a href="#">查看更多</a></div>
    </div>

</div>
<%--婚庆鲜花--%>
<div class="center">
    <div class="left" id="marryFlower">
        <h3><a href="/pages/view/User/selectFlowerByType?flowerType=婚庆鲜花">婚庆鲜花</a><span>意爱的简约而不简单</span></h3>
        <div class="img">
            <img src="${pageContext.request.contextPath}/images/loves.jpg">
        </div>
        <div class="zhuangqu">
            <a href="/pages/view/User/selectFlowerByType?flowerType=婚庆鲜花">
                <h5>婚庆鲜花专区</h5>
                <p>进入专区</p>
            </a>
        </div>
    </div>
    <div class="right">
        <div class="container">
            <div class="row">

                <c:set var="marry_count" value="0"></c:set>
                <c:forEach items="${flower_list}" var="flower_list" step="1">
                    <c:if test="${flower_list.flowerType == '婚庆鲜花'}">
                        <c:if test="${marry_count <8}">
                            <div class="col-xs-3 "><a href="/pages/view/User/buyFlowerById?flowerId=${flower_list.flowerId}" class="info">
                                <img src="${pageContext.request.contextPath}/${flower_list.flowerImg}" height="242" width="200">
                                <h5>${flower_list.flowerName}</h5>
                                <p>
                                    <span>¥</span>${flower_list.flowerPrice}
                                </p>
                            </a></div>
                            <c:set var="marry_count" value="${marry_count+1}"></c:set>
                        </c:if>
                    </c:if>
                </c:forEach>


            </div>
        </div>
        <div class="more"><a href="#">查看更多</a></div>
    </div>

</div>
<%--祝贺鲜花--%>
<div class="center">
    <div class="left" id="congratulateFlower">
        <h3><a href="/pages/view/User/selectFlowerByType?flowerType=祝贺鲜花">祝福鲜花</a><span>意爱的简约而不简单</span></h3>
        <div class="img">
            <img src="${pageContext.request.contextPath}/images/loves.jpg">
        </div>
        <div class="zhuangqu">
            <a href="/pages/view/User/selectFlowerByType?flowerType=祝贺鲜花">
                <h5>祝福鲜花专区</h5>
                <p>进入专区</p>
            </a>
        </div>
    </div>
    <div class="right">
        <div class="container">
            <div class="row">

                <c:set var="congratulate_count" value="0"></c:set>
                <c:forEach items="${flower_list}" var="flower_list" step="1">
                    <c:if test="${flower_list.flowerType == '祝贺鲜花'}">
                        <c:if test="${congratulate_count <8}">
                            <div class="col-xs-3 "><a href="/pages/view/User/buyFlowerById?flowerId=${flower_list.flowerId}" class="info">
                                <img src="${pageContext.request.contextPath}/${flower_list.flowerImg}" height="242" width="200">
                                <h5>${flower_list.flowerName}</h5>
                                <p>
                                    <span>¥</span>${flower_list.flowerPrice}
                                </p>
                            </a></div>
                            <c:set var="congratulate_count" value="${congratulate_count+1}"></c:set>
                        </c:if>
                    </c:if>
                </c:forEach>

            </div>
        </div>
        <div class="more"><a href="#">查看更多</a></div>
    </div>

</div>
<%--商务鲜花--%>
<div class="center">
    <div class="left" id="businessFlower">
        <h3><a href="/pages/view/User/selectFlowerByType?flowerType=商务鲜花">商务鲜花</a><span>意爱的简约而不简单</span></h3>
        <div class="img">
            <img src="${pageContext.request.contextPath}/images/loves.jpg">
        </div>
        <div class="zhuangqu">
            <a href="/pages/view/User/selectFlowerByType?flowerType=商务鲜花">
                <h5>商务鲜花专区</h5>
                <p>进入专区</p>
            </a>
        </div>
    </div>
    <div class="right">
        <div class="container">
            <div class="row">
                <c:set var="business_count" value="0"></c:set>
                <c:forEach items="${flower_list}" var="flower_list" step="1">
                    <c:if test="${flower_list.flowerType == '商务鲜花'}">
                        <c:if test="${business_count <8}">
                            <div class="col-xs-3 "><a href="/pages/view/User/buyFlowerById?flowerId=${flower_list.flowerId}" class="info">
                                <img src="${pageContext.request.contextPath}/${flower_list.flowerImg}" height="242" width="200">
                                <h5>${flower_list.flowerName}</h5>
                                <p>
                                    <span>¥</span>${flower_list.flowerPrice}
                                </p>
                            </a></div>
                            <c:set var="business_count" value="${business_count+1}"></c:set>
                        </c:if>
                    </c:if>
                </c:forEach>


            </div>
        </div>
        <div class="more"><a href="#">查看更多</a></div>
    </div>

</div>
<jsp:include page="footer.jsp"/>
</body>

</html>
