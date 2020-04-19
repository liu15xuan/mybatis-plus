<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link href="/static/css/font-awesome.css" rel="stylesheet">
    <link href="/static/css/style.css" rel='stylesheet' type='text/css' />
    <link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="/static/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="/static/img/favicon.ico">
</head>
<body>
<div class="page login-page">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <h1>4s店客户服务管理系统</h1>
                <!-- Form Panel    -->
                <div class="col-lg-6 bg-white">
                    <div class="form d-flex align-items-center">
                        <div class="content">
                            <div class="w3ls-login box box--big">
                                <!-- form starts here -->
                                <form id="loginFormId" action="/admin/login" method="post" class="form-validate"
                                      AUTOCOMPLETE="OFF">
                                    <input name="role" value="1" hidden>
                                    <div class="agile-field-txt">
                                        <label>
                                            <i class="fa fa-user" aria-hidden="true"></i> 用户名： </label>
                                        <input onchange="hideMsg()" onclick="hideMsg()" id="login-username" type="text" name="username" placeholder="请输入您的用户名 " required="" />
                                    </div>
                                    <div class="agile-field-txt">
                                        <label>
                                            <i class="fa fa-envelope" aria-hidden="true"></i> 密码： </label>
                                        <input onchange="hideMsg()" onclick="hideMsg()" onfocus="this.type='password'" id="login-password" type="password" name="password" placeholder="请输入您的密码 " required="" id="myInput" />

                                    </div>
                                    <!-- script for show password -->
                                    <script>
                                        function myFunction() {
                                            var x = document.getElementById("myInput");
                                            if (x.type === "password") {
                                                x.type = "text";
                                            } else {
                                                x.type = "password";
                                            }
                                        }
                                    </script>
                                    <!-- //script ends here -->
                                    <div id="msgId">
                                        <c:if test="${requestScope.get('msg') != null}">
                                            <a style="color:red" class="forgot-pass"><%=request.getAttribute("msg")%>
                                            </a>
                                        </c:if>
                                    </div>
                                    <div class="w3ls-bot">
                                        <div class="form-end">
                                            <input id="regidter" name="registerSubmit" type="submit" value="登录">
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JavaScript files-->
<script src="/static/vendor/jquery/jquery.min.js"></script>
<script src="/static/vendor/popper.js/umd/popper.min.js"></script>
<script src="/static/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="/static/vendor/chart.js/Chart.min.js"></script>
<script src="/static/vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Main File-->
<script src="/static/js/front.js"></script>
<script>
    function hideMsg() {
        $("#msgId").hide();
    }

</script>
</body>
</html>