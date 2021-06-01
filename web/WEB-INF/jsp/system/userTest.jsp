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
  <link rel="stylesheet" href="<%=path%>/resources/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="layui-btn-group demoTable">
  <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
  <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
  <button class="layui-btn" data-type="isAll">验证是否全选</button>
</div>

<table class="layui-table" lay-data="{width: 1100, height:500, url:'<%=path%>/System/users', page:true, id:'idTest'}" lay-filter="demo">
  <thead>
  <tr>
    <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
    <th lay-data="{field:'id', width:60, sort: true, fixed: true}">ID</th>
    <th lay-data="{field:'username', width:80}">用户名</th>
    <th lay-data="{field:'name', width:80}">名字</th>
<%--    <th lay-data="{field:'status', width:80, sort: true}">状态</th>--%>
    <th lay-data="{field:'phone', width:140}">电话号码</th>
    <th lay-data="{field:'email', width:160}">邮箱</th>
    <th lay-data="{field:'orgId', width:80, sort: true}">系部</th>
    <th lay-data="{field:'createDate',width:180,sort:true}">创建时间</th>
    <th lay-data="{field:'status', title:'账号状态', width:120, templet: '#switchTpl', unresize: true}">账号状态</th>
    <th lay-data="{fixed: 'right', width:160, align:'center', toolbar: '#barDemo'}">操作</th>
  </tr>
  </thead>
  <script type="text/html" id="switchTpl">
    <!-- 这里的 checked 的状态只是演示 -->
    <input type="checkbox" name="sex" value="{{d.status}}" lay-skin="switch" lay-text="开启|关闭" disabled lay-filter="sexDemo" {{ d.status == '1' ?  'checked' : '' }}>
  </script>
</table>


<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


<script src="<%=path%>/resources/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
  layui.use('table', function(){
    var table = layui.table;
    //监听表格复选框选择
    table.on('checkbox(demo)', function(obj){
      console.log(obj)
    });
      function delUser(id) {
          //根据用户ID删除
          $.ajax({
              url: '<%=path%>/System/delUser/' + id,
              type: "GET",
              dataType: 'json',//服务端返回给客户端的数据类型是json数据
              success: function (res) {

              }, error: function () {

              }
          })
      }
    //监听工具条
    table.on('tool(demo)', function(obj){
      var data = obj.data;
      if(obj.event === 'detail'){
        layer.msg('ID：'+ data.id + ' 的查看操作');
      } else if(obj.event === 'del'){
        layer.confirm('真的删除行么', function(index){
          delUser(id);
          layer.close(index);
        });
      } else if(obj.event === 'edit'){
        layer.alert('编辑行：<br>'+ JSON.stringify(data))
      }
    });

    var $ = layui.$, active = {
      getCheckData: function(){ //获取选中数据
        var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      }
      ,getCheckLength: function(){ //获取选中数目
        var checkStatus = table.checkStatus('idTest')
                ,data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      }
      ,isAll: function(){ //验证是否全选
        var checkStatus = table.checkStatus('idTest');
        layer.msg(checkStatus.isAll ? '全选': '未全选')
      }
    };

    $('.demoTable .layui-btn').on('click', function(){
      var type = $(this).data('type');
      active[type] ? active[type].call(this) : '';
    });
  });
</script>

</body>
</html>