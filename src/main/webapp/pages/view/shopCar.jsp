<%@ page import="com.gdcp.bishe.bean.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="index" value="1"/>
<c:set var="index_s" value="0"/>
<html>
<head>
    <title>购物车-鲜花网</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shopCar.css">
    <link rel="icon" href="/favicon.ico" mce_href="/favicon.ico" type="image/x-icon">
    <script>
        function deleteCart(flowerId) {
            if(confirm("确定移除该商品吗？"))
                $.post("/pages/view/shopCart/delete",{"flowerId":flowerId},function (data) {
                    if (data =="OK"){
                        alert("移除成功");
                        window.location.reload();
                    } if (data =="FAIL"){
                        alert("移除失败");
                        window.location.reload();
                    }
                })
        }
        
        function cs() {
            var ch = document.getElementsByName("flower") //通过name获取checkbox
            var sum = 0;
            for (var i =0;i<ch.length;i++){
                if (ch[i].checked==true){
                    sum += parseInt(ch[i].value); //求和
                }
            }
            $("#totalMoney").val(sum);
        }

        function userBuyFlower(){
            var ch = document.getElementsByName("flower") //通过name获取checkbox
            var orders = new Array();
            var a = 0;
            for (var i =0;i<ch.length;i++){
                if (ch[i].checked==true){
                    var b = i+1;
                    var order={}
                    if (document.getElementById("flowerName"+b).value!=null && document.getElementById("flowerName"+b).value!='' && document.getElementById("flowerName"+b).value!=undefined &&
                        document.getElementById("flowerNumber"+b).value!=null && document.getElementById("flowerNumber"+b).value!=0 && document.getElementById("flowerNumber"+b).value!=undefined &&
                        document.getElementById("orderAddress").value!=null && document.getElementById("orderAddress").value!='' && document.getElementById("orderAddress").value!=undefined &&
                        document.getElementById("money"+b).value!=null && document.getElementById("money"+b).value!=0 && document.getElementById("money"+b).value!=undefined &&
                        document.getElementById("orderUser").value!=null && document.getElementById("orderUser").value!='' && document.getElementById("orderUser").value!=undefined &&
                        document.getElementById("totalMoney").value!=null && document.getElementById("totalMoney").value!=0 && document.getElementById("totalMoney").value!=undefined &&
                        document.getElementById("orderPhone").value!=null && document.getElementById("orderPhone").value!='' && document.getElementById("orderPhone").value!=undefined
                ) {
                            order["flowerId"]=document.getElementById("flowerId"+b).value;
                            order["flowerName"]=document.getElementById("flowerName"+b).value;
                            order["orderNumber"]=document.getElementById("flowerNumber"+b).value;
                            order["orderAddress"]=document.getElementById("orderAddress").value;
                            order["orderPrice"]=document.getElementById("money"+b).value;
                            order["orderUser"]=document.getElementById("orderUser").value;
                            order["totalMoney"]=document.getElementById("totalMoney").value;
                            order["orderPhone"]=document.getElementById("orderPhone").value;
                            orders[a]=order
                            a++;
                    }
                }
            }if(document.getElementById("totalMoney").value!=undefined){
            $.ajax({
                url:"/pages/view/shopCart/BuyFlower",
                type:"post",
                async: false,
                contentType :'application/json',
                data:JSON.stringify(orders),
                success:function(data){
                    if (data =="OK") {
                        alert("购买成功")
                        if (window.confirm("立即跳转到订单界面？")) {
                            window.location.href = '/pages/view/order/find';
                            return true;
                        } else {
                            history.back();
                            return false;
                        }
                    }if(data == "no_Flower"){
                        alert("找不到此商品");
                        window.location.href = '/pages/view/User/list';
                    }if (data == "flowerNumber_Not_Enough") {
                        alert("购买失败，库存不足");
                        window.location.href = '/pages/view/User/list';
                    }if(data == "userMoney_Not_Enough"){
                        alert("用户金额不足,请充值");
                        window.location.reload();
                    }if(data =="FAIL"){
                        alert("购买失败");
                    }if(data == "money"){
                        alert("用户金额不足，就充值");
                    }
                }
            })
          }
        }

    </script>
