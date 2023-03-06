<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="model.CinemaDTO" %>
<%@ page import="controller.CinemaController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");

  String name = request.getParameter("name");
  String location = request.getParameter("location");
  String number = request.getParameter("number");

  CinemaDTO cinemaDTO = new CinemaDTO();
  cinemaDTO.setName(name);
  cinemaDTO.setLocation(location);
  cinemaDTO.setNumber(number);


  ConnectionMaker connectionMaker = new MysqlConnectionMaker();
  CinemaController cinemaController = new CinemaController(connectionMaker);

  cinemaController.insert(cinemaDTO);

  response.sendRedirect("/cinema/cinemaList.jsp");


%>
</body>
</html>
