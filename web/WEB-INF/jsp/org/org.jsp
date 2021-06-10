<%--
  ~ Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  ~ Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
  ~ Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
  ~ Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
  ~ Vestibulum commodo. Ut rhoncus gravida arcu.
  --%>

<%--
  Created by IntelliJ IDEA.
  User: caseycheng
  Date: 2021/6/8
  Time: 4:27 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String path = request.getContextPath(); %>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=path%>/resources/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/resources/css/dtree.css">
    <link rel="stylesheet" href="<%=path%>/resources/font/dtreefont.css">
</head>
<body>
<div class="layui-row">
    <div class="layui-col-xs3">
        <div>
            <button class="layui-btn layui-btn-normal" id="addBtn">新增</button>
        </div>
        <div id="orgTree" class="demo-tree demo-tree-box"></div>
    </div>
    <div class="layui-col-xs9">
        <div id="form_div" style="display: none">
            <form class="layui-form" lay-filter="orgInfo" id="orgFrom">
                <input name="id" style="display: none"/>
                <label class="layui-form-label">编辑</label>
                <div class="layui-form-item">
                    <label class="layui-form-label">机构全称</label>
                    <div class="layui-input-block">
                        <input type="text" name="orgFullName" required lay-verify="required" placeholder="请输入机构全称"
                               autocomplete=" off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">机构简称</label>
                    <div class="layui-input-block">
                        <input type="text" name="orgShort" required lay-verify="required" placeholder="请输入机构简称"
                               autocomplete=" off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">上级机构ID</label>
                    <div class="layui-input-block">
                        <%--                        <input type="number" name="parentId" required lay-verify="required" placeholder="请输入上级机构"--%>
                        <%--                               autocomplete=" off" class="layui-input">--%>
                        <ul id="dataTree1" name="parentId" class="dtree" data-id="0"></ul>
                    </div>
                </div>
                <%-- 提交按钮--%>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" id="save" lay-submit lay-filter="formDemo">保存</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
</body>
<script src="<%=path%>/resources/layui.js" charset="utf-8"></script>
<script>
    layui.extend({
        dtree: '{/}<%=path%>/resources/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
    }).use(['dtree'], function () {
        var $ = layui.$;
        var dtree = layui.dtree;
        dtree.render({
            elem: "#dataTree1",
            width: '350px',
            url: "<%=path%>/org/allTreeNode",
            method: 'GET',
            dataStyle: "layuiStyle",  //使用layui风格的数据格式
            select: true,
            response: {message: "msg", statusCode: 0},  //修改response中返回数据的定义
            selectInputName: {
                nodeId: "parentId"
            }
        });
    });


    layui.use(["tree", "util", "form"], function () {
        var tree = layui.tree
            , layer = layui.layer
            , util = layui.util
            , form = layui.form;
        var $ = layui.$;
        //模拟数据1
        var data = []
        initTreeData()
        //常规用法  渲染表格
        tree.render({
            elem: '#orgTree' //默认是点击节点可进行收缩
            , data: data
            , edit: ['del']
            , id: 'orgTree'
            //节点操作的回调方法
            , operate: function (obj) {
                var type = obj.type;
                var data = obj.data;
                var id = data.id;
                if (type === 'del') {
                    delOrg(id);
                }
            }
            , click: function (obj) {//点击节点的回调方法
                var nodeData = obj.data;
                console.log(obj.data)
                var formData = {
                    id: nodeData.id,
                    orgFullName: nodeData.filed,
                    orgShort: nodeData.title,
                    parentId: nodeData.pid
                }
                console.log(formData)
                form.val('orgInfo', formData)
                console.log(form.val('orgInfo'))
                $('#form_div').show();
            }
        });

        function reloadTree() {
            tree.reload('orgTree', {data: data});
        }

        //给新增按钮添加事件
        $('#addBtn').on('click', function () {
            $("#orgFrom")[0].reset();
            $('#form_div').show();
        })
        $('#save').on("click", function () {
            // save()
            master(save)

        })

        function master(func) {
            func()
            $("#orgFrom")[0].reset();
        }

        //获取tree节点信息
        function initTreeData() {
            $.ajax({
                url: '<%=path%>/org/allTreeNode'
                , async: false//设置同步请求
                , type: "GET"
                , dataType: "json"
                , contentType: "application/json"
                , success: function (res) {
                    if (res.code === 1) {
                        layer.msg(res.msg);
                        return;
                    }
                    data = res.data
                }
                , error: function (e) {
                    // layer.msg(res.err);
                }
            })
        }

        function save() {
            var org = form.val('orgInfo');//获取表单中的数据
            $.ajax({
                url: "<%=path%>/org/saveOrg"//将json提交到服务器
                , type: "POST"
                , contentType: "application/json"//
                , dataType: "json"
                , data: JSON.stringify(org)
                , success: function (res) {
                    if (res.code === 1) {
                        layer.msg(res.msg)
                    } else {
                        layer.msg()
                    }
                }
                , error: function (err) {
                    layer.msg(err, {icon: 2})
                }
            })
        }

        //删除树节点
        function delOrg(id) {
            $.ajax({
                url: '<%=path%>/org/deleteId/' + id
                , type: 'GET'
                , dataType: 'json'
                , success: function (res) {
                    console.log(res)
                    layer.msg(res.msg)
                    reloadTree()
                    if (res.code === 0) {
                        layer.msg(res.msg, {icon: 1})
                    } else {
                        layer.msg(res.msg, {icon: 2})
                    }
                }
                , error: function (err) {
                    console.log(err)
                    layer.msg(err.message, {icon: 2})
                }
            })
        }
    })
</script>

</html>
