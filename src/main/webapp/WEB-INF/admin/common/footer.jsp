<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- JavaScript files-->
<%--<footer class="main-footer">--%>
<%--    <div class="container-fluid">--%>
<%--        <div class="row">--%>
<%--            <div class="col-sm-6">--%>
<%--                <p>Your company &copy; 2017-2019</p>--%>
<%--            </div>--%>
<%--            <div class="col-sm-6 text-right">--%>
<%--                <p>Design by Bootstrapious.More Templates <a href="http://www.cssmoban.com/" target="_blank"--%>
<%--                                                             title="模板之家">模板之家</a> - Collect from <a--%>
<%--                        href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>--%>
<%--                <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</footer>--%>
</div>
</div>
</div>
<script src="/static/vendor/jquery/jquery.min.js"></script>
<script src="/static/vendor/popper.js/umd/popper.min.js"></script>
<script src="/static/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="/static/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="/static/vendor/chart.js/Chart.min.js"></script>
<script src="/static/vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="/static/js/charts-home.js"></script>
<script src="/static/js/common.js?a=1"></script>
<!-- Main File-->
<script src="/static/js/front.js"></script>
<script type="text/javascript">
 $(function () {
        $("#menuId a").click(function (e) {
            $("#menuId li").removeClass('active');
            // $("#menuId li a").attr('aria-expanded', false);
            $("#menuId li a").attr('aria-expanded', false);
            // $("#menuId li ul").removeClass('show');

            $(this).parents().addClass('active');
            var d = $("#menuId li").not("[class ^= active]");
            console.log($(d).children('ul').removeClass('show'));
        })
    });
</script>
</body>
</html>