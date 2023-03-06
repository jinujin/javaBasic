<%@ page import="model.MemberDTO" %>
<%@ page import="controller.MemberController" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.FilmController" %>
<%@ page import="model.FilmDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <title>영화 수정
    </title>

    <style>
        @import "/css/movie_update.css";

    </style>
</head>
<body>
<%@include file="/header_main.jsp" %>
<%
    int filmId = Integer.parseInt(request.getParameter("filmId"));
    FilmDTO f = filmController.selectOne(filmId);
%>
<div class="container">
    <main>
        <div class="col">
            <div class="row g-0 border rounded flex-md-row mb-4 shadow-sm h-md-250">
                <div class="col-auto d-none d-lg-block">
                    <svg class="bd-placeholder-img" width="330" height="470" xmlns="http://www.w3.org/2000/svg"
                         role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice"
                         focusable="false">
                        <image href="/images/<%=f.getImage()%>"></image>
                    </svg>
                </div>
                <form action="/movie/movieUpdate_logic.jsp?filmId=<%=f.getId()%>" method="post">
                    <div class="col p-4 d-flex flex-column position-static">
                        <h4>포스터</h4>
                        <div class="mb-3">
                            <input type="file" class="form-control" id="imgFile" name="imgFile">
                        </div>

                        <strong class="d-inline-block mb-2 text-success"></strong>
                        <h4>영화제목</h4>
                        <div class="mb-3">
                            <input type="text" name="title" value="<%=f.getTitle()%>" class="form-control">
                        </div>
                        <h4>영화등급</h4>
                        <select class="form-select is-invalid form-control" id="rate" name="rate">
                            <option>전체관람가</option>
                            <option>12세이상</option>
                            <option>15세이상</option>
                            <option>청소년관람불가</option>
                        </select>
                        <div class="invalid-feedback mb-3">
                            영화 등급을 선택해주세요.
                        </div>
                        <div class="mb-3">
                            <h4>기존 줄거리</h4>
                            <%=f.getDescription()%>
                        </div>
                        <div class="input-group mb-5">
                            <span class="input-group-text">작 성 란</span>
                            <textarea class="form-control" aria-label="With textarea" style="height: 110px;"
                                      id="description" name="description"></textarea>
                        </div>
                        <button class="btn btn-outline-info" type="submit">수 정 하 기</button>

                    </div>
                </form>
            </div>
        </div>
        <%--        <input>--%>
    </main>

</div>
<%@include file="/footer.jsp" %>
</body>
</html>
