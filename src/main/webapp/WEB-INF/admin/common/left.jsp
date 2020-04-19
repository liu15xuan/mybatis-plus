<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="#" onclick="toIndex()"><i class="menu-icon fa fa-laptop"></i>首页 </a>
                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>广告管理</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="fa fa-id-badge"></i><a onclick="getJsp('/banner/admin/list', 'get', 'current=1&size=5')" href="#">轮播图列表</a></li>
                        <li><i class="fa fa-bars"></i><a onclick="getJsp('/banner/admin/add', 'get', '')" href="#">添加轮播图</a></li>

                        <li><a onclick="getJsp('/pics/admin/list', 'get', 'current=1&size=5')" href="#">展示图列表</a></li>
                        <li><i class="fa fa-exclamation-triangle"></i><a onclick="getJsp('/pics/admin/add', 'get', '')" href="#">添加展示图</a></li>
                    </ul>
                </li>
                <li>
                    <a onclick="getJsp('/comments/admin/list', 'get', 'current=1&size=5')" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>评论管理</a>
                </li>
                <li>
                    <a onclick="getJsp('/orders/admin/list', 'get', 'current=1&size=5')" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>订单管理</a>
                </li>
                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>服务管理</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-fort-awesome"></i><a onclick="getJsp('/pro/admin/list', 'get', 'current=1&size=5')" href="#">服务列表</a></li>
                        <li><i class="menu-icon ti-themify-logo"></i><a onclick="getJsp('/pro/admin/add', 'get', '')" href="#">添加服务</a></li>
                    </ul>
                </li>

                <li class="menu-item-has-children dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>用户管理</a>
                    <ul class="sub-menu children dropdown-menu">
                        <li><i class="menu-icon fa fa-line-chart"></i><a onclick="getJsp('/users/admin/list', 'get', 'current=1&size=5')" href="#">用户列表</a></li>
                        <li><i class="menu-icon fa fa-area-chart"></i><a onclick="getJsp('/users/admin/add', 'get', '')" href="#">添加用户</a></li>
                    </ul>
                </li>
                <li>
                    <a onclick="getJsp('/settings/admin/add', 'get', '')" href="#"> <i class="menu-icon ti-email"></i>网站设置 </a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside>
<script type="text/javascript">
    function toIndex(){
        window.location.href = '/admin/index';
    }
</script>