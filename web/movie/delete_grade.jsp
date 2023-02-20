<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.GradeController" %>
<%@ page import="model.GradeDTO" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-20
  Time: 오전 11:26
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

    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    GradeController gradeController = new GradeController(connectionMaker);

    GradeDTO g = gradeController.selectOne(gid);
    if (g.getWriterId() == logIn.getId()) {
        gradeController.delete(gid);
    }

    response.sendRedirect("/movie/movieOne.jsp?filmId="+filmId);
%>

</body>
</html>
