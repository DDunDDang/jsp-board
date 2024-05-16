<%--
  Created by IntelliJ IDEA.
  User: songjunsang
  Date: 5/15/24
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP 게시판</title>
</head>
<body>
    <%
        session.invalidate();
    %>
    <script>
        location.href = 'main.jsp';
    </script>
</body>
</html>

