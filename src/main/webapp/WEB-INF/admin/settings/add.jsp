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
        <li class="breadcrumb-item active">设置管理</li>
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
                            设置<c:if test="${requestScope.get('obj').id != null}">修改</c:if><c:if
                                test="${requestScope.get('obj').id == null}">添加</c:if>
                        </h3>
                    </div>
                    <div class="card-body">

                        <form class="form-horizontal" id="formId" AUTOCOMPLETE="OFF" method="post"
                              action="/settings/admin/add">
                            <input hidden name="id" value="${requestScope.get('obj').id}">


                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">电话</label>
                                <div class="col-sm-9">
                                    <input type="text" name="tel" class="form-control" required
                                           placeholder="请输入电话" value="${requestScope.get("obj").tel}"
                                           data-msg="请输入电话">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">邮箱</label>
                                <div class="col-sm-9">
                                    <input type="text" name="email" class="form-control" required
                                           placeholder="请输入邮箱" value="${requestScope.get("obj").email}"
                                           data-msg="请输入邮箱">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">车库数量</label>
                                <div class="col-sm-9">
                                    <input type="text" name="num" class="form-control" required
                                           placeholder="请输入车库数量" value="${requestScope.get("obj").num}"
                                           data-msg="请输入车库数量">
                                </div>
                            </div>

                            <input value="${requestScope.get('obj').image}" type="text" hidden name="image"
                                   id="imPicId">
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">图片</label>
                                <div class="col-sm-9">
                                    <img id="showImgId" onclick="changPic()" alt="点击添加图片"
                                         src="${requestScope.get('obj').image}" style="height:
                                    100px;
                                    max-width: 500px;cursor: pointer">
                                    <input onchange="uploadPic('picId', 'imPicId', 'showImgId')"
                                           type="file" accept="image/*" id="picId" hidden>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 form-control-label">介绍</label>


                                <div class="col-sm-9">
                                <textarea name="content" required class="textarea"
                                          placeholder="请填写详情"
                                          style="width: 100%; height: 200px; font-size: 14px;
                                          line-height: 18px; border: 1px solid #dddddd; padding:
                                          10px;" data-msg="请输入详情">
                                    ${requestScope.get('obj').content}
                                </textarea>
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
            getJsp("/settings/admin/add", 'post', $("#formId").serialize());
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
