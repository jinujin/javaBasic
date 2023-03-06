<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="controller.RankController" %>
<%@ page import="connector.MysqlConnectionMaker" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-03-06
  Time: 오후 2:34
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
    int id = Integer.parseInt(request.getParameter("id"));
    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    RankController rankController = new RankController(connectionMaker);

    rankController.delete(id);

    response.sendRedirect("/member/mypage.jsp?id="+id);


%>

</body>
</html>
