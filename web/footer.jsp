<%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-17
  Time: 오후 6:32
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
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nunito:wght@700&display=swap');

        footer{
            font-family: 'Gowun Dodum', sans-serif;

        }
    </style>
    <title>Title</title>
</head>
<body>
<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
    <p class="col-md-4 mb-0 text-muted">© 2023 JINU, Inc</p>

    <a href="/main.jsp" class="d-flex align-items-center text-dark justify-content-center">
        <svg class="bi me-2" width="150" height="40" role="img">
            <text x="0" y="35" font-size="22" font-family="Arial" font-weight="bold">
                JINU CINEMA
            </text>
        </svg>
    </a>

    <ul class="nav col-md-4 justify-content-end">
        <li class="nav-item"><a href="/main.jsp" class="nav-link px-2 text-muted">메인</a></li>
        <li class="nav-item"><a href="/movie/movieList.jsp" class="nav-link px-2 text-muted">영화</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">극장</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">상영정보</a></li>
    </ul>
</footer>

</body>
</html>
