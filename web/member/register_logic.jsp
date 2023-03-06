<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="controller.MemberController" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");

  final int LEVEL = 1;
  String username = request.getParameter("username");
  String password = request.getParameter("password");
  String nickname = request.getParameter("nickname");
  String email = request.getParameter("email");
  MemberDTO memberDTO = new MemberDTO();
  memberDTO.setUsername(username);
  memberDTO.setPassword(password);
  memberDTO.setNickname(nickname);
  memberDTO.setEmail(email);
  memberDTO.setLevel(LEVEL); // 회원 가입시 무조건 일반 회원

  ConnectionMaker connectionMaker = new MysqlConnectionMaker();
  MemberController memberController = new MemberController(connectionMaker);

  boolean result = memberController.insert(memberDTO);

  if (result) {
    response.sendRedirect("/main.jsp");
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
