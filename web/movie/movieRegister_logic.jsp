<%@ page import="model.FilmDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.FilmController" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-20
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String title = request.getParameter("title");
    String rate = request.getParameter("rate");
    String description = request.getParameter("description");
    String imgFile = request.getParameter("imgFile");

    FilmDTO filmDTO = new FilmDTO();
    filmDTO.setTitle(title);
    filmDTO.setRating(rate);
    filmDTO.setDescription(description);
    filmDTO.setImage(imgFile);

    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    FilmController filmController = new FilmController(connectionMaker);

    filmController.insert(filmDTO);

    response.sendRedirect("/movie/movieList.jsp");


%>
</body>
</html>
