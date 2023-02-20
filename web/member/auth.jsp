<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.MemberController" %>
<%@ page import="model.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-14
  Time: 오후 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
</head>
<body>
<%
    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    MemberController memberController = new MemberController(connectionMaker);

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    MemberDTO memberDTO = memberController.auth(username, password);

    String address;

    if (memberDTO == null) {
%>
<%--<script>--%>
<%--    alert("로그인 실패");--%>
<%--</script>--%>
<%
    address = "/member/login.jsp";


} else {
    address = "/main.jsp";
    session.setAttribute("logIn", memberDTO);
%>
<%--<script>--%>
<%--    history.go(-1);--%>
<%--</script>--%>
<%
    }
    response.sendRedirect(address);
%>

</body>
</html>


