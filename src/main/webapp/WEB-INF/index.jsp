<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>主页</title>

    <link rel="stylesheet" type="text/css" href="/static/u/libraries/lightslider/lightslider.min.css"/>

    <link rel="stylesheet" type="text/css" href="/static/u/revolution/css/settings.css">

    <link rel="stylesheet" type="text/css" href="/static/u/revolution/css/layers.css">
    <link rel="stylesheet" type="text/css" href="/static/u/revolution/css/navigation.css">

    <!-- Library - Bootstrap v3.3.5 -->
    <link rel="stylesheet" type="text/css" href="/static/u/libraries/lib.css">

    <!-- Custom - Theme CSS -->
    <link rel="stylesheet" type="text/css" href="/static/u/style.css">
    <link rel="stylesheet" type="text/css" href="/static/u/css/plugins.css">
    <link rel="stylesheet" type="text/css" href="/static/u/css/navigation-menu.css">
    <link rel="stylesheet" type="text/css" href="/static/u/css/shortcode.css">
    <link rel="stylesheet" href="/static/css/style01.css">
    <style type="text/css">
        .slider-section .slide-btn > a:hover, .slider-section .slide-btn > a:last-of-type {
            background-color: #c03;
            border-color: #c03;
        }
        .slider-section .slide-btn > a:hover, .slider-section .slide-btn > a:last-of-type {
            background-color: #c03;
            border-color: #c03 !important;
        }
        .slider-section .slide-btn > a, .slider-section .slide-btn2 > a {
             border: 2px solid #c03 !important;
            padding: 12px 37px;
            letter-spacing: 1.3px;
            color: #fff;
            border-radius: 3px;
            text-decoration: none;
            margin-right: 20px;
            letter-spacing: 2.1px;
            text-transform: uppercase;
            font-size: 13px !important;
            line-height: 33px !important;
            padding: 12px 37px !important;
        }
        .select-vechical-type a {
            margin-right: 115px !important;
        }

        .select-vechical-type a:first-child {
            margin-left: 115px !important;
        }
        .jtv-banner-info {
            width: 100%;
            z-index: 1;
            position: absolute;
            height: 100%;
            color: #fff;
            text-align: left;
            top: 0px;
        }

        element.style {
            z-index: 6;
            position: relative;
            color: rgb(255, 255, 255);
            font-weight: 700;
            letter-spacing: 1px;
            font-family: "Open Sans", sans-serif;
            text-transform: uppercase;
            visibility: hidden;
            transition: none;
            line-height: 71px;
            border-width: 0px;
            margin: 0px;
            padding: 7px 0px;
            font-size: 75px;
            white-space: nowrap;
            min-height: 0px;
            min-width: 0px;
            max-height: none;
            max-width: none;
            opacity: 1;
            transform-origin: 50% 50% 0px;
            transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 158, 0, 1);
        }
        .rev_slider .tp-mask-wrap .tp-caption, .rev_slider .tp-mask-wrap *:last-child, .wpb_text_column .rev_slider .tp-mask-wrap .tp-caption, .wpb_text_column .rev_slider .tp-mask-wrap *:last-child {
            margin-bottom: 0;
        }

        element.style {
            z-index: 6;
            position: relative;
            color: rgb(255, 255, 255);
            font-weight: 700;
            letter-spacing: 1px;
            font-family: "Open Sans", sans-serif;
            text-transform: uppercase;
            visibility: hidden;
            transition: none;
            line-height: 71px;
            border-width: 0px;
            margin: 0px;
            padding: 7px 0px;
            font-size: 75px;
            white-space: nowrap;
            min-height: 0px;
            min-width: 0px;
            max-height: none;
            max-width: none;
            opacity: 1;
            transform-origin: 50% 50% 0px;
            transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 158, 0, 1);
        }
        .cta-section {
            background-color: rgb(214, 220, 224);
        }
        .cta-section .container > a {
            background-color: #c03;
            border-radius: 5px;
            color: #fff;
            float: right;
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 1.3px;
            padding: 15px 34px;
            text-decoration: none;
            text-transform: uppercase;
            -webkit-transition: all 0.5s ease 0s;
            -moz-transition: all 0.5s ease 0s;
            -o-transition: all 0.5s ease 0s;
            transition: all 0.5s ease 0s;
        }
        .cta-section .container > h3 {
            color: rgb(0, 0, 0);
            font-family: 'Roboto Slab', serif;
            font-size: 15px;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 30px;
            margin: 7px 20px 7px 55px;
            line-height: 35px;
        }
        h3.title.text-capitalize.text-dark.text-center.pb-3.mb-sm-5.mb-4 {
            margin: 36px;
            font-size: 28px;
        }
        .testimonial-section .testi-content {
            text-align: center;
            /* margin-bottom: 7px; */
            padding: 20px;
        }
        .item {
            height: 75px;
        }
    </style>
</head>

