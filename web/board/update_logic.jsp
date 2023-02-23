<%@ page import="model.UserDTO" %>
<%@ page import="dbConn.ConnectionMaker" %>
<%@ page import="dbConn.MysqlConnectionMaker" %>
<%@ page import="dbController.BoardController" %>
<%@ page import="model.BoardDTO" %>
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
  int id = Integer.parseInt(request.getParameter("id"));

  ConnectionMaker connectionMaker = new MysqlConnectionMaker();
  BoardController boardController = new BoardController(connectionMaker);
  BoardDTO b = boardController.selectOne(id);

  if (b.getWriterId() != logIn.getId()) {
    response.sendRedirect("/board/printOne.jsp?id=" + id);
  }
  b.setTitle(request.getParameter("title"));
  b.setContent(request.getParameter("content"));

  boardController.update(b);

  response.sendRedirect("/board/printOne.jsp?id=" + id);
%>

</body>
</html>
