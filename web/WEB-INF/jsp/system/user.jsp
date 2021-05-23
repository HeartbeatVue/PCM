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

<table class="layui-hide" id="test"></table>


<script src="<%=path%>/resources/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->

<script>
    layui.use('table', function () {
        var table = layui.table;

        table.render({
            elem: '#test'
            , url: '<%=path%>/System/users'
            <%--, url: '<%=path%>/api/v1/users'--%>
            , cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            , cols: [[
                {field: 'id', width: 80, title: 'ID', sort: true}
                , {field: 'username', width: 80, title: '用户名'}
                , {field: 'name', width: 80, title: '姓名', sort: true}
                , {field: 'phone', width: 80, title: '电话'}
                , {field: 'email', title: '邮箱', width: '30%'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                , {field: 'orgid', title: '机构', sort: true}
                , {field: 'status', title: '状态', sort: true}

            ]]
            , page: true
        });
    });
</script>

</body>
</html>
