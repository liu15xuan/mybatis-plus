<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    h3.div01 {
        color: #383434;
        font-size: 51px;
        margin: -22px;
    }
    .ow-navigation.navbar-default .navbar-nav > .active > a, .ow-navigation.navbar-default .navbar-nav > .active > a:focus, .ow-navigation.navbar-default .navbar-nav > .active > a:hover, .ow-navigation .nav.navbar-nav li:hover > a, .ow-navigation .nav.navbar-nav li:focus > a, .ow-navigation .nav.navbar-nav li a:hover, .ow-navigation .nav.navbar-nav li a:focus {
        background-color: transparent;
        color: #c03;
    }
    .ow-navigation.navbar-default .navbar-nav > li > a::before {
        background-color: #c03;
        content: "";
        height: 4px;
        width: 0;
        position: absolute;
        left: 0;
        top: -1px;
        opacity: 0;
        -webkit-transition: all 1s ease 0s;
        -moz-transition: all 1s ease 0s;
        -o-transition: all 1s ease 0s;
        transition: all 1s ease 0s;
    }
</style>
<header id="header" class="header-section container-fluid no-padding">
    <!-- Container -->
    <div class="container">
        <!-- Top Header -->
        <!-- Top Header -->

        <div class="top-header container-fluid no-padding">
            <div class="col-md-8 col-sm-12 col-xs-12 top-icons no-padding">
                <a><img src="/static/u/images/chat-ic.png"
                        alt="Chat"/><span>邮箱</span><b>${requestScope.get("settings").email}</b></a>
                <a><img src="/static/u/images/phone-ic.png"
                        alt="Phone"/><span>电话</span><b>${requestScope.get("settings").tel}</b></a>
                <c:if test="${sessionScope.get('user') == null}">
                    <ul>
                        <li><a href="/login" title="登录">登录</a></li>
                        <li><a href="/register" title="注册">注册</a></li>
                    </ul>
                </c:if>
                <c:if test="${sessionScope.get('user') != null}">
                    <ul>
                        <li>
                            <a href=""> <img src="${sessionScope.get('user').image}" style="height: 30px"></a>
                        </li>
                        <li style="border-left: none">
                            <a href="/logout" title="退出">退出</a>
                        </li>
                    </ul>
                </c:if>
            </div>
        </div>
        <!-- Top Header /- -->

        <!-- nav -->
        <nav class="navbar navbar-default ow-navigation">
            <div class="navbar-header">
                <button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse"
                        class="navbar-toggle collapsed" type="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/index" class="navbar-brand"><h3 class="div01">在线4s店</h3></a>
            </div>
<%--            <c:out value="${sessionScope.get('user')}"></c:out>--%>
            <div class="navbar-collapse collapse navbar-right" id="navbar" style="padding-right: unset">
                <ul id="headerId" class="nav navbar-nav" style="padding-right: unset">
                    <li id="headerIndexId"><a href="/index" title="Home" aria-expanded="false">首页</a></li>
                    <li id="headerServerId"><a href="/pro/gets" title="服务">服务</a></li>
                    <c:if test="${sessionScope.get('user') != null}">
                        <li id="headerOrderId"><a href="/orders/gets" title="订单">订单</a></li>
                        <li id="headerUserId"><a href="/users/get" title="个人主页">个人主页</a></li>
                    </c:if>
                </ul>
            </div><!--/.nav-collapse -->
        </nav><!-- nav /- -->
    </div><!-- Container /- -->
</header>
<!-- Header Section /- -->
