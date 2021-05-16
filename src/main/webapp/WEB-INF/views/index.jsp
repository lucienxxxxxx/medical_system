<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>医疗系统</title>
    <%@include file="include/include.jsp"%>
    <link rel="stylesheet" href="${ctx }/layui/assets/css/index.css">

    <style>
        @media screen and (min-width: 1191px) {
            .layuimini-top-content {
                float: right;
            }
            .ew-banner .layui-container {
                min-height: 500px;
            }
        }
    </style>

</head>
<body>
<div class="ew-header">
    <a class="layui-logo" href="/">劳动创客系统</a>
    <div class="ew-nav-group">
        <div class="nav-toggle">
            <i class="layui-icon layui-icon-more-vertical"></i>
        </div>
        <ul class="layui-nav" lay-filter="ew-header-nav">
            <li class="layui-nav-item layui-this"><a href="/"
                                                     target="_self">首页</a></li>
            <li class="layui-nav-item"><a href="#" target="_blank">文档</a></li>
            <li class="layui-nav-item"><a href="${ctx}/login">登录</a></li>
        </ul>
    </div>
</div>

<div class="ew-banner"
     style="background-image:url(${ctx}/assets/images/index_logo.jpg);">
    <div class="layui-container">
        <div class="layuimini-top-content">
            <h1>基于创客探究活动的劳动课程</h1>
            <p>学生亲自动手，基于树莓派/Arduino组装智能菜园/花盆，通过剩菜/花卉培育，实现创客和劳动的结合</p>
        </div>
    </div>
</div>

<div class="section" nav-id="description" style="padding-bottom: 15px;">
    <div class="section-title">
        <h2>智慧菜园/花盆：劳动-创客-探究一体化解决方案</h2>
    </div>
    <div class="layui-container">
        <div class="layui-row">

            <div class="layui-col-md4 layui-col-sm6">
                <div class="feature">
                    <i class="layui-icon layui-icon-auz"></i>
                    <h3>劳动与创客结合</h3>
                    将学生们所掌握的知识转化为劳动实践活动
                </div>
            </div>

            <div class="layui-col-md4 layui-col-sm6">
                <div class="feature">
                    <i class="layui-icon layui-icon-chart-screen"></i>
                    <h3>创客与探究结合</h3>
                    融合创客教育与科学探究
                </div>
            </div>

            <div class="layui-col-md4 layui-col-sm6">
                <div class="feature">
                    <i class="layui-icon layui-icon-transfer"></i>
                    <h3>人工智能</h3>
                    通过传感器采集的土壤养分信息、植物生长时间、光照、温湿度与植物生长状态，构建深度学习模型，预测植物生长
                </div>
            </div>
        </div>
    </div>
</div>


<div class="footer-bottom copyright_info hidden-xs">
    Copyright © 2021 medicalsystem All rights reserved. | <a
        href="#" target="_blank"></a>
</div>
</body>
</html>
