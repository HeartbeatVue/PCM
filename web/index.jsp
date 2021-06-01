<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: caseycheng
  Date: 2021/5/19
  Time: 8:32 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*获取应用上下文*/
    String path = request.getContextPath();
    response.sendRedirect(path+"/main/index");
%>
<html>
<head>
    <title>网站导航</title>
</head>
<body>
<button type="button" class="btn btn-primary btn-block"><a class="rowColor" href="<c:url value="/main/index"/>"
                                                           style="text-decoration: none;">项目检查记录系统</a></button>
</body>
</html>
