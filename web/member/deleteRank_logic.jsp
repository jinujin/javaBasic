<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.RankController" %>
<%@ page import="model.MemberDTO" %>
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
    int id = Integer.parseInt(request.getParameter("id"));
    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    RankController rankController = new RankController(connectionMaker);

    rankController.delete(id);

    response.sendRedirect("/member/updateRank.jsp");

%>

</body>
</html>
