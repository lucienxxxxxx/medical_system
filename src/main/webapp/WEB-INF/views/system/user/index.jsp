<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>医疗系统</title>
    <%@include file="../../include/include.jsp"%>
</head>
<body>
<!-- 页面加载loading -->
<div class="page-loading">
    <div class="ball-loader">
        <span></span><span></span><span></span><span></span>
    </div>
</div>
<!-- 正文开始 -->
<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body table-tool-mini full-table">
            <div class="layui-form toolbar">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label w-auto">用户名：</label>
                        <div class="layui-input-inline mr0">
                            <input name="username" class="layui-input" type="text" placeholder="输入账号"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label w-auto">真实姓名：</label>
                        <div class="layui-input-inline mr0">
                            <input name="realName" class="layui-input" type="text" placeholder="输入用户名"/>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label w-auto">性&emsp;别：</label>
                        <div class="layui-input-inline mr0">
                            <select name="gender">
                                <option value="">选择性别</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline" style="padding-right: 110px;">
                        <button class="layui-btn icon-btn" lay-filter="formSubSearchUser" lay-submit>
                            <i class="layui-icon">&#xe615;</i>搜索
                        </button>
                        <button id="btnAddUser" class="layui-btn icon-btn"><i class="layui-icon">&#xe654;</i>添加</button>
                    </div>
                </div>
            </div>

            <table id="tableUser" lay-filter="tableUser"></table>
        </div>
    </div>
</div>

<!-- 表格操作列 -->
<script type="text/html" id="tableBarUser">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs" lay-event="reset">重置密码</a>
</script>
<!-- 表格状态列 -->
<script type="text/html" id="tableStateUser">
    <input type="checkbox" lay-filter="ckStateUser" value="{{d.userId}}" lay-skin="switch"
           lay-text="正常|锁定" {{d.state==0?'checked':''}}/>
</script>
<!-- 表单弹窗 -->
<script type="text/html" id="modelUser">
    <form id="modelUserForm" lay-filter="modelUserForm" class="layui-form model-form">
        <input name="id" type="hidden" value="0"/>
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">用户名</label>
            <div class="layui-input-block">
                <input name="username" id="username" placeholder="请输入用户名" type="text" class="layui-input" maxlength="20"
                       lay-verType="tips" lay-verify="required" required/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">真实姓名</label>
            <div class="layui-input-block">
                <input name="realName" placeholder="请输入真实姓名" type="text" class="layui-input" maxlength="20"
                       lay-verType="tips" lay-verify="required" required/>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label layui-form-required">学号</label>
            <div class="layui-input-block">
                <input name="studentNo" placeholder="请输入学号" type="text" class="layui-input" maxlength="20"
                       lay-verType="tips" lay-verify="required" required/>
            </div>
        </div>
        <div class="layui-form-item" name="passwd">
            <label class="layui-form-label layui-form-required">密码</label>
            <div class="layui-input-block">
                <input name="password" placeholder="请输入密码" type="password" class="layui-input" maxlength="20"
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
            <label class="layui-form-label layui-form-required">角色</label>
            <div class="layui-input-block">
                <select name="role" lay-verType="tips" lay-verify="required">
                    <option value="">请选择角色</option>
                    <option value="管理员">管理员</option>
                    <option value="教师">教师</option>
                    <option value="学生" selected>学生</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item text-right">
            <button class="layui-btn layui-btn-primary" type="button" ew-event="closePageDialog">取消</button>
            <button class="layui-btn" lay-filter="modelSubmitUser" lay-submit>保存</button>
        </div>
    </form>
</script>

