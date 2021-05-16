<%@include file="include/include.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>登录</title>
    <script>
        if (window != top) {
            top.location.replace(location.href);
        }
    </script>
</head>
<body>
<div class="login-wrapper">
    <div class="login-header">
        <img src="/layui/img/logo.png"> 医疗系统
    </div>
    <div class="login-body">
        <div class="layui-card">
            <div class="layui-card-header">
                <i class="layui-icon layui-icon-engine"></i>&nbsp;&nbsp;用户登录
            </div>
            <form class="layui-card-body layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i></label>
                    <div class="layui-input-block">
                        <input name="username" type="text" placeholder="用户名" class="layui-input"
                               lay-verType="tips" lay-verify="required" required/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
                    <div class="layui-input-block">
                        <input name="password" type="password" placeholder="密码" class="layui-input"
                               lay-verType="tips" lay-verify="required" required/>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><i class="layui-icon layui-icon-vercode"></i></label>
                    <div class="layui-input-block">
                        <div class="layui-row inline-block">
                            <div class="layui-col-xs7">
                                <input name="code" type="text" placeholder="验证码" class="layui-input"
                                       autocomplete="off" lay-verType="tips" lay-verify="required" required/>
                            </div>
                            <div class="layui-col-xs5" style="padding-left: 6px;">
                                <img class="login-captcha" src="https://www.oschina.net/action/user/captcha">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <a href="/register" class="layui-link">帐号注册</a>
                    <a href="javascript:;" class="layui-link pull-right">忘记密码？</a>
                </div>
                <div class="layui-form-item">
                    <button lay-filter="login-submit" class="layui-btn layui-btn-fluid" lay-submit>登 录</button>
                </div>
                <div class="layui-form-item login-other">
                    <label>第三方登录</label>
                    <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                    <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
                    <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>
                </div>
            </form>
        </div>
    </div>

    <div class="login-footer">
        <p>© 2019 medicalsystem.com 版权所有</p>
    </div>
</div>


<script>
    layui.use(['layer', 'form'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;

        // 表单提交
        form.on('submit(login-submit)', function (obj) {
            console.log(obj.field);
            var url="/login/check"
            layer.load(2);
            $.post(url, data.field, function (res) {
                layer.closeAll('loading');
                if (res.code == 200) {
                    console.log(data.field);
                    layer.msg(res.msg, {icon: 1, time: 1500}, function () {
                        location.replace('/system/index')
                    });
                } else if (res.code==0){
                    layer.msg(res.msg, {icon: 2,time: 1500});
                }
            }, 'json');
            return false;
        });

        // 图形验证码
        $('.login-captcha').click(function () {
            this.src = this.src + '?t=' + (new Date).getTime();
        });
    });
</script>
</body>
</html>