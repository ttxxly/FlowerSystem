<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>花花网</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/jquery.min.js"/>

	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/js/cdn/bootstrap.min.js"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/details.css">
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<script>
		function sum(obj){
		    var orderNumber = Number($("#orderNumber").val());
		    var flowerPrice = Number($("#flowerPrice").val());
		    var money = orderNumber * flowerPrice;
		    orderPrice.value= money
		}
	</script>
	<script>
		function buyFlower() {
			if(confirm("请核实地址与收件人信息！")){
			    var data = $("#form_data").serialize();
			    $.ajax({
					url:"/pages/view/details/buyFlower",
					type:"post",
                    async: false,
					data:data,
					success:function (data) {
						if (data == "OK"){
                            alert("购买成功");
							history.back()
						} if (data =="FAIL"){
						    alert("购买失败");
						    window.location.reload();
						}if(data == "number"){
						    alert("购买失败，库存不足！")
                            window.location.reload();
						}if(data == "money"){
						    alert("余额不足，请充值！")
							window.location.reload();
						}
                    }
				})
                return true;
			}else{
			    return false;
			}
        }
	</script>
</head>
<body>
	<div class="container">
		<!-- 标题栏 -->
		<div class="breadcrumbs">
			<a href="/pages/view/User/list">首页</a>
			>
			<a href="/pages/view/User/list">${Flower.flowerType}</a>
			>
		</div>
		<!-- 商品 -->
		<div class="product-wrapper">
			<div class="product-left">
				<img src="${pageContext.request.contextPath}/${Flower.flowerImg}" width="460" height="510">
			</div>
			<div class="product-right">
				<div class="title">
					<h3 class="product-title">${Flower.flowerName}</h3>
					<p class="product-subtitle">热卖之作，惊艳之选！</p>
				</div>
				<div class="attribute">
					<dl>
						<dt>类别：</dt>
						<dd>${Flower.flowerType}</dd>
					</dl>
					<dl>
						<dt>材料：</dt>
						<dd>高档礼盒装鲜花：${Flower.flowerName}</dd>
					</dl>
					<dl>
						<dt>包装：</dt>
						<dd>雾面纸内衬，包装纸圆形外包，蝴蝶结系扎</dd>
					</dl>
					<dl>
						<dt>附送：</dt>
						<dd>免费赠送精美贺卡！</dd>
					</dl>
					<dl>
						<dt>配送：</dt>
						<dd>限送100多个主要城市的市区及近郊：北京,上海,深圳,广州,成都,武汉,南京,杭州,苏州,天津,西安,长沙,东莞,厦门,佛山,沈阳,合肥,重庆,大连,郑州,……</dd>
					</dl>

				</div>
				<div class="price-wrap flower-sku-box">

				</div>
				<div class="price" id="ajax_pricebox" style="border: none;">
					<div class="price-sell">花花价：
						<strong>
							<em class="price-sign">￥</em>
							<em class="price-num">${Flower.flowerPrice}</em>
						</strong>
					</div>
				</div>
				<div class="btn">
					<div class="btn-buy">
						<a href="/pages/view/details/buy?flowerId=${Flower.flowerId}"><img src="${pageContext.request.contextPath}/images/shopcar2.png">立即购买</a>


						<button type="button" class="btn btn-info"
								data-toggle="modal" data-target="#buyFlowerModal">购买</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 模态框示例（Modal） -->
		<form method="post" action="##" class="form-horizontal"
			  role="form" id="form_data" style="margin: 20px;"
				onsubmit="return buyFlower()">

			<div class="modal fade" id="buyFlowerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								&times;
							</button>
							<h4 class="modal-title" id="myModalLabel">
								购买订单
							</h4>
						</div>
						<div class="modal-body">
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<label for="flowerName" class="col-sm-3 control-label">花名</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="flowerName" readonly="readonly"
											   name="flowerName" value="${Flower.flowerName}">
									</div>
								</div>

								<div class="form-group">
									<label for="flowerType" class="col-sm-3 control-label">类型</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="flowerType"
											   value="${Flower.flowerType}" id="flowerType" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label for="flowerPrice" class="col-sm-3 control-label">单价（￥）</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="flowerPrice"
											   value="${Flower.flowerPrice}" id="flowerPrice" readonly="readonly">
									</div>
								</div>

								<div class="form-group">
									<label for="flowerNumber" class="col-sm-3 control-label">库存</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="flowerNumber"
											   value="${Flower.flowerNumber}" id="flowerNumber" readonly="readonly">
									</div>
								</div>

								<div class="form-group">
									<label for="orderNumber" class="col-sm-3 control-label">购买数量</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="orderNumber"
											   value="" id="orderNumber"
											   oninput="if(value>${Flower.flowerNumber})value=${Flower.flowerNumber}"
											   onkeyup="sum(this)" required="required">
									</div>
								</div>

								<div class="form-group">
									<label for="orderAddress" class="col-sm-3 control-label">地址</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="orderAddress"
											   id="orderAddress" required="required">
									</div>
								</div>

								<div class="form-group">
									<label for="orderUser" class="col-sm-3 control-label">收件人</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="orderUser"
											   id="orderUser" required="required">
									</div>
								</div>

								<div class="form-group">
									<label for="orderPrice" class="col-sm-3 control-label">总价（￥）</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" name="orderPrice" readonly="readonly"
											   id="orderPrice">
									</div>
								</div>

							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭
							</button>
							<button type="submit" class="btn btn-primary">
								购买
							</button><span id="tip"> </span>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			</div>
		</form>

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