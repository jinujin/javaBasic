<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.CinemaController" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-21
  Time: 오전 11:29
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

    int cinemaId = Integer.parseInt(request.getParameter("cinemaId"));

    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    CinemaController cinemaController = new CinemaController(connectionMaker);

    cinemaController.delete(cinemaId);

    response.sendRedirect("/cinema/cinemaList.jsp");
%>
</body>
</html>
