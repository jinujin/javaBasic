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
    <title>영화 등록
    </title>

    <style>
        @import "/css/movie_register.css";
    </style>
</head>
<body>
<%@include file="/header_main.jsp" %>
<div class="container">
    <main>
        <form action="/movie/movieRegister_logic.jsp" method="post">
            <div class="text-center">
                <h2>< 영화 등록 ></h2>
            </div>
            <div class="session1 p-3 mb-2">
                <div>
                    <ul class="list-group list-group-flush">
                        <h4>영화제목</h4>
                        <li class="list-group">
                            <input type="text" class="form-control register" id="title" name="title"
                                   placeholder="영화 제목">
                        </li>
                        <h4>영화등급</h4>
                        <select class="form-select is-invalid form-control" id="rate" name="rate">
                            <option>전체관람가</option>
                            <option>12세이상</option>
                            <option>15세이상</option>
                            <option>청소년관람불가</option>
                        </select>
                        <div class="invalid-feedback register">
                            영화 등급을 선택해주세요.
                        </div>
                        <h4>줄거리</h4>
                        <li class="list-group">
                            <div class="input-group register">
                                <span class="input-group-text">작 성 란</span>
                                <textarea class="form-control" aria-label="With textarea" style="height: 110px;"
                                          id="description" name="description"></textarea>
                            </div>
                        </li>
                        <h4>포스터</h4>
                        <li class="list-group">
                            <input type="file" class="form-control register" id="imgFile" name="imgFile">
                        </li>
                        <button class="btn btn-outline-info" type="submit">등 록</button>
                    </ul>
                </div>
            </div>
        </form>
    </main>
</div>
<%@include file="/footer.jsp" %>

</body>
</html>
