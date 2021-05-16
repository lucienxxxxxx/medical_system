<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="include/include.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>注册</title>
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
            <div class="layui-card-body">
                <form class="layui-form" style="max-width: 700px;margin: 40px auto;">
                    <div class="layui-form-item">
                        <div class="layui-card-header">用户注册</div>
                        <div class="layui-form-item">
                            <label class="layui-form-label layui-form-required">用户名</label>
                            <div class="layui-input-block">
                                <input name="username" placeholder="请输入用户名" type="text" class="layui-input"
                                       maxlength="20"
                                       lay-verType="tips" lay-verify="required" required/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label layui-form-required">密码</label>
                            <div class="layui-input-block">
                                <input name="password" placeholder="请输入密码" type="text" class="layui-input"
                                       maxlength="20"
                                       lay-verType="tips" lay-verify="required" required/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label layui-form-required">确认密码</label>
                            <div class="layui-input-block">
                                <input name="passwordCheck" placeholder="请再次输入密码" type="text" class="layui-input"
                                       maxlength="20"
                                       lay-verType="tips" lay-verify="required" required/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label layui-form-required">真实姓名</label>
                            <div class="layui-input-block">
                                <input name="realName" placeholder="请输入真实姓名" type="text" class="layui-input"
                                       maxlength="20"
                                       lay-verType="tips" lay-verify="required" required/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label layui-form-required">年龄</label>
                            <div class="layui-input-block">
                                <input name="age" placeholder="请输入年龄" type="text" class="layui-input"
                                       maxlength="20"
                                       lay-verType="tips" lay-verify="required" required/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label layui-form-required">手机号码</label>
                            <div class="layui-input-block">
                                <input name="phone" placeholder="请输入手机号码" type="text" class="layui-input"
                                       maxlength="20"
                                       lay-verType="tips" lay-verify="required" required/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label layui-form-required">性别</label>
                            <div class="layui-input-block">
                                <input type="radio" name="gender" value="男" title="男" checked/>
                                <input type="radio" name="gender" value="女" title="女"/>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">省市区：</label>
                            <div class="layui-input-block">
                                <input id="location" placeholder="请选择" class="layui-hide">
                            </div>
                        </div>
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-filter="formSubmitBas" lay-submit>&emsp;注册&emsp;
                            </button>
                            <button type="reset" class="layui-btn layui-btn-primary">&emsp;重置&emsp;</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>


</div>

<script type="text/javascript" src="/layui/assets/module/cascader/citys-data.js"></script>
<script>
    layui.use(['layer', 'form', 'laydate', 'cascader'], function () {
        var cascader = layui.cascader;
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;


        // 省市区选择
        cascader.render({
            elem: '#location',
            data: citysData,
            itemHeight: '250px',
            filterable: true
        });

        // 渲染laydate
        laydate.render({
            elem: '#edtDateFormBas',
            range: true
        });

        // 监听表单提交
        form.on('submit(formSubmitBas)', function (data){
            var url="/register/add"
            if (data.password==data.passwordCheck){
                layer.load(2);
                $.post(url, data.field, function (res) {
                    layer.closeAll('loading');
                    if (res.code == 200) {
                        console.log(data.field);
                        layer.msg(res.msg, {icon: 1, time: 1500}, function () {
                            location.replace('/login')
                        });
                    } else if (res.code==0){
                        layer.msg(res.msg, {icon: 2,time: 1500});
                    }
                }, 'json');
            }else{
                layer.msg("密码不一致", {icon: 2,time: 1500});
            }



            return false;
        });


    });


</script>

</body>
</html>