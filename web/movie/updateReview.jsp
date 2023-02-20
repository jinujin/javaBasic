<%@ page import="model.MemberDTO" %>
<%@ page import="controller.MemberController" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.FilmController" %>
<%@ page import="model.FilmDTO" %>
<%@ page import="controller.GradeController" %>
<%@ page import="model.GradeDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <% // 서블릿 틀릿
        request.setCharacterEncoding("UTF-8");
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

        int filmId = Integer.parseInt(request.getParameter("filmId"));
        int gid = Integer.parseInt(request.getParameter("id"));

        ConnectionMaker connectionMaker = new MysqlConnectionMaker();
        MemberController memberController = new MemberController(connectionMaker);
        FilmController filmController = new FilmController(connectionMaker);
        GradeController gradeController = new GradeController(connectionMaker);


        FilmDTO f = filmController.selectOne(filmId);
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
    <title><%=f.getTitle()%>
    </title>
    <script>
        function deleteReply(gid) {
            let result = confirm("정말로 삭제하시겠습니까?");
            if (result) {
                location.href = "/member/delete_grade.jsp?id=" + gid +"&filmId=" + <%=filmId%>
            }
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nunito:wght@700&display=swap');

        .container {
            min-height: 100%;
        }

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

        header, h2, h3 {
            font-family: 'Gowun Dodum', sans-serif;
        }

        .input-group-text > button {
            width: 100%;
            height: 100%;
        }

        html, body {
            height: 100%;
        }
        img{
            border: 2px solid black;
            width: 240px;
            height: 300px;
            object-fit: cover;
        }



    </style>
</head>
<body>

<div class="container" style="width: 100%">
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
        <div class="container-fluid">
            <div class="row vh-100 align-items-center text-center">
                <div class="row justify-content-center">
                    <form action="/movie/updateReview_logic.jsp?id=<%=gid%>&filmId=<%=filmId%>" method="post">
                        <img class="mb-4" src="/images/<%=f.getImage()%>" alt="포스터">
                        <h1 class="h3 mb-3 fw-normal">! 리뷰 수정 해요 !</h1>
                        <div class="col-md-3">
                            <label for="score" class="form-label">Score</label>
                            <select class="form-select is-invalid form-control" id="score" name="score">
                                <%
                                    for (double i = 10.0; i >= 0.0; i -= 0.5) {
                                %>
                                <option><%=i%></option>
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
                            <textarea class="form-control" aria-label="With textarea" style="height: 110px;" name="criticism"></textarea>
                            <span class="input-group-text"><button class="btn" type="submit">확 인</button></span>
                        </div>
                    </form>
                    <div class="mt-4">
                        <button class="btn btn-outline-success" onclick="location.href='/movie/movieOne.jsp?filmId=<%=filmId%>'">
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
