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
        //模拟数据1
        var data = [{
            title: '江西'
            , id: 1
            , children: [{
                title: '南昌'
                , id: 1000
                , children: [{
                    title: '青山湖区'
                    , id: 10001
                }, {
                    title: '高新区'
                    , id: 10002
                }]
            }, {
                title: '九江'
                , id: 1001
            }, {
                title: '赣州'
                , id: 1002
            }]
        }, {
            title: '广西'
            , id: 2
            , children: [{
                title: '南宁'
                , id: 2000
            }, {
                title: '桂林'
                , id: 2001
            }]
        }, {
            title: '陕西'
            , id: 3
            , children: [{
                title: '西安'
                , id: 3000
            }, {
                title: '延安'
                , id: 3001
            }]
        }]
        //常规用法  渲染表格
        tree.render({
            elem: '#test1' //默认是点击节点可进行收缩
            ,data: data
        });
    })
</script>

</html>
