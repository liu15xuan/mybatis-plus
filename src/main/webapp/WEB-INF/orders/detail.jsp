<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/header.jsp" %>
<div class="container-fluid no-padding page-banner">
    <div class="padding-90"></div>
    <!-- Container -->
    <div class="container">
    </div><!-- Container /- -->
</div>
<div class="padding-50"></div>
<div class="container">
    <div class="welcome-content-box">
        <div class="row">
            <div class="col-md-6 col-sm-12 col-xs-12 welcom-box">
                <h3>订单车辆进度</h3>
                <c:if test="${requestScope.get('item').status == 0}">
                    等待商家确认接单
                </c:if>
                <c:if test="${requestScope.get('item').status != 0}">
                    ${requestScope.get('item').mark}
                </c:if>
            </div>
            <c:if test="${requestScope.get('item').status == 2 || requestScope.get('item').status == 3}">
                <div class="col-md-6 col-sm-12 col-xs-12 welcom-box">
                    <h4>我的评价:</h4>
                    <form method="post" action="/comments/add" style="border: none; padding: unset">
                        <input name="proId" value="${requestScope.get('item').proId}" hidden>
                        <input name="usersId" value="${requestScope.get('item').usersId}" hidden>
                        <input name="orderId" value="${requestScope.get('item').id}" hidden>
                        <div class="form-group">
                            <textarea name="content" class="form-control" rows="8" style="resize:none"> <c:if
                                    test="${requestScope.comment ne null}"> ${requestScope.get('comment').content}
                            </c:if>
                            </textarea>
                        </div>
                        <div class="form-group">
                            <button>提交评价</button>
                        </div>
                    </form>
                </div>
            </c:if>
        </div>
    </div>
</div>
<div class="padding-60"></div>
<script type="text/javascript">
    $(function () {
        $("#navbar ul li").removeClass('active');
        $("#headerOrderId").addClass("active");
    });
</script>
<!-- Container /- -->
<%@ include file="/WEB-INF/common/footer.jsp" %>
