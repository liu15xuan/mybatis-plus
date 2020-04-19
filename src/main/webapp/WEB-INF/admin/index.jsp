<%@ include file="/WEB-INF/admin/common/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style type="text/css">
    .content-inner{
        width: 100% !important;
    }
    element.style {
        min-height: unset;
        padding-bottom: unset;
        width: 100%;
    }
</style>
<div class="content">
    <!-- Animated -->
    <div class="animated fadeIn">
        <!-- Widgets  -->
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-money text-success border-success"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">订单总数</div>
                                <div class="stat-digit">${requestScope.get('ordersCount')}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-user text-primary border-primary"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">注册用户</div>
                                <div class="stat-digit">${requestScope.get("usersCount")}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-link text-danger border-danger"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">待处理订单</div>
                                <div class="stat-digit">${requestScope.get("waitOrdersCount")}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-layout-grid2 text-warning border-warning"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">订单评价</div>
                                <div class="stat-digit">${requestScope.get("commentsCount")}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- To Do and Live Chat -->
        <section class="projects no-padding-top">
            <div class="card weather-box">
                <!-- Project-->
                <h3 class="weather-title box-title">待处理订单<a href="#" onclick="getJsp('/orders/admin/list', 'get', 'current=1&size=5')">(点击查看全部订单)</a></h3>
                <div style="padding: 10px"></div>
                <div class="project">
                    <c:forEach items="${requestScope.get('items')}" var="item">
                        <div class="row bg-white has-shadow" style="cursor:pointer;">
                            <div class="left-col col-lg-12 d-flex align-items-center justify-content-between">
                                <div class="project-title d-flex align-items-center" onclick="getJsp('/orders/admin/add', 'get', 'id=${item.id}')">
                                    <div class="image has-shadow" style="height: unset; max-width: 120px"><img src="${item.pro.image}" alt="..." class="img-fluid">
                                    </div>
                                    <div class="text">
                                        <h3 class="h4">${item.pro.name}</h3>
                                        <small>
                                            <c:if test="${item.pro.content.length() > 15}">
                                                ${item.pro.content.substring(0, 15)}...
                                            </c:if>
                                            <c:if test="${item.pro.content.length() <= 15}">
                                                ${item.pro.content}
                                            </c:if>
                                        </small>
                                    </div>
                                </div>
                                <div class="project-date"><span class="hidden-sm-down">
                                        ${item.createdTime.toString().replace("T", ' ')}
                                </span></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>
        </section>

    </div>
    <div class="clearfix"></div>
    <%@ include file="/WEB-INF/admin/common/footer.jsp" %>
    </div>
</div>
