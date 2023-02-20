<%@ page import="controller.MemberController" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="connector.ConnectionMaker" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-20
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  int id = Integer.parseInt(request.getParameter("id"));

  ConnectionMaker connectionMaker = new MysqlConnectionMaker();
  MemberController memberController = new MemberController(connectionMaker);

  memberController.delete(id);

  session.invalidate();
  response.sendRedirect("/main.jsp");

%>

</body>
</html>
