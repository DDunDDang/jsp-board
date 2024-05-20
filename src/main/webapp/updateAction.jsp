<%--
  Created by IntelliJ IDEA.
  User: songjunsang
  Date: 5/18/24
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="boardTitle" />
<jsp:setProperty name="board" property="boardContent" />
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP 게시판</title>
</head>
<body>
    <%
        String userID = null;
        if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
        }
        int boardID = 0;
        if (request.getParameter("boardID") != null) {
            boardID = Integer.parseInt(request.getParameter("boardID"));
        }
        if (userID == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인 후 가능합니다.')");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        } else {
            if (board.getBoardTitle() == null || board.getBoardContent() == null) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('입력되지 않은 항목이 존재합니다.')");
                script.println("history.back()");
                script.println("</script>");
            } else {
                BoardDAO boardDAO = new BoardDAO();
                int result = boardDAO.update(boardID, board.getBoardTitle(), userID, board.getBoardContent());
                if (result == -1) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글 수정에 실패했습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                } else {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("location.href = 'view.jsp?boardID=" + boardID + "'");
                    script.println("</script>");
                }
            }
        }
    %>
</body>
</html>



