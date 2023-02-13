<%@ page import="model.UserDTO" %>
<%@ page import="dbConn.ConnectionMaker" %>
<%@ page import="dbConn.MysqlConnectionMaker" %>
<%@ page import="dbController.UserController" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-10
  Time: 오전 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String nickname = request.getParameter("nickname");
    UserDTO userDTO = new UserDTO();
    userDTO.setUsername(username);
    userDTO.setPassword(password);
    userDTO.setNickname(nickname);

    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    UserController userController = new UserController(connectionMaker);

    boolean result = userController.insert(userDTO);

    if (result) {
        response.sendRedirect("/index.jsp");
    } else {
%>
<script>
    alert("중복된 아이디로 가입하실 수 없습니다.");
    history.go(-1);
</script>
<%
    }
%>

</body>
</html>
