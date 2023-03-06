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
    <title>리뷰 수정
    </title>
    <style>
        @import "/css/updateReview.css";
    </style>
</head>
<body>

<%@include file="/header_main.jsp" %>
<div class="container">
    <%
        int filmId = Integer.parseInt(request.getParameter("filmId"));
        int gid = Integer.parseInt(request.getParameter("id"));
        FilmDTO f = filmController.selectOne(filmId);
    %>
    <script>
        function deleteReply(gid) {
            let result = confirm("정말로 삭제하시겠습니까?");
            if (result) {
                location.href = "/member/delete_grade.jsp?id=" + gid + "&filmId=" +
                <%=filmId%>
            }
        }
    </script>
    <main>
        <div class="container-fluid">
            <div class="row vh-100 align-items-center text-center">
                <div class="row justify-content-center">
                    <form action="/movie/updateReview_logic.jsp?id=<%=gid%>&filmId=<%=filmId%>" method="post">
                        <img class="mb-4" src="/images/<%=f.getImage()%>" alt="포스터">
                        <h1 class="mb-3 fw-normal">! 리뷰 수정 해요 !</h1>
                        <div class="col-md-3">
                            <label for="score" class="form-label">Score</label>
                            <select class="form-select is-invalid form-control" id="score" name="score">
                                <%
                                    for (double i = 10.0; i >= 0.0; i -= 0.5) {
                                %>
                                <option><%=i%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                            <div class="invalid-feedback">
                                점수를 입력해주세요.
                            </div>
                        </div>

                        <div class="input-group">
                            <span class="input-group-text">작 성 란</span>
                            <textarea class="form-control" aria-label="With textarea" style="height: 110px;"
                                      name="criticism"></textarea>
                            <span class="input-group-text"><button class="btn" type="submit">확 인</button></span>
                        </div>
                    </form>
                    <div class="mt-4">
                        <button class="btn btn-outline-success"
                                onclick="location.href='/movie/movieOne.jsp?filmId=<%=filmId%>'">
                            뒤로 가기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<%@include file="/footer.jsp" %>
</body>
</html>
