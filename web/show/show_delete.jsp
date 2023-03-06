<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.ShowingController" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-21
  Time: 오후 8:34
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

    showingController.delete(showId);

    response.sendRedirect("/show/showList.jsp");
%>

</body>
</html>
