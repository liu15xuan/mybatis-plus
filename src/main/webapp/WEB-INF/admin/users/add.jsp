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
    div#contentInnerId {
        width: 100%;
    }
</style>
<div class="breadcrumb-holder container-fluid">
    <ul class="breadcrumb">
        <li class="breadcrumb-item"><a href="/admin/">主页</a></li>
        <li class="breadcrumb-item active">用户管理</li>
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
                            用户<c:if test="${requestScope.get('obj').id != null}">修改</c:if><c:if
                                test="${requestScope.get('obj').id == null}">添加</c:if>
                        </h3>
                    </div>
                    <div class="card-body">

                        <form class="form-horizontal" id="formId" AUTOCOMPLETE="OFF" method="post"
                              action="/users/admin/add">
                            <input hidden name="id" value="${requestScope.get('obj').id}">
                            <input value="${requestScope.get('obj').image}" type="text" hidden name="image"
                                   id="imPicId">

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">头像</label>
                                <div class="col-sm-9">
                                    <img id="showImgId" onclick="changPic()" alt="点击添加图片"
                                         src="${requestScope.get('obj').image}" style="height:
                                    100px;
                                    max-width: 500px;cursor: pointer">
                                    <input onchange="uploadPic('picId', 'imPicId', 'showImgId')"
                                           type="file" accept="image/*" id="picId" hidden>
                                    <label class="error">${requestScope.get('msg')}</label>
                                </div>

                            </div>

                            <c:if test="${requestScope.get('obj').id == null}">
                                <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">账号</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="username" class="form-control" required
                                               placeholder="请输入账号" value="${requestScope.get("obj").username}"
                                               data-msg="请输入账号">
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${requestScope.get('obj').id != null}">
                                <div class="form-group row">
                                    <label class="col-sm-3 form-control-label">账号</label>
                                    <div class="col-sm-9">
                                        <input type="text" readonly name="username" class="form-control" required
                                               placeholder="请输入账号" value="${requestScope.get("obj").username}"
                                               data-msg="请输入账号">
                                    </div>
                                </div>
                            </c:if>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">姓名</label>
                                <div class="col-sm-9">
                                    <input type="text" name="nickname" class="form-control" required
                                           placeholder="请输入姓名" value="${requestScope.get("obj").nickname}"
                                           data-msg="请输入姓名">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">角色</label>
                                <div class="col-sm-9">
                                    <select name="role" class="form-control">
                                        <option
                                                <c:if test="${requestScope.get('obj').role == 0}">selected</c:if>
                                                value="0">普通用户
                                        </option>
                                        <option
                                                <c:if test="${requestScope.get('obj').role == 1}">selected</c:if>
                                                value="1">管理员
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">邮箱</label>
                                <div class="col-sm-9">
                                    <input type="email" name="email" class="form-control"
                                           placeholder="请输入邮箱" value="${requestScope.get("obj").email}"
                                           data-msg="请输入邮箱">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">手机号</label>
                                <div class="col-sm-9">
                                    <input type="number" name="phone" class="form-control"
                                           placeholder="请输入手机号" value="${requestScope.get("obj").phone}"
                                           data-msg="请输入手机号">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">密码</label>
                                <div class="col-sm-9">
                                    <c:if test="${requestScope.get('obj').id == null}">
                                        <input type="text" name="password" class="form-control" required
                                               placeholder="请输入密码" value=""
                                               data-msg="请输入密码">
                                    </c:if>
                                    <c:if test="${requestScope.get('obj').id != null}">
                                        <input type="text" name="password" class="form-control"
                                               placeholder="请输入密码(为空则表示不做修改)" value=""
                                               data-msg="请输入密码(为空则表示不做修改)">
                                    </c:if>
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
            getJsp("/users/admin/add", 'post', $("#formId").serialize());
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
