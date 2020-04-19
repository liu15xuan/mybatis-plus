<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/header.jsp" %>
<style type="text/css">
    .nopage a:hover {
        background-color: #fff !important;
        border: 1px solid #bbbbbb !important;
        color: #bbbbbb !important;
    }
    .page-banner .breadcrumb li {
        color: #fff;
    }
    .type-post a.read-more {
        background-color: #c03;
        border: #c03;
        color: #fff;

    }
    .type-post .entry-header .post-date {
        background-color: rgb(67, 76, 83);
    }
    .type-post .entry-meta span {
        color: rgb(214, 220, 224);
    }
    .widget-title {
        border-bottom: 3px solid #c03;
    }
    .widget-area .widget_latestposts .latest-content p > a i {
        color: rgb(214, 220, 224);
    }
    .ow-pagination ul li a:hover {
        background-color: #c03;
        border-color: #c03;
        color: #fff;
    }
</style>
<div class="container-fluid no-padding page-banner">
    <div class="padding-90"></div>
    <!-- Container -->
    <div class="container">
        <h3>4s店客户服务管理平台</h3>
        <ol class="breadcrumb">
            <li><a href="/index">首页</a></li>
            <li class="active">服务</li>
        </ol>
    </div><!-- Container /- -->
    <div class="padding-100"></div>
</div>
<!-- Page Banner /- -->
<div class="padding-80"></div>
<div class="container">
    <!-- Content Area -->
    <div class="content-area col-md-8 col-sm-8 col-xs-12">
        <c:forEach var="item" items="${requestScope.get('items')}">
            <article class="type-post">
                <c:if test="${item.image != ''}">
                    <div class="entry-cover">
                        <a title="Blog" href="/pro/get?id=${item.id}">
                            <img width="810" height="380" alt="blog" src="${item.image}">
                        </a>
                    </div>
                </c:if>
                <div class="entry-header">
                    <a class="post-date">${item.createdTime.toString().substring(8,10)}<span>
                        ${item.createdTime.toString().substring(5,7)}月
                    </span></a>
                    <h3 class="entry-title"><a title="${item.name}" href="/pro/get?id=${item.id}"> ${item.name} </a>
                    </h3>
                    <br>
                    <div class="entry-meta">
                        <span><i class="fa fa-user"></i></span><a title="订单数">${item.ordersCount} 订单</a>
                            <%--                        <span><i class="fa fa-folder-open"></i></span><a href="#" title="Car Show">Car Show</a>--%>
                        <span><i class="fa fa-comments"></i></span><a title="评论">${item.commentsCount} 评论</a>
                    </div>
                </div>
                <div class="entry-content">
                    <p>${item.content.toString().length() <=300?item.content:item.content.toString().substring(0, 300)}</p>
                </div>
                <a href="/pro/get?id=${item.id}" title="点击查看详情" class="read-more">点击查看详情</a>
            </article>
        </c:forEach>

        <nav class="ow-pagination text-left">
            <ul class="pagination">


                <c:if test="${requestScope.page.getCurrent()==1}">
                    <li class="nopage"><a>首页</a></li>
                    <li class="nopage"><a style="width: 60px">上一页</a></li>
                </c:if>

                <c:if test="${requestScope.page.getCurrent() > 1}">
                    <li><a href="/pro/gets?current=1">首页</a></li>
                    <li><a href="/pro/gets?current=${requestScope.page.getCurrent()-1}" style="width: 60px">上一页</a></li>
                </c:if>

                <c:if test="${requestScope.page.getCurrent()==requestScope.page.getPages()}">
                    <li class="nopage"><a style="width: 60px">下一页</a></li>
                    <li class="nopage"><a>尾页</a></li>
                </c:if>
                <c:if test="${requestScope.page.getCurrent() < requestScope.page.getPages()}">
                    <li><a href="/pro/gets?current=${requestScope.page.getCurrent()+1}" style="width: 60px">下一页</a></li>
                    <li><a href="/pro/gets?current=${requestScope.page.getPages()}">尾页</a></li>
                </c:if>
            </ul>
        </nav>
        <div class="padding-50"></div>
    </div><!-- Content Area /- -->
    <!-- Widget Area -->
    <div class="col-md-4 col-sm-5 col-xs-12 widget-area">
        <aside class="widget widget_latestposts">
            <h3 class="widget-title">最受欢迎</h3>
            <c:forEach items="${requestScope.get('hotPro')}" var="item">
                <div class="latest-content">
                    <a href="/pro/get?id=${item.id}" title="${item.name}">
                        <img style="max-width: 89px; max-height: 89px; border-radius: unset" alt="thumb"
                             src="${item.image}"></a>
                    <h3><a title="${item.name}" href="/pro/get?id=${item.id}" >${item.name}</a></h3>
                    <p><a href="/pro/get?id=${item.id}" ><i class="fa fa-calendar"></i>${item.createdTime.toString().replace('T', ' ')}</a></p>
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
        $("#headerServerId").addClass("active");
    });
</script>
<%@ include file="/WEB-INF/common/footer.jsp" %>
