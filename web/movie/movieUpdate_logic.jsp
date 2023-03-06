<%@ page import="model.FilmDTO" %>
<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.FilmController" %><%--
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
    request.setCharacterEncoding("UTF-8");

    MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

    if (logIn == null) {
        response.sendRedirect("/member/login.jsp");
    }
    int filmId = Integer.parseInt(request.getParameter("filmId"));

    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    FilmController filmController = new FilmController(connectionMaker);
    FilmDTO f = filmController.selectOne(filmId);


    f.setTitle(request.getParameter("title"));
    f.setRating(request.getParameter("rate"));
    f.setDescription(request.getParameter("description"));
    f.setImage(request.getParameter("imgFile"));
    f.setId(filmId);

    filmController.update(f);

    response.sendRedirect("/movie/movieOne.jsp?filmId=" + filmId);
%>
</body>
</html>
