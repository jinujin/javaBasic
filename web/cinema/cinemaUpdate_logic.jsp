
<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.CinemaController" %>
<%@ page import="model.CinemaDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");

  MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

  if (logIn == null) {
    response.sendRedirect("/member/login.jsp");
  }
  int cinemaId = Integer.parseInt(request.getParameter("cinemaId"));

  ConnectionMaker connectionMaker = new MysqlConnectionMaker();
  CinemaController cinemaController = new CinemaController(connectionMaker);
  CinemaDTO c = cinemaController.selectOne(cinemaId);


  c.setName(request.getParameter("name"));
  c.setLocation(request.getParameter("location"));
  c.setNumber(request.getParameter("number"));
  c.setId(cinemaId);

  cinemaController.update(c);

  response.sendRedirect("/cinema/cinemaOne.jsp?cinemaId=" + cinemaId);
%>
</body>
</html>
