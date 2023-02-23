<%@ page import="model.UserDTO" %>
<%@ page import="model.ReplyDTO" %>
<%@ page import="dbController.ReplyController" %>
<%@ page import="dbConn.ConnectionMaker" %>
<%@ page import="dbConn.MysqlConnectionMaker" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-13
  Time: 오후 1:22
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
    response.sendRedirect("/index.jsp");
  }
  int boardId = Integer.parseInt(request.getParameter("boardId"));
  String content = request.getParameter("content");
  ReplyDTO replyDTO = new ReplyDTO();
  replyDTO.setBoardId(boardId);
  replyDTO.setWriterId(logIn.getId());
  replyDTO.setContent(content);

  ConnectionMaker connectionMaker = new MysqlConnectionMaker();
  ReplyController replyController = new ReplyController(connectionMaker);

  replyController.insert(replyDTO);

  response.sendRedirect("/board/printOne.jsp?id=" + boardId);

%>

</body>
</html>