</head>
<style>
    .cart-panel .order-list li.num  .input-num{
      position: relative;
    }
    .cart-panel .order-list li.num  .input-num button{
        width: 30px;
        height: 20px;
    }
    .cart-panel .order-list li.num  .input-num .button1{
       position: absolute;
        top: 5px;
        left: 10px;
    }
    .cart-panel .order-list li.num  .input-num .p1{
        position: absolute;
        top: -36px;
        left: 20px;
        font-size: 28px;
    }
    .cart-panel .order-list li.num  .input-num .button2{
        position: absolute;
        top: 5px;
        left: 100px;
    }
    .cart-panel .order-list li.num  .input-num .p2{
        position: absolute;
        top: -34px;
        left: 105px;
        font-size: 28px;
    }
</style>
<body>
<%--页面头部开始--%>
<div class="header">
    <div class="header-banner clearfix">
        <div class="header-left">
            <img src="${pageContext.request.contextPath}/images/timg4.jpg" height="94" width="216">
        </div>
        <div class="header-right">
            <div class="reg-login">
                <%
                    User user = (User) session.getAttribute("USER_SESSION");
                    if (user != null){%>
                <a href="#"> Hello! <span></span>${USER_SESSION.userName}</a>
                <span></span>
                <a href>账号余额：${USER_SESSION.userMoney}</a>
                <span></span>
                <a href="/pages/view/order/find">订单查询</a>
                <span></span>
                <a href="${pageContext.request.contextPath}/pages/view/money.jsp" class="car"><b></b>充值</a>
                <span></span>
                <a href="/pages/view/shopCart/list" class="car"><b></b>购物车<em><span class="glyphicon glyphicon-shopping-cart"></span></em></a>
                <span></span>
                <a href="/login/logout">退出</a>
                <span></span><span></span>
                <%}else{%>
                <a href="/pages/login/login.jsp">你好，请登录</a>
                <span>|</span>
                <a href="/pages/view/register.jsp">注册</a>
                <span></span>
                <a href="/pages/login/Rlogin.jsp">管理员模式</a>
                <%}%>
            </div>
        </div>
        <!-- 头部右边结束 -->
        <div class="phone">
            <a href="#">
                <span class="glyphicon glyphicon-user"></span><span>123456</span></a>
        </div>
    </div>
