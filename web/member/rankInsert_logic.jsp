<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.MemberController" %>
<%@ page import="model.MemberDTO" %>
<%@ page import="controller.RankController" %>
<%@ page import="model.RankDTO" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-03-03
  Time: 오후 2:32
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
    response.sendRedirect("/main.jsp");
  }

  int memberId = Integer.parseInt(request.getParameter("id"));
  int rank = Integer.parseInt(request.getParameter("rank"));


  ConnectionMaker connectionMaker = new MysqlConnectionMaker();
  MemberController memberController = new MemberController(connectionMaker);
  RankController rankController = new RankController(connectionMaker);

  RankDTO rankDTO = new RankDTO();
  rankDTO.setMemberId(memberId);
  rankDTO.setLevel(rank);
  boolean validateRequest = rankController.validateMember(memberId);
  if (!validateRequest) {

  }

  rankController.insert(rankDTO);


  response.sendRedirect("/member/mypage.jsp?id="+memberId);
%>

</body>
</html>
