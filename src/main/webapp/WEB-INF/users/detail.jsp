<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/header.jsp" %>
<div class="container-fluid no-padding page-banner">
    <div class="padding-90"></div>
    <!-- Container -->
    <div class="container">
    </div><!-- Container /- -->
</div><!-- Page Banner /- -->
<main>
    <!-- Contact Section -->
    <div class="container-fluid no-padding contact-section">
        <!-- Container -->
        <div class="container">
            <h3></h3>
            <form class="row" action="/users/up" method="post" content="">
                <input hidden name="id" value="${requestScope.get('item').id}">
                <div style="margin-bottom: 20px" class="form-group col-md-12 col-sm-12 col-xs-12">
                    <img id="showImgId" onclick="changPic()" src="${requestScope.get('item').image}" alt="点击上传头像" title="点击上传头像"
                         style="height: 100px; cursor: pointer"/>

                    <input style="display: none" onchange="uploadPic('picId', 'imPicId', 'showImgId')" type="file" accept="image/*" id="picId" hidden/>
                </div>
                <input value="${requestScope.get('item').image}" type="text" hidden name="image" id="imPicId"/>
                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                    <input type="text" name="nickname" required  placeholder="用户昵称"
                           class="form-control" value="${requestScope.get('item').nickname}">
                    <input type="text" onfocus="this.type='password'" name="password" placeholder="密码(空则默认不修改)"
                           class="form-control">
                </div>
                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                    <input type="email" name="email" value="${requestScope.get('item').email}"  placeholder="邮箱" class="form-control">
                    <input type="number" maxlength="11" value="${requestScope.get('item').phone}" name="phone"   placeholder="手机号" class="form-control">
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <button id="" type="submit" title="确认修改">确认修改</button>
                </div>
            </form>
        </div>
    </div>
</main>
<script type="text/javascript">
    function changPic(){
        $("#picId").click()
    }
    $(function () {
        $("#headerId li").removeClass('active');
        $("#headerUserId").addClass('active');
        $("#footerId").hide();
    })
</script>

<%@ include file="/WEB-INF/common/footer.jsp" %>