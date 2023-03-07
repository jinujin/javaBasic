<%@ page import="model.GradeDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="controller.GradeController" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="model.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-20
  Time: 오전 9:50
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

    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    GradeController gradeController = new GradeController(connectionMaker);

    int filmId = Integer.parseInt(request.getParameter("filmId"));
    double score = Double.parseDouble(request.getParameter("score"));

    String criticism = request.getParameter("criticism");
    int writerId = Integer.parseInt(request.getParameter("id"));
    boolean result = gradeController.validateMemberId(writerId,filmId);

    if (logIn == null || writerId == 0) {
        response.sendRedirect("/member/login.jsp");
    } else {
        if (!result) {
            // 중복
            response.sendRedirect("/movie/movieOne.jsp?filmId=" + filmId);
        } else {
            GradeDTO gradeDTO = new GradeDTO();
            gradeDTO.setFilmId(filmId);
            gradeDTO.setScore(score);
            gradeDTO.setCriticism(criticism);
            gradeDTO.setWriterId(logIn.getId());


            gradeController.insert(gradeDTO);

            response.sendRedirect("/movie/movieOne.jsp?filmId=" + filmId);
        }
    }
%>

</body>
</html>
