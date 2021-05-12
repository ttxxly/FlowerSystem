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
                <div class="navbar-header" style="float: right; margin-right: 30px;">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/pages/index/list"><font  style='font-size:16px;' color='red'><b>戳我，返回前台</b></font></a>
                </div>
            </nav>
            <br/>
            <br/>
            <br/>

                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <div class="col-md-3" style="float: left;margin-left: -10%">
                            <div class="list-group" style="float: left">
                                <a target="fname" href="Flower/Product/index.jsp" class="list-group-item"><span
                                        class="glyphicon glyphicon-file"></span> 花品管理</a><br>
                                <a target="fname" href="System/message/index.jsp" class="list-group-item"><span
                                        class="glyphicon glyphicon-home"></span >沟通管理</a><br>
                                <a target="fname" href="Flower/Order/index.jsp" class="list-group-item"><span
                                        class="glyphicon glyphicon-file"></span> 查看订单</a><br>
                            </div>
                        </div>
                        <div class="col-md-8 column" style="width:75%;color: #555;">
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
