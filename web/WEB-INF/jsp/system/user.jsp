<%--
  Created by IntelliJ IDEA.
  User: caseycheng
  Date: 2021/5/19
  Time: 11:39 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path%>/resources/css/layui.css" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<%--<span>--%>
<span class="demoTable">
    搜索姓名：
    <div class="layui-inline">
        <input class="layui-input" name="username" id="demoReload" autocomplete="off">
    </div>
<%--    <button class="layui-btn" data-type="reload">搜索</button>--%>
</span>

<span class="demoTable">
    搜索ID：
    <div class="layui-inline">
        <input class="layui-input" name="id" id="demoReload1" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</span>

<table class="layui-hide" id="test" lay-filter="test"></table>
<%--TODO 添加用户数据表单弹出框--%>
<div id="userFormDialog" style="display: none"><%--隐藏div--%>
    <form class="layui-form" id="userForm" lay-filter="userForm" style="padding-top: 15px">
        <div class="layui-inline">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required|name" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="username" autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--第二行--%>
        <div class="layui-inline">
            <label class="layui-form-label">手机</label>
            <div class="layui-input-inline">
                <input type="tel" name="phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" autocomplete="off" class="layui-input">
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">机构</label>
                <div class="layui-input-inline">
                    <input type="tel" name="orgId" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-inline">
                    <select name="status">
                        <option value="1">启用</option>
                        <option value="0">停用</option>
                    </select>
                </div>
            </div>
        </div>
    </form>
</div>
<%--TODO 更新用户数据表单弹出框--%>
<div id="userUpdate" style="display: none"><%--隐藏div--%>
    <form class="layui-form" id="userUpdate" lay-filter="userUpdate" style="padding-top: 15px">
        <input name="id" style="display: none">
        <div class="layui-inline">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" lay-verify="required|name" autocomplete="off" class="layui-input"
                       lay-data="{field:'name', width:140}">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="username" autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--第二行--%>
        <div class="layui-inline">
            <label class="layui-form-label">手机</label>
            <div class="layui-input-inline">
                <input type="tel" name="phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">机构</label>
                <div class="layui-input-inline">
                    <input type="tel" name="orgId" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">状态</label>
                <div class="layui-input-inline">
                    <select name="status">
                        <option value="1">启用</option>
                        <option value="0">停用</option>
                    </select>
                </div>
            </div>
        </div>
    </form>
</div>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-group demoTable">
        <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
        <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
        <button class="layui-btn" data-type="isAll">验证是否全选</button>
        <button class="layui-btn" data-type="add">新增</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    <a class="layui-btn layui-btn-xs layui-btn-checked" lay-event="add">新增</a>
</script>

<script type="text/html" id="switchTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="checkbox" name="sex" value="{{d.status}}" lay-skin="switch" lay-text="开启|关闭" disabled
           lay-filter="sexDemo" {{ d.status== '1' ?  'checked' : '' }}>
</script>
<script src="<%=path%>/resources/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
    layui.use(['table', 'form'], function () {
        var table = layui.table;
        var form = layui.form;
        table.render({
            elem: '#test'
            , url: '<%=path%>/System/users'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            <%--, url: '<%=path%>/api/v1/users'--%>
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', width: 80, title: 'ID', sort: true}
                , {field: 'username', width: 80, title: '用户名', sort: true}
                , {field: 'name', width: 80, title: '姓名', sort: true}
                , {field: 'phone', width: 120, title: '电话', sort: true}
                , {field: 'email', title: '邮箱', width: '160'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                , {field: 'orgId', title: '机构', sort: true, width: "80"}
                , {field: 'status', title: '状态', sort: true, width: "80"}
                , {field: 'status', title: '账号状态', width: 120, templet: '#switchTpl', unresize: true}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 180}
            ]]
            , page: true
            , autoSort: false
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            //判断点击的是什么按钮
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    delUser(data.id);
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                //TODO 使用编辑用户方法
                openFormDiam("编辑用户", data, $('#userUpdate'), () => update(data))
            } else if (obj.event === "add") {
                //TODO 使用添加方法
                //弹出一个信息框
                openFormDiam("新增用户", null, $('#userFormDialog'), () => saveUser(this.yes.index))
                console.log("add")
            }
        });
        // TODO 创建弹出框方法
        // 创建弹出框
        function openFormDiam(title, data, id, func) {
            if (data != null) {
                console.log(data)
                form.val('userUpdate', data);
            }
            layer.open({
                title: title//弹出层标题
                , type: 1//弹出层类型
                , content: id //ID选择
                , skin: 'layui-layer-molv'//弹出层皮肤
                , area: ['500px', '300px']//弹出层宽高
                , btnAlign: 'c'//弹出层对其方式
                , btn: ['保存', '取消']
                , yes: function (index, layer) {
                    //保存按钮的回调方法,index是弹出层的id
                    func();
                    // saveUser(index)
                    // update(id)
                }
                , btn2: function (index, layer) {
                    //取消按钮的回调方法,index是弹出层的id
                }
                , closeBtn: function () {
                    //点击右上角关闭
                }
            })
        }


        //TODO 这是一大波方法
        //TODO ajax保存用户数据
        function saveUser(index) {
            var form = layui.form;
            var $ = layui.$
            var user = form.val('userForm');//获取表单中的数据
            $.ajax({
                url: "<%=path%>/System/save"//将json提交到服务器
                , type: "POST"
                , contentType: "application/json"//
                , dataType: "json"
                , data: JSON.stringify(user)
                , success: function (res) {
                    //关闭弹出框
                    layer.close(index);
                    //弹出层提示信息
                    // msgBox(res);
                    //刷新表格数据
                    $("#userForm")[0].reset();
                    UserReload()
                }
                , error: function (err) {
                    // layer.msg(err,{icon:2})
                }
            })
        }

        //TODO ajax通过ID更新的主方法
        function update() {
            var form = layui.form;
            var $ = layui.$
            var userUpdate = form.val('userUpdate');//获取表单中的数据
            $.ajax({
                url: '<%=path%>/System/update'
                , type: "POST"
                , dataType: 'json'
                , contentType: "application/json"//
                , data: JSON.stringify(userUpdate)
                , success: function (res) {
                    console.log(res)
                    // layer.close(index);
                    $("#userUpdate")[0].reset();
                    UserReload()
                }
            })
        }

        //TODO ajax通过ID删除
        function delUser(id) {
            //根据用户ID删除
            $.ajax({
                url: '<%=path%>/System/delUser?id=' + id,
                type: "GET",
                dataType: 'json',//服务端返回给客户端的数据类型是json数据
                success: function (res) {
                    console.log(res)
                    /*设置延时*/
                    // layer.close(index)
                    UserReload()
                    // UserReload()
                }, error: function (err) {

                }
            })
        }
        //TODO 用户表格重载
        var $ = layui.$, active = {

            reload: function () {
                //用户表格重载
                UserReload();
            }
        };
        //表格数据重载实现方法
        function UserReload() {
            var $ = layui.$
            //获取input输入框的demoReload对象
            var demoReload = $('#demoReload');
            var demoReload1 = $('#demoReload1');
            var table = layui.table;
            //执行重载，第一个参数是表格的ID
            table.reload('test', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    //获取输入框中的值
                    name: demoReload.val(),
                    id: demoReload1.val()
                }
            });
        }
    });
</script>

</body>
</html>
