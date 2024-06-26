<%--
  Created by IntelliJ IDEA.
  User: songjunsang
  Date: 5/16/24
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <meta name="viewport" content="width=device-width", initial-scale="1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
    <title>JSP 게시판</title>
</head>
<body>
    <%
        String userID = null;
        if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
        }
    %>
    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="main.jsp">JSP 게시판</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="main.jsp">메인</a></li>
                <li><a href="board.jsp">게시판</a></li>
            </ul>
            <%
                if (userID == null) {
            %>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle"
                           data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">접속하기<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="active"><a href="login.jsp">로그인</a></li>
                            <li><a href="join.jsp">회원가입</a></li>
                        </ul>
                    </li>
                </ul>
            <%
                } else {
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle"
                       data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">회원관리<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="logoutAction.jsp">로그아웃</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </nav>
    <div class="container">
        <div class="jumbotron">
            <div class="container">
                <h1>웹 사이트 소개</h1>
                <p>이 웹사이트는 부트스트랩으로 만든 JSP 웹 사이트 입니다.</p>
                <p><a class="btn btn-primary btn-pull" href="https://github.com/DDunDDang/jsp-board" role="button">자세히 알아보기</a></p>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>

