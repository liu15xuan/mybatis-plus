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
        <li class="breadcrumb-item"><a href="/admin/">Home</a></li>
        <li class="breadcrumb-item active">设置管理</li>
    </ul>
</div>
<div id="mainId">

    <section class="tables" style="padding-top: 25px !important;">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-close">
                            <div class="dropdown">
                                <button type="button" id="closeCard1" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false" class="dropdown-toggle"><i class="fa fa-ellipsis-v"></i>
                                </button>
                                <div aria-labelledby="closeCard1" class="dropdown-menu dropdown-menu-right has-shadow">
                                    <a onclick="getJsp('/settings/admin/add', 'get', '')" href="#" class="dropdown-item"> <i class="fa fa-address-card"></i>新增设置</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-header d-flex align-items-center">
                            <h3 class="h4">设置列表</h3>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>电话</th>
<th>邮箱</th>
<th>车库数量</th>

                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.get('items')}" var="item">
                                        <tr>
                                        <td>${item.tel}</td>
<td>${item.email}</td>
<td>${item.num}</td>

                                            <td>
                                                <button onclick="showDeleteModal('/settings/admin/del', ${item.id})"  class="btn btn-sm btn-danger">删除</button>
                                                <button onclick="getJsp('/settings/admin/add', 'get', 'id=${item.id}')"  class="btn btn-sm btn-info">修改</button>
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
                                       onclick="getJsp('/settings/admin/list', 'get', 'current=1&size=5')"
                                       href="##">首页</a></li>
                                <li class="page-item
                             <c:if test="${requestScope.get('page').getCurrent() == 1}">
                               disabled
                            </c:if>
                            "><a class="page-link"
                                 onclick="getJsp('/settings/admin/list', 'get', 'current=${requestScope.get('page').getCurrent()-1}&size=5')"
                                 href="##">上一页</a></li>
                                <li class="page-item
                             <c:if test="${requestScope.get('page').getPages() == 0 || requestScope.get('page').getCurrent() == requestScope.get('page').getPages()}">
                               disabled
                            </c:if>
                            "><a class="page-link"
                                 onclick="getJsp('/settings/admin/list', 'get', 'current=${requestScope.get('page').getCurrent()+1}&size=5')"
                                 href="##"> 下一页</a></li>
                                <li class="page-item
                             <c:if test="${requestScope.get('page').getPages() == 0 || requestScope.get('page').getCurrent() == requestScope.get('page').getPages()}">
                               disabled
                            </c:if>
                            "><a class="page-link"
                                 onclick="getJsp('/settings/admin/list', 'get', 'current=${requestScope.get('page').getPages()}&size=5')"
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
</script>
<%--<%@ include file="/WEB-INF/admin/common/footer.jsp" %>--%>
