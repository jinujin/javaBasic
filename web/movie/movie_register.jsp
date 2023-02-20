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
    <% // 서블릿 틀릿
        request.setCharacterEncoding("UTF-8");
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

        ConnectionMaker connectionMaker = new MysqlConnectionMaker();
        MemberController memberController = new MemberController(connectionMaker);
        FilmController filmController = new FilmController(connectionMaker);

        String nn;
        if (logIn == null) {
            nn = "로그인 해주세요";
        } else {
            nn = memberController.selectOne(logIn.getId()).getNickname();
        }

        pageContext.setAttribute("memberController", memberController);
        pageContext.setAttribute("filmController", filmController);
    %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <title>영화 등록
    </title>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nunito:wght@700&display=swap');

        .fw-bold {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        li {
            font-size: 20px;
        }

        #head_bar li:hover {
            font-weight: bolder;
        }

        image {
            object-fit: cover;
            height: 100%;
            width: 100%;
        }

        header, h2, h3, h4 {
            font-family: 'Gowun Dodum', sans-serif;
        }

        .input-group-text > button {
            width: 100%;
            height: 100%;
        }

        html, body {
            height: 100%;
        }

        .register {
            margin-bottom: 20px;
        }


    </style>
</head>
<body>

<div class="container" style="width: 100%; min-height: 600px">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <a href="/main.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
            <svg class="bi me-2" width="150" height="40" role="img">
                <text x="0" y="35" font-size="22" font-family="Arial" font-weight="bold">
                    JINU CINEMA
                </text>
            </svg>
        </a>

        <ul id="head_bar" class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li><a href="/main.jsp" class="nav-link px-5 link-dark">메인</a></li>
            <li><a href="/movie/movieList.jsp" class="nav-link px-5 link-dark">영화</a></li>
            <li><a href="#" class="nav-link px-5 link-dark">극장</a></li>
            <li><a href="#" class="nav-link px-5 link-dark">상영정보</a></li>
            <%--<li><a href="#" class="nav-link px-2 link-dark"></a></li> <!--영화 순위 (평점 기준)-->--%>
        </ul>

        <div class="col-md-3 text-end">
            <div>
                <c:choose>
                    <c:when test="${logIn eq null}">
                        <%=nn%>
                    </c:when>

                    <c:otherwise>
                        <span class="fw-bold"><%=nn%>님</span> 반가워요!
                    </c:otherwise>

                </c:choose>
            </div>

            <c:choose>
                <c:when test="${logIn eq null}">
                    <button type="button" class="btn btn-outline-primary me-2"
                            onclick="location.href='/member/login.jsp'">
                        Login
                    </button>
                    <button type="button" class="btn btn-primary" onclick="location.href='/member/register.jsp'">
                        Sign-up
                    </button>
                </c:when>
                <c:otherwise>
                    <button type="button" class="btn btn-outline-primary me-2"
                            onclick="location.href='/member/mypage.jsp?id=<%=logIn.getId()%>'">
                        내 정보
                    </button>
                    <button type="button" class="btn btn-primary" onclick="location.href='/member/logout.jsp'">로그아웃
                    </button>
                </c:otherwise>
            </c:choose>
        </div>
    </header>
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
