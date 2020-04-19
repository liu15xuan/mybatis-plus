<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .entry-header a:hover {
        background-color: #ffb589 !important;
    }

    .ordered {
        background-color: gainsboro !important;
    }
</style>
<%@ include file="/WEB-INF/common/header.jsp" %>
<div class="container-fluid no-padding page-banner">
    <div class="padding-90"></div>
    <!-- Container -->
    <div class="container">
    </div><!-- Container /- -->
</div>
<!-- Page Banner /- -->
<div class="padding-50"></div>
<input value="${requestScope.get("item").id}" id="proId" type="hidden">
<div class="container">
    <!-- Content Area -->
    <div class="content-area blog-post col-md-8 col-sm-7 col-xs-12">
        <article class="type-post">
            <div class="entry-cover">
                <img width="810" height="380" alt="blog" src="${requestScope.get('item').image}">
            </div>
            <div class="entry-header">
                <a id="t1" style="width: 120px" href="##" onclick="order()" class="post-date
                    <c:if test="${requestScope.get('isOrder') > 0}">
                    ordered
                    </c:if>">
                    <c:if test="${requestScope.get('isOrder') > 0}">
                        已</c:if>预约</a>
                <div>
                    <h3 class="entry-title">${requestScope.get("item").name}</h3>
                </div>
                <div class="entry-meta">
                    <span><i class="fa fa-user"></i></span><a title="订单">${requestScope.get('item').ordersCount} 订单</a>
                    <span><i class="fa fa-comments"></i></span><a title="评论">${requestScope.get('item').commentsCount} 评论</a>
                    <span><i class="fa fa-clock-o"></i></span><a title="时间">${requestScope.get("item").createdTime.toString().replace('T', ' ')}</a>
                </div>
            </div>
            <div class="entry-content">
                ${requestScope.get("item").content}
            </div>
        </article>
        <div class="comment-section">
            <div class="section-heading">
                <h3>全部评论 (${requestScope.get('item').commentsCount})</h3>
            </div>
            <c:if test="${requestScope.get('comments') == []}">
                暂无评价
                <div class="padding-50"></div>
            </c:if>
            <c:forEach items="${requestScope.get('comments')}" var="item">
                <ul class="media-list">
                    <li class="media">
                        <div class="media-left">
                            <a title="Andrew Flick"><img src="${item.users.image}" alt="blog"
                                                                  width="75"
                                                                  height="75"></a>
                        </div>
                        <div class="media-body">
                            <div class="media-content">
                                <h4 class="media-heading">${item.users.nickname}</h4>
                                <span>${item.createdTime}</span>
                                <p>${item.content}</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </c:forEach>
        </div>

    </div><!-- Content Area /- -->
    <!-- Widget Area -->
    <div class="col-md-4 col-sm-5 col-xs-12 widget-area">
        <!-- Widget Search -->

        <!-- Widget Latest Post -->
        <aside class="widget widget_latestposts">
            <h3 class="widget-title">最新服务</h3>
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
    </div><!-- Widget Area /- -->
</div>
<!-- Container /- -->
<script type="text/javascript">
    function order() {
        $.ajax({
            'url': '/orders/add',
            'type': 'POST',
            contentType: "application/json;charset=UTF-8",
            'data': JSON.stringify({
                'proId': $("#proId").val()
            }),
            'success': function (data) {
                if (data == -2){
                    alert("请先登录");
                    window.location.href = '/login';
                }
                else if (data == 1) {
                    $("#t1").addClass('ordered');
                    $("#t1").text('已预约');
                } else {
                    $("#t1").removeClass('ordered');
                    $("#t1").text('预约');
                }
            },
            'error': function (error) {
            }

        });
    }


    function comment() {
        $.ajax({
            'url': '/orders/add',
            'type': 'POST',
            contentType: "application/json;charset=UTF-8",
            'data': JSON.stringify({
                'proId': $("#proId").val()
            }),
            'success': function (data) {
                if (data == 1) {
                    $("#t1").addClass('ordered');
                    $("#t1").text('已预约');
                } else {
                    $("#t1").removeClass('ordered');
                    $("#t1").text('预约');
                }
            },
            'error': function (error) {
            }

        });
    }

    $(function () {
        $("#navbar ul li").removeClass('active');
        $("#headerServerId").addClass("active");
    });
</script>
<%@ include file="/WEB-INF/common/footer.jsp" %>
