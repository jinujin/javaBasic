<%@ page import="model.MemberDTO" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-14
  Time: 오후 3:18
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

    <meta charset="utf-8">

    <title>로그인</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Ubuntu&display=swap');

        img {
            border: 3px solid #badc58;
            width: 140px;
            height: 200px;
            object-fit: cover;
        }
        h1 {
            font-family: 'Gowun Dodum', sans-serif;
        }

    </style>

</head>

<body class="text-center">


<div class="container-fluid">

    <div class="row vh-100 align-items-center text-center">
        <button type="button" class="btn btn-outline-success" onclick="location.href='/main.jsp'">I W A N N A G O H O M E</button>
        <div class="row justify-content-center">
            <form action="/member/auth.jsp" method="post">
                <img class="mb-4" src="/images/brightQuokka.jpg" alt="귀여운 쿼카 사진">
                <h1 class="h3 mb-3 fw-normal">! 영화 보러 가요 !</h1>
                <div class="row justify-content-center mb-2">
                    <div class="col-4">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="username" name="username" placeholder="아이디">
                            <label for="username">아이디</label>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-2">
                    <div class="col-4">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="비밀번호">
                            <label for="password">비밀번호</label>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-2">
                    <div class="col-5">
                        <button class="w-50 btn btn-lg btn-primary" type="submit">로 그 인</button>
                        <br>
                        <p class="mt-5 mb-3 text-muted">© JINU CINEMA</p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
