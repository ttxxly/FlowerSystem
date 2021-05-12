<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>鲜花网--给你足不出户的浪漫</title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
    <script type="text/css" src="${pageContext.request.contextPath} /js/index.js"></script>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<style type="text/css">
    /* 搜索框部分 */
    .input-group{
        top: 80px;
        left: 120px;

    }
    .input-group .form-control{

        width: 250px;
        height: 40px;
        margin-right: 8px;
        margin-left: 60px;

    }
    .input-group .btn{
        height: 40px;
        left: -8px;
    }
    .sort{
        position: absolute;
        top: 90px;
        left: 40px;
    }
    .sort input{
        width: 50px;
    }

    .navbar .nav > li .dropdown-menu {
        margin: 0;
    }
    .navbar .nav > li:hover .dropdown-menu {
        display: block;
    }

    .navbar{
        background: #f6f6f7;
        width: 800px;
        height: 50px;
        position: relative;
        padding-bottom: 30px;
        top: 100px;
        left: -50px;


    }
    .navbar .nav li{
        margin-right: 30px;
    }
    .navbar .navbar-inner{
        position: absolute;
        left: 30px;
        top: 5px;
    }
    .navbar li a{
        color: #555555;
    }
   /* .navbar li.active a{
        background: #e7e7e7;
        color: #555555;
        font-weight: bold
    }*/


    .navbar  li a:hover{
        background:#e7e7e7;
    }
    .navbar .nav .dropdown  .dropdown-menu li{
        margin-bottom: 10px;
    }


</style>
<body>
<div class="contain">
    <div class="header">
        <div class="header-banner clearfix">
            <div class="header-left">
                <a href="${pageContext.request.contextPath}/" class="info">
                    <img src="${pageContext.request.contextPath}/images/timg4.jpg" height="94" width="216">
                </a>
            </div>
            <div class="header-right">
                <div class="reg-login">
                    <a href="/pages/login/login.jsp">你好，请登录</a>
                    <span>|</span>
                    <a href="/pages/view/register.jsp">注册</a>
                    <span></span>
                    <a href="/pages/login/Rlogin.jsp">管理员模式</a>
                </div>
                <form action="/pages/view/userSelectFlower" method="post">
                    <div class="input-group col-md-3">
                        <input type="text" class="form-control" placeholder="请输入搜索内容"  name="flowerName" id="flowerName" >
                        <span class="input-group-btn">
                        <button type="submit" class="btn btn-info btn-search" style="position: relative;right: -60px" >查找</button>
                    </span>
                    </div>
                    <div class="sort">
                        ￥ <input type="number" id="firstMoney" name="firstMoney" min="0"  width="50px">
                        -
                        <input type="number" id="lastMoney" name="lastMoney" min="0" >
                    </div>
                </form>
            <!-- 头部右边结束 -->
            <!-- 导航条 -->
            <div class="navbar">
                <div class="navbar-inner">
                    <ul class="nav nav-pills">
                        <li><a href="/pages/view/User/selectFlowerByType?flowerType=爱情鲜花">爱情鲜花</a></li>
                        <li>
                            <a href="/pages/view/User/selectFlowerByType?flowerType=生日鲜花">生日鲜花</a>
                        </li>
                        <li><a href="/pages/view/User/selectFlowerByType?flowerType=友情鲜花">挚友鲜花</a></li>
                        <li><a href="/pages/view/User/selectFlowerByType?flowerType=婚庆鲜花">婚庆鲜花</a></li>
                        <li>
                            <a href="/pages/view/User/selectFlowerByType?flowerType=祝福鲜花">祝福鲜花</a>
                        </li>
                        <li><a href="/pages/view/User/selectFlowerByType?flowerType=商务鲜花">商务鲜花</a></li>
                    </ul>
                </div>
            </div>


            <div class="phone">
                <a href="#">
                    <span class="glyphicon glyphicon-user"></span><span>123456</span></a>
            </div>
        </div>
    </div>
</div>

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

<%--底部--%>
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
                <p>公众号:xxxx</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>
