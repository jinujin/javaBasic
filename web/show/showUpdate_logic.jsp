<%@ page import="model.FilmDTO" %>
<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.FilmController" %>
<%@ page import="model.ShowingDTO" %>
<%@ page import="controller.ShowingController" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-20
  Time: 오후 9:16
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
  int showId = Integer.parseInt(request.getParameter("showId"));

  ConnectionMaker connectionMaker = new MysqlConnectionMaker();
  ShowingController showingController = new ShowingController(connectionMaker);
  ShowingDTO s = showingController.selectOne(showId);

  System.out.println(request.getParameter("filmId"));
  System.out.println(request.getParameter("cinemaId"));
  s.setFilmId(Integer.parseInt(request.getParameter("filmId")));
  s.setCinemaId(Integer.parseInt(request.getParameter("cinemaId")));
  s.setDate(request.getParameter("date"));
  s.setTime(request.getParameter("time"));
  s.setId(showId);

  showingController.update(s);

  response.sendRedirect("/show/showList.jsp");
%>
</body>
</html>