<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
<div class="main-container">
    <%--    <!-- Loader -->--%>
    <div id="site-loader" class="load-complete">
        <div class="loader">
            <div class="loader-inner ball-clip-rotate">
                <div></div>
            </div>
        </div>
    </div><!-- Loader /- -->

    <!-- Header Section -->
    <%@ include file="/WEB-INF/common/_header.jsp" %>

    <main>
        <!-- Slider Section -->
        <div id="home-revslider" class="slider-section container-fluid no-padding ">
            <!-- START REVOLUTION SLIDER 5.0 -->
            <div class="rev_slider_wrapper">
                <div id="home-slider1" class="rev_slider" data-version="5.0">
                    <ul>
                        <c:forEach var="item" items="${requestScope.get('bannerList')}">
                            <li data-transition="fade" data-slotamount="1" data-easein="default" data-easeout="default"
                                data-masterspeed="1500">
                                <!--图片-->
                                <img src="${item.image}" alt="home1"/>


                                <!-- 小标题 -->
                                <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0 text-1"
                                     id="slide-2-layer-2"
                                     data-x="['left','left','left','left']" data-hoffset="['365','365','365','20']"
                                     data-y="['top','top','top','top']" data-voffset="['356','356','356','356']"
                                     data-fontsize="['70','100','120','140']"
                                     data-lineheight="['100','100','100','100']"
                                     data-width="none"
                                     data-height="none"
                                     data-whitespace="nowrap"
                                     data-transform_idle="o:1;"
                                     data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                     data-start="1000"
                                     data-splitin="chars"
                                     data-splitout="none"
                                     data-responsive_offset="on"
                                     data-elementdelay="0.05"
                                     style="z-index:6; position:relative; color:#fff; font-weight:400; letter-spacing: 7px; font-family: 'Roboto Slab', serif; text-transform: uppercase;">
                                    <h3>${item.small}</h3>
                                </div>

                                <!-- 大标题 -->
                                <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0"
                                     id="slide-2-layer-3"
                                     data-x="['left','left','left','left']" data-hoffset="['365','365','365','20']"
                                     data-y="['top','top','top','top']" data-voffset="['486','486','486','486']"
                                     data-fontsize="['105','105','130','160']"
                                     data-lineheight="['100','100','100','100']"
                                     data-width="none"
                                     data-height="none"
                                     data-whitespace="nowrap"
                                     data-transform_idle="o:1;"
                                     data-transform_in="x:[105%];z:0;rX:45deg;rY:0deg;rZ:90deg;sX:1;sY:1;skX:0;skY:0;s:2000;e:Power4.easeInOut;"
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                     data-mask_in="x:0px;y:0px;s:inherit;e:inherit;"
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                     data-start="1000"
                                     data-splitin="chars"
                                     data-splitout="none"
                                     data-responsive_offset="on"
                                     data-elementdelay="0.05"
                                     style="z-index:6; position:relative; color:#f85c37; font-weight:700; letter-spacing: 2.1px; font-family: 'Open Sans', sans-serif; text-transform: uppercase;">
                                    <h3>${item.big}</h3>
                                </div>

                                <!-- 按钮-->
                                <div class="tp-caption NotGeneric-Title tp-resizeme rs-parallaxlevel-0 slide-btn"
                                     id="slide-2-layer-4"
                                     data-x="['left','left','left','left']" data-hoffset="['365','365','365','365']"
                                     data-y="['top','top','top','top']" data-voffset="['650','650','650','650']"
                                     data-fontsize="['13','100','150','5000']"
                                     data-lineheight="['26','52','26','26']"
                                     data-width="none"
                                     data-height="none"
                                     data-whitespace="noraml"
                                     data-transform_idle="o:1;"
                                     data-transform_in="y:[100%];z:0;rX:0deg;rY:0;rZ:0;sX:1;sY:1;skX:0;skY:0;opacity:0;s:2000;e:Power4.easeInOut;"
                                     data-transform_out="y:[100%];s:1000;e:Power2.easeInOut;s:1000;e:Power2.easeInOut;"
                                     data-mask_in="x:0px;y:[100%];s:inherit;e:inherit;"
                                     data-mask_out="x:inherit;y:inherit;s:inherit;e:inherit;"
                                     data-start="1500"
                                     data-splitin="none"
                                     data-splitout="none"
                                     data-responsive_offset="on"
                                     style="z-index:6; position:relative;">
                                    <a href="/pro/get?id=${item.proId}" style="font-weight: 700; padding: 12px 37px;"
                                       href="#" title="Read More">点击查看</a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div><!-- END REVOLUTION SLIDER -->
            </div><!-- END OF SLIDER WRAPPER -->
        </div><!-- Slider Section /- -->


        <!-- Welcome Section -->
        <div class="welcome-section container-fluid no-padding">
            <div class="container">
                <form>
                    <div class="select-vechical-type">
                        <a><img src="/static/u/images/wel-ic-1.png" alt="wel-ic">suv</a>
                        <a><img src="/static/u/images/wel-ic-2.png" alt="wel-ic">pickup</a>
                        <a><img src="/static/u/images/wel-ic-3.png" alt="wel-ic">convertible</a>
                        <a><img src="/static/u/images/wel-ic-4.png" alt="wel-ic">sedan</a>
                        <a><img src="/static/u/images/wel-ic-5.png" alt="wel-ic">coupe</a>
                    </div>
                    <%--                    <div class="padding-20"></div>--%>
                </form>
                <%--                <div class="padding-100"></div>--%>
            </div>
            <%--第二中间栏--%>
            <div class="jtv-bottom-banner-section">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="jtv-img-box"> <a href="#"> <img src="static/images/jtv-banner1.jpg" alt="bottom banner">
                                <div class="jtv-banner-info"> <span>15载耕耘，品质传承</span>
                                    <h3>官方认证</h3>
                                </div>
                            </a> </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="jtv-img-box"> <a href="#"> <img src="static/images/jtv-banner2.jpg" alt="bottom banner">
                                <div class="jtv-banner-info"> <span>卓越品质的追随，承诺由始至终</span>
                                    <h3>客户承诺</h3>
                                </div>
                            </a> </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="jtv-img-box"> <a href="#"> <img src="static/images/jtv-banner3.jpg" alt="bottom banner">
                                <div class="jtv-banner-info"> <span>以官方认证为名，缔造卓越价值典范</span>
                                    <h3>价值保障</h3>
                                </div>
                            </a> </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 img-block">
                <h2>car</h2>
                <img src="${requestScope.get('settings').image}" alt="Welcome"/>
            </div>
            <div class="col-md-6">
                <div class="padding-100"></div>


                <!-- Section Header -->
                <div class="section-header">
                    <h3>4s店客户服务管理系统</h3>
                    ${requestScope.get('settings').content}
                </div><!-- Section Header /- -->
                <div class="padding-100"></div>
            </div>
        </div><!-- Welcome Section /- -->

        <!-- Portfolio Section -->

        <h3 class="title text-capitalize text-dark text-center pb-3 mb-sm-5 mb-4">汽车展示
            <span></span>
        </h3>
        <div class="portfolio-section container-fluid no-padding">
            <c:forEach items="${requestScope.get('picsList')}" var="item">
                <div class="col-md-3 col-sm-4 col-xs-6 portfolio-box no-padding">
                    <img src="${item.image}" title="${item.name}"/>
                </div>
            </c:forEach>

        </div>

        <div class="section-padding"></div>

        <!-- Testimonial Section -->
        <div class="container-fluid no-padding testimonial-section">
            <!-- Container -->
            <div class="container">
                <!-- Section Header -->
                <div class="section-header">
                    <h3>客户评价</h3>
                </div><!-- Section Header /- -->
                <div id="carousel-testimonial" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <c:forEach items="${requestScope.get('commentsList')}" var="item" varStatus="itemStatus">
                            <li data-target="#carousel-testimonial" data-slide-to="${itemStatus.index}"
                                class="<c:if test='${itemStatus.index == 0}'>active</c:if>"></li>
                        </c:forEach>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                        <c:forEach items="${requestScope.get('commentsList')}" var="item" varStatus="itemStatus">
                            <div class="item <c:if test='${itemStatus.index == 0}'>active</c:if>">
                                <div class="testi-content">
                                    <br/>
                                        ${item.content}
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div><!-- Container /- -->
        </div><!-- Testimonial Section /- -->

        <div class="section-padding"></div>

        <!-- Call To Action -->
        <div class="cta-section container-fluid no-padding">
            <div class="padding-50"></div>
            <!-- Container -->
            <div class="container">
                <c:if test="${sessionScope.get('user') == null}">
                    <h3>4s店客户服务管理系统</h3>
                    <a href="/login" title="登录">登录</a>
                </c:if>
                <c:if test="${sessionScope.get('user') != null}">
                    <h3>4s店客户服务管理系统</h3>
                    <a href="/pro/gets" title="查看更多商品信息">查看更多商品信息</a>
                </c:if>
            </div><!-- Container /- -->
            <div class="padding-50"></div>
        </div>
        <!-- Call To Action /- -->
        <%--        <div class="padding-30"></div>--%>
    </main>


    <!-- Footer Section -->
        <%@ include file="/WEB-INF/common/footer.jsp" %>

</div>

<!-- JQuery v1.12.4 -->
<script src="/static/u/js/jquery-1.12.4.min.js"></script>

<!-- Library - Js -->
<script src="/static/u/libraries/lib.js"></script>
<script src="/static/u/libraries/lightslider/lightslider.min.js"></script>

<!-- RS5.0 Core JS Files -->
<script type="text/javascript" src="/static/u/revolution/js/jquery.themepunch.tools.min.js?rev=5.0"></script>
<script type="text/javascript" src="/static/u/revolution/js/jquery.themepunch.revolution.min.js?rev=5.0"></script>
<script type="text/javascript" src="/static/u/revolution/js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="/static/u/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript"
        src="/static/u/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="/static/u/revolution/js/extensions/revolution.extension.navigation.min.js"></script>


<!-- Library - Theme JS -->
<script src="/static/u/js/functions.js"></script>

<script type="text/javascript">
    $(function () {
        $("#navbar ul li").removeClass('active');
        $("#headerIndexId").addClass("active");
    });
</script>
</body>
</html>

