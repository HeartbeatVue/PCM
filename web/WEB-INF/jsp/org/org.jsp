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
</head>
<body>
<div class="layui-row">
    <div class="layui-col-xs3">
        <div>
            <button class="layui-btn layui-btn-normal">新增</button>
        </div>
        <div id="test1" class="demo-tree demo-tree-box"></div>
    </div>
    <div class="layui-col-xs9">

    </div>
</div>
</body>
<script src="<%=path%>/resources/layui.js" charset="utf-8"></script>
<script>
    layui.use(["tree", "util", "form"], function () {
        var tree = layui.tree
            , layer = layui.layer
            , util = layui.util
            , form = layui.form;
        var $ = layui.$;
        //模拟数据1
        var data = [{

        }]
        initTreeData()
        //常规用法  渲染表格
        tree.render({
            elem: '#test1' //默认是点击节点可进行收缩
            , data: data
        });

        //获取tree节点信息
        function initTreeData() {
            $.ajax({
                url: '<%=path%>/org/allTreeNode'
                , async: false//设置同步请求
                , type: "GET"
                , dataType: "json"
                , contentType: "application/json"
                , success: function (res) {
                    data = res.data
                }
                , error: function (e) {

                }
            })
        }
    })
</script>

</html>
