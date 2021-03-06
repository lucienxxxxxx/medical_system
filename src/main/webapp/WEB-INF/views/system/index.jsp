<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="./assets/images/favicon.ico" rel="icon">
    <title>医疗系统</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!-- 头部 -->
    <div class="layui-header">
        <div class="layui-logo">
            <img src="/layui/img/logo.png"/>
            <cite>  医疗系统</cite>
        </div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item" lay-unselect>
                <a ew-event="flexible" title="侧边伸缩"><i class="layui-icon layui-icon-shrink-right"></i></a>
            </li>
            <li class="layui-nav-item" lay-unselect>
                <a ew-event="refresh" title="刷新"><i class="layui-icon layui-icon-refresh-3"></i></a>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item" lay-unselect>
                <a ew-event="message" title="消息">
                    <i class="layui-icon layui-icon-notice"></i>
                    <span class="layui-badge-dot"></span>
                </a>
            </li>
            <li class="layui-nav-item" lay-unselect>
                <a ew-event="note" title="便签"><i class="layui-icon layui-icon-note"></i></a>
            </li>
            <li class="layui-nav-item layui-hide-xs" lay-unselect>
                <a ew-event="fullScreen" title="全屏"><i class="layui-icon layui-icon-screen-full"></i></a>
            </li>
            <li class="layui-nav-item layui-hide-xs" lay-unselect>
                <a ew-event="lockScreen" title="锁屏"><i class="layui-icon layui-icon-password"></i></a>
            </li>
            <li class="layui-nav-item" lay-unselect>
                <a>
                    <img src="assets/images/head.png" class="layui-nav-img">
                    <cite>管理员</cite>
                </a>
                <dl class="layui-nav-child">
                    <dd lay-unselect><a ew-href="/user/info">个人中心</a></dd>
                    <dd lay-unselect><a ew-event="psw">修改密码</a></dd>
                    <hr>
                    <dd lay-unselect><a ew-event="logout" data-url="page/template/login.html">退出</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" lay-unselect>
                <a ew-event="theme" title="主题"><i class="layui-icon layui-icon-more-vertical"></i></a>
            </li>
        </ul>
    </div>

    <!-- 侧边栏 -->
    <div class="layui-side">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree arrow2" lay-filter="admin-side-nav" lay-shrink="all">
                <li class="layui-nav-item">
                    <a><i class="layui-icon layui-icon-home"></i>&emsp;<cite>主页</cite></a>
                    <dl class="layui-nav-child">
                        <dd><a lay-href="/user/info">个人中心</a></dd>
                        <dd><a lay-href="/layui/page/console/workplace.html">健康状况</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a><i class="layui-icon layui-icon-set"></i>&emsp;<cite>管理中心</cite></a>
                    <dl class="layui-nav-child">
                        <dd><a lay-href="/medical/index">药箱</a></dd>
                        <dd><a lay-href="/user/index">用户管理</a></dd>
                        <dd><a lay-href="/">家庭成员</a></dd>
                        <dd><a lay-href="page/system/loginRecord.html">登录日志</a></dd>
                    </dl>
                </li>

            </ul>
        </div>
    </div>

    <!-- 主体部分 -->
    <div class="layui-body"></div>
    <!-- 底部 -->
    <div class="layui-footer layui-text">
        copyright © 2021 <a href="http://mediaclsystem.com" target="_blank">mediaclsystem.com</a> all rights reserved.
        <span class="pull-right">Version 1.0.0</span>
    </div>
</div>

<!-- 加载动画 -->
<div class="page-loading">
    <div class="ball-loader">
        <span></span><span></span><span></span><span></span>
    </div>
</div>

<script>
    layui.use(['index'], function () {
        var $ = layui.jquery;
        var index = layui.index;

        // 默认加载主页
        index.loadHome({
            menuPath: '/medical/index',
            menuName: '<i class="layui-icon layui-icon-home"></i>'
        });

    });
</script>
</body>
</html>