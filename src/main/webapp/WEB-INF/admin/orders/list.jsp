<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.baomidou.mybatisplus.extension.plugins.pagination.Page" %>
<%@ page import="com.baomidou.mybatisplus.core.metadata.IPage" %>
<%@ page import="com.carsys.mybatisplus.api.entity.Users" %>
<%--<%@ include file="/WEB-INF/admin/common/header.jsp" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/admin/common/del.jsp" %>
<style type="text/css">
    .ope a:first-child {
        color: red;
    }
    div#contentInnerId {
        width: 100%;
    }
</style>
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="/admin/">主页</a></li>
        <li class="breadcrumb-item active">订单管理</li>
    </ul>
</div>
<div id="mainId">

    <section class="tables" style="padding-top: 25px !important;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-close">
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">订单列表</h3>
                        </div>
                        <div class="row" style="padding-top: 10px; padding-left: 15px">
                            <div class="col-lg-4">
                                <select class="form-control" id="statusId">
                                    <option <c:if test="${requestScope.get('status') == null}">selected</c:if> value="">全部</option>
                                    <option <c:if test="${requestScope.get('status') == 0}">selected</c:if> value="0">待确认</option>
                                    <option <c:if test="${requestScope.get('status') == 1}">selected</c:if> value="1">维修中</option>
                                    <option <c:if test="${requestScope.get('status') == 2}">selected</c:if> value="2">待评价</option>
                                    <option <c:if test="${requestScope.get('status') == 3}">selected</c:if> value="3">已评价</option>
                                </select>
                            </div>
                            <div class="col-lg-3">
                                <button class="btn btn-success" onclick="getJsp2(1, 5)">确认</button>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>用户id</th>
                                        <th>项目</th>
                                        <th>状态</th>
                                        <th>创建时间</th>

                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.get('items')}" var="item">
                                        <tr>
                                            <td>${item.users.nickname}</td>
                                            <td>${item.pro.name}</td>
                                            <td>
                                                <c:if test="${item.status == 0}">待确认</c:if>
                                                <c:if test="${item.status == 1}">维护中</c:if>
                                                <c:if test="${item.status == 2}">待评价</c:if>
                                                <c:if test="${item.status == 3}">已评价</c:if>
                                            </td>
                                            <td>${item.createdTime.toString().replace("T", " ")}</td>
                                            <td>
                                                <button onclick="showDeleteModal('/orders/admin/del', ${item.id})"
                                                        class="btn btn-sm btn-danger">删除
                                                </button>
                                                <button onclick="getJsp('/orders/admin/add', 'get', 'id=${item.id}')"
                                                        class="btn btn-sm btn-info">修改
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <ul class="pagination rounded-separated pagination-info mt-8 right">

                                <li class="page-item
                            <c:if test="${requestScope.get('page').getCurrent() == 1}">
                               disabled
                            </c:if>
                                ">
                                    <a class="page-link"
                                       onclick="getJsp2(1, 5)"
                                       href="##">首页</a></li>
                                <li class="page-item
                             <c:if test="${requestScope.get('page').getCurrent() == 1}">
                               disabled
                            </c:if>
                            "><a class="page-link"
                                 onclick="getJsp2(${requestScope.get('page').getCurrent()-1}, 5)"
                                 href="##">上一页</a></li>
                                <li class="page-item
                             <c:if test="${requestScope.get('page').getPages() == 0 || requestScope.get('page').getCurrent() == requestScope.get('page').getPages()}">
                               disabled
                            </c:if>
                            "><a class="page-link"
                                 onclick="getJsp2(${requestScope.get('page').getCurrent()+1}, 5)"
                                 href="##"> 下一页</a></li>
                                <li class="page-item
                             <c:if test="${requestScope.get('page').getPages() == 0 || requestScope.get('page').getCurrent() == requestScope.get('page').getPages()}">
                               disabled
                            </c:if>
                            "><a class="page-link"
                                 onclick="getJsp2(${requestScope.get('page').getPages()}, 5)"
                                 href="##">尾页</a>
                                </li>
                                <li class="page-item disabled"><a
                                        class="page-link border-right-0 border-bottom-0 border-top-0" href="##">
                                    <c:out value="${requestScope.get('page').getCurrent()}"></c:out>
                                    /
                                    <c:out value="${requestScope.get('page').getPages()}页"></c:out>
                                </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    function getJsp2(current, size) {
        var status = $("#statusId").val();
        var data = "current=" + current + "&size=" + size;
        if (status !=''){
            data = data+"&status="+status;
        }
        getJsp('/orders/admin/list', 'get', data);
    }
</script>
<%--<%@ include file="/WEB-INF/admin/common/footer.jsp" %>--%>
