<%@ page import="model.UserDTO" %>
<%@ page import="dbConn.ConnectionMaker" %>
<%@ page import="dbController.BoardController" %>
<%@ page import="dbConn.MysqlConnectionMaker" %>
<%@ page import="model.BoardDTO" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-10
  Time: 오후 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <%
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        System.out.println(logIn);
        if (logIn == null) {
            response.sendRedirect("/index.jsp");
        }

        int id = Integer.parseInt(request.getParameter("id"));

        ConnectionMaker connectionMaker = new MysqlConnectionMaker();
        BoardController boardController = new BoardController(connectionMaker);

        BoardDTO b = boardController.selectOne(id);
        System.out.println(b);
        if (b.getWriterId() != logIn.getId()) {
            response.sendRedirect("/board/printOne.jsp?id=" + id);
        }
    %>
    <title><%=b.getTitle()%> 글 수정하기</title>
</head>

<body>

<div class="container-fluid">
    <div class="align-items-center vh-100">
        <div class="col-10">
            <form action="/board/update_logic.jsp?id=<%=id%>" method="post">
                <table class="table table-striped table-secondary">
                    <tr>
                        <th class="col-2">글번호</th>
                        <td><%=b.getId()%>
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td>
                            <input type="text" name="title" value="<%=b.getTitle()%>" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea name="content" class="form-control">
                                <%=b.getContent()%>
                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <button class="btn btn-outline-success">
                                수정하기
                            </button>
                        </td>
                    </tr>

                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
