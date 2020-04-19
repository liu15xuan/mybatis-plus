<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.baomidou.mybatisplus.extension.plugins.pagination.Page" %>
<%@ page import="com.baomidou.mybatisplus.core.metadata.IPage" %>
<%@ page import="com.carsys.mybatisplus.api.entity.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .ope a:first-child {
        color: red;
    }

    .error {
        color: #dc3545;
        font-size: 80%;
    }
    element.style {
        min-height: unset;
        padding-bottom: unset;
        width: 100%;
    }
    div#contentInnerId {
        width: 100%;
    }
</style>
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="/admin/">主页</a></li>
        <li class="breadcrumb-item active">评论管理</li>
    </ul>
</div>
<div id="mainId">
    <section class="forms" style="padding-top: 25px!important;">
        <div class="container-fluid">
            <div class="col-lg-12">
                <div class="card" style="margin-right: -15px; margin-left: -15px">
                    <div class="card-close">
                    </div>
                    <div class="card-header d-flex align-items-center">
                        <h3 class="h4">
                            评论<c:if test="${requestScope.get('obj').id != null}">修改</c:if><c:if
                                test="${requestScope.get('obj').id == null}">添加</c:if>
                        </h3>
                    </div>
                    <div class="card-body">

                        <form class="form-horizontal" id="formId" AUTOCOMPLETE="OFF" method="post"
                              action="/comments/admin/add">
                            <input hidden name="id" value="${requestScope.get('obj').id}">


                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">用户</label>
                                <div class="col-sm-9">
                                    <select name="usersId" class="form-control">
                                        <c:forEach items="${requestScope.get('usersList')}" var="item">
                                            <option
                                                    <c:if test="${item.id == requestScope.get('obj').usersId}"> selected</c:if>
                                                    value="${item.id}">${item.nickname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">订单</label>
                                <div class="col-sm-9">
                                    <select name="ordersId" class="form-control">
                                        <c:forEach items="${requestScope.get('ordersList')}" var="item">
                                            <option
                                                    <c:if test="${item.id == requestScope.get('obj').ordersId}"> selected</c:if>
                                                    value="${item.id}">${item.id}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">项目</label>
                                <div class="col-sm-9">
                                    <select name="proId" class="form-control">
                                        <c:forEach items="${requestScope.get('proList')}" var="item">
                                            <option
                                                    <c:if test="${item.id == requestScope.get('obj').proId}"> selected</c:if>
                                                    value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">推荐显示</label>
                                <div class="col-sm-9">
                                    <input type="checkbox"
                                           <c:if test="${requestScope.get('obj').isShow==1}">
                                          checked
                                    </c:if>
                                           value="1" name="isShow">
                                </div>
                            </div>


                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">评语</label>
                                <div class="col-sm-9">
                                    <input type="text" name="content" class="form-control" required
                                           placeholder="请输入评语" value="${requestScope.get("obj").content}"
                                           data-msg="请输入评语">
                                </div>
                            </div>


                            <div class="line"></div>
                            <div class="form-group row">
                                <div class="col-sm-4 offset-sm-3">
                                    <button type="button" onclick="sub()" class="btn btn-primary">确定</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript">
    function sub() {
        var flag = $("#formId").valid();
        if (flag) {
            getJsp("/comments/admin/add", 'post', $("#formId").serialize());
        }
    }

    function changPic() {
        $("#picId").click()
    }

    $(function () {
        $('.textarea').wysihtml5({
            toolbar: {fa: true, link: false, image: false, blockquote: false},
        })
    })
</script>
