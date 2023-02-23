<%@ page import="model.UserDTO" %>
<%@ page import="dbConn.ConnectionMaker" %>
<%@ page import="dbController.BoardController" %>
<%@ page import="dbConn.MysqlConnectionMaker" %>
<%@ page import="dbController.ReplyController" %>
<%@ page import="model.ReplyDTO" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-13
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    UserDTO logIn = (UserDTO) session.getAttribute("logIn");
    if (logIn == null) {
        response.sendRedirect("/board/printOne.jsp");
    }

    int bid = Integer.parseInt(request.getParameter("id"));

    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    ReplyController replyController = new ReplyController(connectionMaker);

    ReplyDTO r = replyController.selectOne(bid);
    if (r.getWriterId() == logIn.getId()) {
        replyController.delete(bid);
    }

    response.sendRedirect("/board/printList.jsp");
%>

</body>
</html>
