<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/10/28
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理系统</title>
    <link rel="stylesheet" href="http://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <style>
        body {
            background: url("../../images/adminbg.jpg");
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/pages/admin/index.jsp">后台管理系统</a>
                </div>
            </nav>
            <br/>
            <br/>
            <br/>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="col-md-3" style="float: left;margin-left: -10%">
                        <div class="list-group" style="float: left">
                            <a target="fname" href="System/User/index.jsp" class="list-group-item"><span
                                    class="glyphicon glyphicon-home"></span>用户管理</a><br>
                            <a target="fname" href="Flower/Product/index.jsp" class="list-group-item"><span
                                    class="glyphicon glyphicon-file"></span>产品管理</a><br>
                            <a target="fname" href="Flower/Order/index.jsp" class="list-group-item"><span
                                    class="glyphicon glyphicon-file"></span>订单管理</a><br>
                        </div>
                    </div>
                    <div class="col-md-8 column" style="width:75%;">
                        <iframe name="fname" frameborder="false" style="margin-left:-20%;" width="145%" height="540px">
                        </iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
