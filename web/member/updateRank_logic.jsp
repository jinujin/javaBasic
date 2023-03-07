<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="controller.MemberController" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.RankController" %>
<%@ page import="model.RankDTO" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-03-03
  Time: 오전 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    final int MASTER = 1;
    MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

    if (logIn == null) {
        response.sendRedirect("/member/login.jsp");
    }
    int id = Integer.parseInt(request.getParameter("id"));
    int rank = Integer.parseInt(request.getParameter("rank"));
    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    MemberController memberController = new MemberController(connectionMaker);
    RankController rankController = new RankController(connectionMaker);

    int requestLevel;

    RankDTO r = rankController.selectOne(id);
    if (r == null) {
        requestLevel = 0;
    } else {
        requestLevel = r.getLevel();
    }
    String nextPath = "/member/updateRank.jsp";
    if (logIn.getId() != MASTER && id == MASTER) {
        nextPath = "/member/warning.jsp";
    } else {
        memberController.rankUp(id, rank);
        if (requestLevel == rank) {
            rankController.delete(id);
        }
    }
    response.sendRedirect(nextPath);


%>

</body>
</html>
