<%@ page import="com.gdcp.bishe.bean.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>${Flower.flowerName}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/jquery.min.js"/>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/bootstrap.min.js"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/details.css">--%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <script>
        function reLogin(){
            alert("请先登录")
            window.location.href='${pageContext.request.contextPath}/pages/login/login.jsp';
        }
    </script>
    <script>
        function buyFlowerForm() {
            var data = $("#buyFlowerForm").serialize();
            $.ajax({
                url:"/pages/view/details/buyFlower",
                data:data,
                type:"POST",
                success:function(data){
                    if (data == "OK"){
                        alert("添加购物车成功");
                        if (window.confirm("立即跳转到购物车页面？")){
                            window.location.href='/pages/view/shopCart/list';
                            return true;
                        }else{
                            history.back();
                            return false;
                        }
                    }if (data=="FAIL"){
                        alert("添加购物车失败");
                        history.back();
                    }if (data == "IN"){
                        alert("购物车已存在该商品")
                    }
                }
            })
        }
    </script>
</head>

<style>
    div{
        display: block;
    }
    a{
        text-decoration:none;
    }
    .container{
        margin:  20px 100px;
    }
    .product-wrapper{
        border: 1px solid #ccc;
        height: 480px;
        width: 1100px;
    }
    .breadcrumbs{
        margin-bottom: 10px;
    }
    .product-wrapper .product-left{
        position: relative;
        float: left;
        margin: 38px 66px;
    }
    .product-wrapper .product-right{
        display: inline-block;
        width: 550px;
        margin-top: 50px;
        margin-left: 30px;
    }
    .product-wrapper .product-right .title{
        font-size: 16px;
        margin-bottom: 20px;
        padding-bottom: 20px;
        border-bottom: 1px solid #d9d9d9;
        /*line-height: 3;*/
        margin-right: 60px;
    }
    .product-wrapper .product-right .title .product-title {
        font-size: 18px;
        font-weight: bolder;
        margin: 0 0 20px 0;
        /*padding: 0;*/
        color: #4d4d4d;
    }
    .product-wrapper .product-right .title .product-subtitle {
        margin-top: 20px;
        color: #ff6a00;
    }
    p {
        display: block;
    }
    .product-wrapper .product-right .attribute dl > dt {
        float: left !important;
    }
    .product-wrapper .product-right .attribute dl > dd{
        margin-left: 60px;
    }
    dt {
        font-weight: bolder;
        display: block;
    }
    dt, dd {
        line-height: 4
    }
    .product-wrapper .product-right .attribute dl {
        font-size: 14px;
        margin: 12px 50px 12px 0;
    }
    .product-wrapper .product-right .attribute dl:after {
        clear: both;
    }
    .product-wrapper .product-right .attribute dl:before, .product-wrapper .product-right .attribute dl:after {
        content: " ";
        display: table;
    }
    .dl_bottom{
        border-bottom: 1px solid #dadada;
        padding-bottom: 20px;
    }

    .product-wrapper .product-right .price-sell {
        position: relative;
        display: inline-block;
        /*margin-bottom: 8px;*/
        margin-top: 50px;
        /*padding: 10px 16px 5px;*/
        cursor: pointer;

    }
    .product-wrapper .product-right .price-sell .price-num{
        color: #ff6a00;
        font-weight: 600;
        font-size: 26px;
    }


    .wrapper{
        margin: 0 auto;
        margin-top: 50px;
        text-align: center;
    }
    .wrapper .wrapper-text{
        margin-left: 20%;
        font-size: 24px;
        font-weight: 400;
        border: 2px solid #ccc;
        width: 150px;
        height: 50px;
        text-align: center;
        line-height: 50px;
    }


</style>
<body>
<jsp:include page="head.jsp"/>
<div class="container">
    <!-- 标题栏 -->
    <div class="breadcrumbs">
        <%
            User user = (User) session.getAttribute("USER_SESSION");
            if (user != null){%>
        <a href="/pages/view/User/list">首页</a>

        <%}else{%>
        <a href="/pages/index/list">首页</a>
        <%}%>

        >
        <a href="/pages/view/User/selectFlowerByType?flowerType=${Flower.flowerType}">${Flower.flowerType}</a>
        >
        <a href="#">${Flower.flowerName}</a>
    </div>
    <!-- 商品 -->
    <div class="product-wrapper">
        <div class="product-left">
            <img src="${pageContext.request.contextPath}/${Flower.flowerImg}" width="360" height="410">
        </div>
        <div class="product-right">
            <div class="title">
                <p class="product-title">${Flower.flowerName}</p>
                <p class="product-subtitle">热卖之作，惊艳之选！</p>
            </div>
            <div class="attribute">
                <dl>
                    <dt>类别：</dt>
                    <dd>${Flower.flowerType}</dd>
                </dl>
                <dl>
                    <dt>材料：</dt>
                    <dd>高档礼盒装鲜花（${Flower.flowerName}）</dd>
                </dl>
                <dl>
                    <dt>包装：</dt>
                    <dd>雾面纸内衬，包装纸圆形外包，蝴蝶结系扎</dd>
                </dl>
                <dl>
                    <dt>附送：</dt>
                    <dd>免费赠送精美贺卡！</dd>
                </dl>
                <dl class="dl_bottom">
                    <dt>配送：</dt>
                    <dd>限送100多个主要城市的市区及近郊：北京,上海,深圳,广州,成都,武汉,南京,杭州,苏州,天津,西安,长沙,东莞,厦门,佛山,沈阳,合肥,重庆,大连,郑州,……</dd>
                </dl>
            </div>
            <div class="price-sell">鲜花价：
                <strong>
                    <h1><em class="price-num">￥${Flower.flowerPrice}</em></h1>
                </strong>
            </div>
            <div class="btn">
                <%
                    if (user != null){
                %>
                <Form action="##" method="post" id="buyFlowerForm">
                    <input type="hidden" name="flowerId" id="flowerId"
                           value="${Flower.flowerId}">
                <button type="button" class="btn btn-info" onclick="buyFlowerForm()"
                        >添加购物车
                </button>
                </Form>
                <%
                    }else{
                %>
                <button type="button" class="btn btn-info"
                onclick="reLogin()">
                    购买
                </button>
                <%}%>

            </div>
        </div>
    </div>


    <!-- 商品详情 -->
    <div class="wrapper">
        <div class="wrapper-text">商品详情</div>
        <div class="Details">
            <ul>
                <li><img src="${pageContext.request.contextPath}/images/details1.jpg"></li>
                <li><img src="${pageContext.request.contextPath}/images/details2.jpg"></li>
                <li><img src="${pageContext.request.contextPath}/images/details3.jpg"></li>
                <li><img src="${pageContext.request.contextPath}/images/details4.jpg"></li>
                <li><img src="${pageContext.request.contextPath}/images/details5.jpg"></li>
                <li><img src="${pageContext.request.contextPath}/images/details6.jpg"></li>
                <li><img src="${pageContext.request.contextPath}/images/details7.jpg"></li>
            </ul>
        </div>
    </div>
</div>

</body>


</html>