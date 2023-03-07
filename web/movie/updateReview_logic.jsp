<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.GradeController" %>
<%@ page import="model.GradeDTO" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-20
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

  if (logIn == null) {
    response.sendRedirect("/member/login.jsp");
  }
  int gid = Integer.parseInt(request.getParameter("id"));
  int filmId = Integer.parseInt(request.getParameter("filmId"));
  double score = Double.parseDouble(request.getParameter("score"));
  String criticism = request.getParameter("criticism");

  ConnectionMaker connectionMaker = new MysqlConnectionMaker();
  GradeController gradeController = new GradeController(connectionMaker);
  GradeDTO g = gradeController.selectOne(gid);

  g.setCriticism(criticism);
  g.setScore(score);
  g.setId(gid);

  gradeController.update(g);

  response.sendRedirect("/movie/movieOne.jsp?filmId="+filmId);
%>

</body>
</html>
