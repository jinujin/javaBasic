<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.MemberController" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-16
  Time: 오후 4:43
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
    int id = Integer.parseInt(request.getParameter("id"));

    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    MemberController memberController = new MemberController(connectionMaker);
    MemberDTO m = memberController.selectOne(id);

    m.setPassword(request.getParameter("password"));
    m.setNickname(request.getParameter("nickname"));
    m.setEmail(request.getParameter("email"));
    m.setId(id);

    memberController.update(m);

    response.sendRedirect("/member/mypage.jsp?id=" + id);
%>

</body>
</html>
