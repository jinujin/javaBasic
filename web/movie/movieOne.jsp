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

        ConnectionMaker connectionMaker = new MysqlConnectionMaker();
        MemberController memberController = new MemberController(connectionMaker);
        FilmController filmController = new FilmController(connectionMaker);
        GradeController gradeController = new GradeController(connectionMaker);

        SimpleDateFormat sdf = new SimpleDateFormat("yy년 mm월 dd일 H:m:s");

        ArrayList<GradeDTO> list = gradeController.selectAll(filmId);
//        평점
        double sum = 0.0;
        double avg = 0.0;
        for (GradeDTO g : list) {
            sum += g.getScore();
        }
        avg = sum / list.size();
        avg = Math.round(avg * 10) / 10.0;

        String nn;

//        MemberDTO m = memberController.selectOne(id);
        FilmDTO f = filmController.selectOne(filmId);
//        GradeDTO g = gradeController.selectOne()

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
                location.href = "/movie/delete_grade.jsp?id=" + gid +"&filmId=" + <%=filmId%>
            }
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nunito:wght@700&display=swap');

        /*.wrapper {*/
        /*    !*height: auto;*!*/
        /*    min-height: 100%;*/
        /*}*/

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

        header, .text-muted, .description, h2, h3 {
            font-family: 'Gowun Dodum', sans-serif;
        }

        .input-group-text > button {
            width: 100%;
            height: 100%;
        }

        html, body {
            height: 100%;
        }

        .average {
            margin: 20px 0px;
            font-size: 25px;
            font-weight: bold;
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
        <div>
            <div class="col">
                <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                    <div class="col-auto d-none d-lg-block">
                        <svg class="bd-placeholder-img" width="330" height="470" xmlns="http://www.w3.org/2000/svg"
                             role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice"
                             focusable="false">
                            <image href="/images/<%=f.getImage()%>"></image>
                        </svg>
                    </div>
                    <div class="col p-4 d-flex flex-column position-static">
                        <strong class="d-inline-block mb-2 text-success"></strong>
                        <h2 class="mb-3"><%=f.getTitle()%>
                        </h2>
                        <div class="mb-5 text-muted">관람 등급 : <%=f.getRating()%>
                        </div>
                        <p class="description"><%=f.getDescription()%>
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </main>

    <h3 class="mb-4"><span class="fw-bold"><%=f.getTitle() %></span> 어떠셨나요?</h3>
    <form action="/movie/review_logic.jsp?filmId=<%=filmId%>" method="post">

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
            <span class="input-group-text"><button class="btn" type="submit">등 록</button></span>
        </div>
    </form>
    <div class="col">
        <c:set var="list" value="<%=list%>"/>
        <c:set var="logIn" value="<%=logIn%>"/>

        <c:choose>
            <c:when test="${list.isEmpty()}">
                <div class="row">
                    <div class="col">
                        <h3 class="mt-4">아직 등록된 리뷰가 존재하지 않습니다.</h3>
                    </div>
                </div>
            </c:when>

            <c:otherwise>
                <div class="average">
                    <span>평점 : </span><%=avg%> 점
                </div>
                <c:forEach var="g" items="${list}">
                    <div class="col">

                        <div class="border-bottom mb-3">
                            <div class="col-md-2 mb-2">
                                점수 : ${g.score}
                            </div>
                            <div class="col-md-10 mb-2">
                                    ${g.criticism}
                            </div>
                            <div>
                                작성 시간 : <fmt:formatDate value="${g.entry_date}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/>
                            </div>
                        </div>
                        <c:if test="${g.writerId eq logIn.id}">
                        <button class="btn btn-outline-success"
                                onclick="location.href='/movie/updateReview.jsp?id=${g.id}&filmId=<%=filmId%>'">수정
                            </button>
                            <button class="btn btn-outline-danger" onclick="deleteReply(${g.id})">삭제</button>
                        </c:if>


                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>

    </div>
    <%@include file="/footer.jsp" %>
</div>

</body>
</html>
