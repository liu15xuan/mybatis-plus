<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/header.jsp" %>
<style>
    .order0 {
        background: #ffb02a !important;
    }

    .order1 {
        background: #3d3cff !important;
    }

    .order2 {
        background: #ff757d !important;
    }

    .order3 {
        background: #408057 !important;
    }

    .d {
        border-bottom: 3px solid #867d7b;
    }


    .nopage a:hover {
        background-color: #fff !important;
        border: 1px solid #bbbbbb !important;
        color: #bbbbbb !important;
    }
    .type-post a.read-more {
        background-color: #c03;
        border-radius: 3px;
        border: #c03;
        color: #fff;
        display: inline-block;
        font-weight: 700;
        font-size: 13px;
        padding: 11px 32px;
        letter-spacing: 1.3px;
        text-transform: uppercase;
        text-decoration: none;
    }
    .widget-title {
        border-bottom: 3px solid #c03;
        font-family: 'Roboto Slab', serif;
        font-size: 18px;
        padding-bottom: 24px;
        margin-bottom: 30px;
        margin-top: 0;
        text-transform: capitalize;
    }
</style>
<div class="container-fluid no-padding page-banner">
    <div class="padding-90"></div>
    <!-- Container -->
    <div class="container">
    </div><!-- Container /- -->
</div><!-- Page Banner /- -->
<div class="padding-60"></div>
<div class="container">
    <!-- Content Area -->
    <div class="content-area col-md-8 col-sm-8 col-xs-12">
        <h3 class="widget-title d">全部订单</h3>
        <c:forEach var="item" items="${requestScope.get('items')}">
            <article class="type-post">
                <div class="entry-header">
                    <c:if test="${item.status==0}">
                        <a class="post-date order0"><span>待接单</span></a>
                    </c:if>
                    <c:if test="${item.status==1}">
                        <a class="post-date order1"><span>维修中</span></a>
                    </c:if>
                    <c:if test="${item.status==2}">
                        <a class="post-date order2"><span>待评价</span></a>
                    </c:if>
                    <c:if test="${item.status==3}">
                        <a class="post-date order3"><span>已评价</span></a>
                    </c:if>
                    <h3 class="entry-title"><a title="${item.pro.name}"
                                               href="/pro/get?id=${item.proId}"> ${item.pro.name} </a>
                    </h3>
                    <br>
                    <div class="entry-meta">
                        <span><i class="fa fa-calendar-times-o"></i></span><a title="下单时间">${item.createdTime}</a>
                    </div>
                </div>
                <div class="entry-content">
                    <p>${item.pro.content.toString().length() <=50?item.pro.content:item.pro.content.toString().substring(0, 50)}...</p>
                </div>
                <a href="/orders/get?id=${item.id}" title="Read More" class="read-more">点击查看详情</a>
            </article>
            <hr/>
        </c:forEach>


        <nav class="ow-pagination text-left">
            <ul class="pagination">


                <c:if test="${requestScope.page.getCurrent()==1}">
                    <li class="nopage"><a>首页</a></li>
                    <li class="nopage"><a style="width: 60px">上一页</a></li>
                </c:if>

                <c:if test="${requestScope.page.getCurrent() > 1}">
                    <li><a href="/orders/gets?current=1">首页</a></li>
                    <li><a href="/orders/gets?current=${requestScope.page.getCurrent()-1}" style="width: 60px">上一页</a></li>
                </c:if>

                <c:if test="${requestScope.page.getCurrent()==requestScope.page.getPages()}">
                    <li class="nopage"><a style="width: 60px">下一页</a></li>
                    <li class="nopage"><a>尾页</a></li>
                </c:if>
                <c:if test="${requestScope.page.getCurrent() < requestScope.page.getPages()}">
                    <li><a href="/orders/gets?current=${requestScope.page.getCurrent()+1}" style="width: 60px">下一页</a></li>
                    <li><a href="/orders/gets?current=${requestScope.page.getPages()}">尾页</a></li>
                </c:if>
            </ul>
        </nav>
        <div class="padding-50"></div>
    </div><!-- Content Area /- -->
    <!-- Widget Area -->
    <div class="col-md-4 col-sm-5 col-xs-12 widget-area">
        <aside class="widget widget_latestposts">
            <h3 class="widget-title">待评价订单</h3>
            <c:if test="${requestScope.get('cOrders') == []}">
                暂无待评价订单~
            </c:if>
            <c:forEach items="${requestScope.get('cOrders')}" var="item">
                <div class="latest-content">
                    <a href="/orders/get?id=${item.id}" title="${item.pro.name}">
                        <img style="max-width: 89px; max-height: 89px; border-radius: unset" alt="thumb"
                             src="${item.pro.image}"></a>
                    <h3><a title="${item.pro.name}" href="/orders/get?id=${item.id}" t>${item.pro.name}</a></h3>
                    <p><a><i class="fa fa-calendar"></i>${item.createdTime.toString().replace('T', ' ')}</a></p>
                </div>
            </c:forEach>
        </aside><!-- Widget Latest Post /-  -->
        <div class="padding-50"></div>
    </div><!-- Widget Area /- -->
</div>
<!-- Container /- -->
<script type="text/javascript">
    $(function () {
        $("#navbar ul li").removeClass('active');
        $("#headerOrderId").addClass("active");
    });
</script>
<%@ include file="/WEB-INF/common/footer.jsp" %>