<script>
    layui.use(['layer', 'form', 'table', 'util', 'admin'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var util = layui.util;
        var admin = layui.admin;

        // 渲染表格
        var insTb = table.render({
            elem: '#tableUser',
            url: '/user/list.json',
            page: true,
            toolbar: true,
            cellMinWidth: 100,
            cols: [[
                {type: 'numbers'},
                {field: 'username', sort: true, title: '用户名'},
                {field: 'realName', sort: true, title: '真实姓名'},
                {field: 'role', sort: true, title: '角色'},
                {field: 'gender', sort: true, title: '性别'},
                {
                    field: 'createTime', sort: true, templet: function (d) {
                        return util.toDateString(d.createTime);
                    }, title: '创建时间'
                },
                // {field: 'state', sort: true, templet: '#tableStateUser', title: '状态'},
                {align: 'center', toolbar: '#tableBarUser', title: '操作', minWidth: 200}
            ]]
        });

        // 添加
        $('#btnAddUser').click(function () {
            showEditModel();
        });

        // 搜索
        form.on('submit(formSubSearchUser)', function (data) {
            insTb.reload({where: data.field}, 'data');
        });

        // 工具条点击事件
        table.on('tool(tableUser)', function (obj) {
            var data = obj.data;
            var layEvent = obj.event;
            if (layEvent === 'edit') { // 修改
                showEditModel(data);
            } else if (layEvent === 'del') { // 删除
                doDel(data.id, data.realName);
                // console.log("删除>>>"+eval(data))
            } else if (layEvent === 'reset') { // 重置密码
                resetPsw(data.id, data.realName);
            }
        });

        // 显示表单弹窗
        function showEditModel(mUser) {
            admin.open({
                type: 1,
                title: (mUser ? '修改' : '添加') + '用户',
                content: $('#modelUser').html(),
                success: function (layero, dIndex) {
                    $(layero).children('.layui-layer-content').css('overflow', 'visible');
                    var url = "/user/saveOrUpdate";
                    //mUser && (mUser.roleId = mUser.roles[0].roleId);
                    // 回显数据
                    if (mUser==null||mUser===undefined){

                    }else{
                        $("[name='username']").attr("readOnly","readOnly");
                        $("[name='passwd']").css("display","none");
                        console.log($("[name='username']").valueOf());
                    }
                    form.val('modelUserForm', mUser);
                    // 表单提交事件
                    form.on('submit(modelSubmitUser)', function (data) {
                        layer.load(2);
                        $.get(url, data.field, function (res) {
                            layer.closeAll('loading');
                            if (res.code == 200) {
                                layer.close(dIndex);
                                layer.msg(res.msg, {icon: 1});
                                insTb.reload({}, 'data');
                            } else {
                                layer.msg(res.msg, {icon: 2});
                            }
                        }, 'json');
                        return false;
                    });
                }
            });
        }

        // 删除
        function doDel(id, realName) {
            layer.confirm('确定要删除“' + realName + '”吗？', {
                skin: 'layui-layer-admin',
                shade: .1
            }, function (i) {
                layer.close(i);
                layer.load(2);
                $.post('/user/delete', {
                    id: id
                }, function (res) {
                    layer.closeAll('loading');
                    if (res.code == 200) {
                        layer.msg(res.msg, {icon: 1});
                        insTb.reload({}, 'data');
                    } else {
                        layer.msg(res.msg, {icon: 2});
                    }
                }, 'json');
            });
        }

        // 修改用户状态
        form.on('switch(ckStateUser)', function (obj) {
            layer.load(2);
            $.get('../../json/ok.json', {
                userId: obj.elem.value,
                state: obj.elem.checked ? 0 : 1
            }, function (res) {
                layer.closeAll('loading');
                if (res.code == 200) {
                    layer.msg(res.msg, {icon: 1});
                } else {
                    layer.msg(res.msg, {icon: 2});
                    $(obj.elem).prop('checked', !obj.elem.checked);
                    form.render('checkbox');
                }
            }, 'json');
        });

        // 重置密码
        function resetPsw(id, realName) {
            layer.confirm('确定要重置“' + realName + '”的登录密码吗？', {
                skin: 'layui-layer-admin',
                shade: .1
            }, function (i) {
                layer.close(i);
                layer.load(2);
                $.post('/user/resetPassword', {
                    id: id
                }, function (res) {
                    layer.closeAll('loading');
                    if (res.code == 200) {
                        layer.msg(res.msg, {icon: 1});
                    } else {
                        layer.msg(res.msg, {icon: 2});
                    }
                }, 'json');
            });
        }

    });
</script>

</body>
</html>
