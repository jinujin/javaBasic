<%@ page import="model.UserDTO" %>
<%@ page import="dbConn.ConnectionMaker" %>
<%@ page import="dbConn.MysqlConnectionMaker" %>
<%@ page import="dbController.BoardController" %>
<%@ page import="model.BoardDTO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="dbController.UserController" %>
<%@ page import="dbController.ReplyController" %>
<%@ page import="model.ReplyDTO" %>
<%@ page import="java.util.ArrayList" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--jstl--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <%
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            response.sendRedirect("/index.jsp");
        }
        int id = Integer.parseInt(request.getParameter("id"));

        ConnectionMaker connectionMaker = new MysqlConnectionMaker();
        BoardController boardController = new BoardController(connectionMaker);
        UserController userController = new UserController(connectionMaker);
        ReplyController replyController = new ReplyController(connectionMaker);

        BoardDTO b = boardController.selectOne(id);
//        ReplyDTO rr = replyController.selectOne(id);

        ArrayList<ReplyDTO> list = replyController.selectAll(id);
        pageContext.setAttribute("list", list);
        pageContext.setAttribute("userController", userController);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");

    %>


    <script>
        function deleteReply(rid) {
            let result = confirm("정말로 삭제하시겠습니까?");
            if (result) {
                location.href = "/board/deleteReply.jsp?id=" + rid
            }
        }

        function confirmDelete() {
            let result = confirm("정말로 삭제하시겠습니까?");
            if (result) {
                location.href = "/board/delete.jsp?id=" +
                <%=b.getId()%>
            }
        }
    </script>
    <title>
        <%=b.getTitle()%>
    </title>
</head>
<body>
<div class="container-fluid">
    <c:set var="b" value="<%=b%>"/>
    <c:set var="logIn" value="<%=logIn%>"/>
    <div class="align-items-center vh-100">
        <div class="col-10 mb-3">
            <table class="table table-striped table-secondary">
                <tr>
                    <th class="col-2">글번호</th>
                    <td class="col-10">${b.id}
                    </td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>
                        ${b.title}
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>
                        <%=userController.selectOne(b.getWriterId()).getNickname()%>
                    </td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>
                        <fmt:formatDate value="${b.entryDate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
                    </td>
                </tr>
                <tr class="mb-2">
                    <th>수정일</th>
                    <td>
                        <fmt:formatDate value="${b.modifyDate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                        ${b.content}
                    </td>
                </tr>
                <%--                <c:set var="wi" value="<%=b.getWriterId()%>"/>--%>
                <%--                <c:set var="li" value="<%=logIn.getId()%>"/>--%>
                <c:if test="${b.writerId eq logIn.id}">
                    <tr>
                        <td colspan="2" class="text-center">

                            <div class="btn btn-outline-success"
                                 onclick="location.href='/board/update.jsp?id=<%=b.getId()%>'">수정하기
                            </div>
                            <div class="btn btn-outline-success" onclick="confirmDelete()">삭제하기</div>

                        </td>
                    </tr>
                </c:if>
            </table>
            <div class="container-fluid">

                <div class="text-end">
                    <div class="btn btn-outline-primary" onclick="">
                        댓글 추가
                    </div>
                </div>
<%--                <form action="/board/writeReply.jsp" method="post">--%>
<%--                    <table class="table table-"--%>
<%--                </form>--%>
            </div>
            <c:set var="list" value="<%=list%>"/>
            <c:choose>

                <c:when test="${list.isEmpty()}">
                    <div class="row">
                        <div class="col-6">
                            <span>아직 등록된 댓글이 없습니다.</span>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="table table-success table-hover">
                        <thead>
                        <tr>
                            <th>댓글번호</th>
                            <th>내용</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>수정일</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="r" items="${list}">
                            <tr>
                                <td>${r.id}</td>
                                <td>${r.content}</td>
                                <td>${userController.selectOne(r.writerId).nickname}</td>
                                <td>${r.entryDate}</td>
                                <td>${r.modifyDate}</td>
                                <c:if test="${r.writerId eq logIn.id}">
                                    <td class="btn btn-outline-success col-6"
                                        onclick="location.href='/board/updateReply.jsp?id=${r.id}'">수정
                                    </td>
                                    <td class="btn btn-outline-danger col-6" onclick="deleteReply(${r.id})">삭제</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </c:otherwise>
            </c:choose>
        </div>
        <form action="/reply/write_action.jsp?boardId=${b.id}" method="post">
            <table class="table table-striped">
                <c:choose>
                    <c:when test="${empty list}">
                        <tr>
                            <td>
                                아직 등록된 댓글이 존재하지 않습니다.
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${list}" var="replyDTO">
                            <tr>
                                <td>
                                        ${userController.selectOne(replyDTO.writerId).nickname}:${replyDTO.id}
                                            ${replyDTO.content}
                                    <fmt:formatDate value="${replyDTO.entryDate}" pattern="yy/MM/dd"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <tr>
                    <td>
                        <input type="text" name="content" class="form-control">
                        <button class="btn btn-outline-primary">댓글 달기</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>


</div>
</body>
</html>
