<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie6"> <![endif]-->
<!--[if IE 7 ]> <html class="ie7"> <![endif]-->
<!--[if IE 8 ]> <html class="ie8"> <![endif]-->
<!--[if IE 9 ]> <html class="ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en" class=""><!--<![endif]-->
<head>
    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>注册</title>

    <!-- Library - Bootstrap v3.3.5 -->
    <link rel="stylesheet" type="text/css" href="/static/u/libraries/lib.css">

    <!-- Custom - Theme CSS -->
    <link rel="stylesheet" type="text/css" href="/static/u/style.css">
<%--    <link rel="stylesheet" type="text/css" href="/static/u/css/plugins.css">--%>
    <link rel="stylesheet" type="text/css" href="/static/u/css/navigation-menu.css">
    <link rel="stylesheet" type="text/css" href="/static/u/css/shortcode.css">

    <!--[if lt IE 9]>
    <script src="/static/u/js/html5/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        #formId input {
            height: 40px;
        }
    </style>

</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
<div class="main-container">
    <!-- Loader -->
<%--    <div id="site-loader" class="load-complete">--%>
<%--        <div class="loader">--%>
<%--            <div class="loader-inner ball-clip-rotate">--%>
<%--                <div></div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div><!-- Loader /- -->--%>

    <main>

        <!-- Page Banner -->
        <div class="container-fluid no-padding page-banner">
            <div class="padding-90"></div>
            <!-- Container -->
            <div class="container">
                <h3>汽车维护平台</h3>
                <ol class="breadcrumb">
                    <li><a href="/index">首页</a></li>
                    <li class="active">注册</li>
                </ol>
            </div><!-- Container /- -->
            <div class="padding-100"></div>
        </div><!-- Page Banner /- -->
        <!-- Welcome Section -->
        <div class="container-fluid no-padding welcome-section-2">
            <!-- Container -->
            <div class="container">

                <p class="padding-40" style="text-align: center">
                    &nbsp;
                    <span id="msgId" style="color: red"><c:out value="${requestScope.get('msg')}"></c:out></span>
                </p>
            </div>
            <div class="welcome-content-box">
                <div class="row">
                    <div class=col-md-3""></div>
                    <div class="col-md-6 welcom-box col-md-offset-3">
                        <form id="formId" action="/register" autocomplete="off" method="post"
                              onsubmit="return register();">
                            <div class="form-group">
                                <input class="form-control" name="username" required data-toggle=""
                                       placeholder="账号"/>
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="nickname" required placeholder="姓名"/>
                            </div>
                            <div class="form-group">
                                <input class="form-control" autocomplete="off" type="text"
                                       onfocus="this.type='password'" name="password" required placeholder="密码"/>
                            </div>
                            <%--                                <div class="form-group">--%>
                            <%--                                    <div class="col-md-6 col-sm-12 col-xs-12 no-left-padding">--%>
                            <%--                                        <a>12312</a>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <div class="padding-20"></div>
                            <div class="form-group">
                                <button type="submit">注册</button>
                            </div>
                            <div style="float: right">
                                <p>已有账号，去<span style="cursor: pointer; color: #2b90d9" onclick="toLogin()">登录</span></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div><!-- Container /- -->
</div><!-- Welcome Section /- -->

</main>


</div>

<!-- JQuery v1.12.4 -->
<script src="/static/u/js/jquery-1.12.4.min.js"></script>

<!-- Library - Js -->
<script src="/static/u/libraries/lib.js"></script>

<!-- Library - Theme JS -->
<script src="/static/u/js/functions.js"></script>
<script>
    function register() {
        $("#formId").valid();
    }

    function toLogin() {
        window.location.href = '/login';
    }

    $(function () {
        $("#formId input").focus(function () {
            $("#msgId").hide();
        })
    })
</script>
</body>
</html>