</div>
<%--页面头部结束--%>
<Form action="##" id="ShopCartBuyForm">
<%--订单列表开始--%>
<div class="container">
    <div class="cart-panel">
        <%--标题--%>
        <div class="hd">
            <ul class="order-title">
                <li class="selecter">
                    <input type="checkbox" name="allCheckBox" id="allCheckBox" value="0"
                           onchange="selectAll();cs()">
                </li>
                <li class="product">商品名称</li>
                <li class="order-price">订购价</li>
                <li class="num">数量</li>
                <li class="save">库存</li>
                <li class="prie">价格</li>
                <li class="operate">操作</li>
            </ul>
        </div>

        <%--列表--%>
        <div class="bd">
            <c:forEach items="${flowerList}" var="flowerList">

                <ul class="order-list" id="">
                        <%-- 复选框 --%>
                    <li class="selecter">
                        <input name="flower" type="checkbox" id="checkbox${index}" value="0"
                               onchange="checkMoney${index}();cs()">
                    </li>
                            <%--图片--%>
                    <li class="img-box">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/${flowerList.flowerImg}" height="56" width="50">
                        </a>
                    </li>
                            <%--花名--%>
                    <li class="product">
                        <a href="/pages/view/User/buyFlowerById?flowerId=${flowerList.flowerId}" target="_blank">
                            <input type="hidden" name="flowerId" id="flowerId${index}" value="${flowerList.flowerId}">
                            <input type="hidden" name="flowerName" id="flowerName${index}" value="${flowerList.flowerName}">
                            <span class="product-title" id="flowerName">${flowerList.flowerName}</span>
                        </a>
                    </li>
                            <%--花朵单价--%>
                    <li class="order-price">
                        <span class="price-sign">&yen;</span>
                        <span class="price-num" >${flowerList.flowerPrice}</span>
                        <input type="hidden" name="flowerPrice" id="flowerPrice${index}"
                               value="${flowerList.flowerPrice}" >
                    </li>
                            <%--购买数量--%>
                    <li class="num">
                        <div class="input-num">
                            <button id="Fu${index}"  onclick="Fu_a${index}();checkMoney${index}();cs()" class="button1"></button>
                                 <span class="p1">-</span>
                            <input type="text" class="form-control input-sm"
                                   value = "1" name="orderNumber" id="flowerNumber${index}"
                                   oninput="if(value>${flowerList.flowerNumber})value=${flowerList.flowerNumber};
                                   if(value<0)value=0"
                                    onchange="checkMoney${index}();cs()"
                                   >
                            <button id="ZJia${index}"  onclick="Z_Jia${index}();checkMoney${index}();cs()" class="button2" ></button>
                            <span class="p2">+</span>
                        </div>
                    </li>
                            <%--库存--%>
                    <li class="save">
                        <span class="price-num">${flowerList.flowerNumber}</span>
                    </li>
                            <%--价格--%>
                    <li class="price">
                        <input type="text" name="orderPrice" id="money${index}"
                               value="${flowerList.flowerPrice}" readonly="readonly">
                    </li>
                            <%--删除--%>
                    <li class="operate">
                        <a href="#" class="delBtn" onclick="deleteCart(${flowerList.flowerId})">删除</a>
                    </li>
                </ul>
                <c:if test="${index_s<index}">
                    <script>
                        function checkMoney${index}() {
                            var flowerNumber${index} = $("#flowerNumber${index}").val();
                            var flowerPrice${index} = $("#flowerPrice${index}").val();
                            var money${index} = parseInt(flowerNumber${index})* parseInt(flowerPrice${index})
                            $("#money${index}").val(money${index});
                            $("#checkbox${index}").val(money${index});
                        }

                        function Fu_a${index}() {

                            var  flowerNumber = $("#flowerNumber${index}").val();
                            if(flowerNumber>0){
                                var ab = (parseInt(flowerNumber) - 1);
                                $("#flowerNumber${index}").val(ab);
                            }
                        }

                        function Z_Jia${index}() {

                            var  flowerNumber = $("#flowerNumber${index}").val();
                            if(flowerNumber<${flowerList.flowerNumber}){
                                var ab = (parseInt(flowerNumber) +1);
                                $("#flowerNumber${index}").val(ab);
                            }
                        }

                        function selectAll() {
                            var ch2 = document.getElementsByName("flower") //通过name获取checkbox
                            var cx = document.getElementsByName("allCheckBox");
                            var checkNot = cx[0].checked;
                            if (checkNot){
                                for (var i =0;i<ch2.length;i++){

                                    ch2[i].click();

                                }
                            }else {
                                for (var i = 0; i < ch2.length; i++) {
                                    ch2[i].checked = false;
                                }
                            }
                        }

                    </script>
                </c:if>
                <c:set var="index" value="${index+1}"/>
                <c:set var="index_s" value="#{index_s+1}"/>
            </c:forEach>
        </div>
    </div>

    <div class="set-bar">
        <div class="set-info">
            <%--总金额--%>
            <a class="back" href='/pages/view/User/list' style="width:90px;"><span class="ico ico-back"></span>⬅继续挑选</a>
            <div class="set-stat">
                应付金额:
                <div class="price">
                    <span class="price-sign">&yen;</span>
                    <input type="text" class="price-num" id="totalMoney"
                           name="totalMoney"
                           readonly="readonly" value="" required="required" >
                </div>
            </div>
        </div>
        <button class="btn btn-primary" type="button"
                data-toggle="modal" data-target="#buyFlowerModal">去结算</button>
        <div class="modal fade" id="buyFlowerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            请输入收件人以及地址
                        </h4>
                    </div>
                    <div class="modal-body">
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
                                           id="orderUser"
                                           required="required">
                                </div>
                            </div>
                        <div class="form-group">
                            <label for="orderPhone" class="col-sm-3 control-label">联系电话</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="orderPhone"
                                       id="orderPhone"
                                       required="required">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary" onclick="userBuyFlower()">
                            购买
                        </button><span id="tip"> </span>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
    </div>
</div>
<%--订单列表结束--%>
</Form>
</body>
</html>
