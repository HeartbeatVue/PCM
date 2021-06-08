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

<span class="demoTable">
    搜索姓名：
    <div class="layui-inline">
        <input class="layui-input" name="username" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</span>

<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        <button class="layui-btn layui-btn-sm" lay-event="add">新增</button>
    </div>
</script>

<script type="text/html" id="switchTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="checkbox" name="sex" value="{{d.status}}" lay-skin="switch" lay-text="开启|关闭" disabled
           lay-filter="sexDemo" {{ d.status== '1' ?  'checked' : '' }}>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="<%=path%>/resources/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->

<script>
    layui.use('table', function () {
        var table = layui.table;
        var $ = layui.$;
        table.render({
            elem: '#test'
            , url: '<%=path%>/api/v1/Check/info'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            <%--, url: '<%=path%>/api/v1/users'--%>
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', width: 80, title: 'ID', sort: true}
                , {field: 'name', width: 80, title: '检查名称'}
                , {field: 'year', width: 80, title: '年度', sort: true}
                , {field: 'mouth', width: 80, title: '月份'}
                , {field: 'startDate', title: '开始时间', width: '15%'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                , {field: 'endDate', title: '结束时间', sort: true, width: "15%"}
                , {field: 'dept', title: '发起部门', sort: true, width: "10%"}
                , {field: 'checkObj', title: '检查对象', sort: true, width: "80"}
                , {field: 'checkCont', title: '检查内容', sort: true, width: "15%"}
                , {field: 'createDate', title: '创建时间', sort: true, width: "15%"}
                , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}

            ]]
            , page: true
        });
        //给搜索按钮绑定点击事件
        $('.demoTable .layui-btn').on('click', function () {
            //获取data-type按钮的reload
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;


                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            }
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    // obj.del();
                    delFromId(data.id)
                    layer.close(index);
                });
            } else if (obj.event === 'edit') {
                layer.prompt({
                    formType: 2
                    , value: data.email
                }, function (value, index) {
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }

        });

        function reloads() {
            var $ = layui.$
            var demoReload = $('#demoReload');
            //执行重载
            table.reload('test', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {
                    id: demoReload.val()
                }
            });

        }


        function delFromId(id) {
            //根据用户ID删除
            $.ajax({
                url: '<%=path%>/api/v1/Check/delete?id=' + id,
                type: "GET",
                dataType: 'json',//服务端返回给客户端的数据类型是json数据
                success: function (res) {
                    console.log(res)
                    /*设置延时*/
                    // layer.close(index)
                    reloads()
                }, error: function (err) {

                }
            })
        }

        function update() {
            // var userupdate = form.val('userUpdate');//获取表单中的数据
            $.ajax({
                url: '<%=path%>/api/v1/Check/update'
                , type: "POST"
                , dataType: 'json'
                , contentType: "application/json"//
                , data: JSON.stringify(/*userupdate*/)
                , success: function (res) {
                    console.log(res)
                    // layer.close(index);
                    // document.getElementById('userUpdate').reset();
                    $('#userUpdate form')[0].reset()
                    UserReload()
                })
        }

    });

</script>

</body>
</html>
