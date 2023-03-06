<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.*" %>
<%@ page import="model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <title>Title</title>
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

        header {
            font-family: 'Gowun Dodum', sans-serif;
            padding-left: 30px;
            padding-right: 30px;
        }
        .container{
            min-height: 70%;
            min-width: 80%;
        }

    </style>
</head>
<body>
<% // 서블릿 틀릿
    MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    MemberController memberController = new MemberController(connectionMaker);
    FilmController filmController = new FilmController(connectionMaker);
    CinemaController cinemaController = new CinemaController(connectionMaker);
    ShowingController showingController = new ShowingController(connectionMaker);
    RoomController roomController = new RoomController(connectionMaker);
    GradeController gradeController = new GradeController(connectionMaker);
    RankController rankController = new RankController(connectionMaker);

    String nn;
    MemberDTO m;
    if (logIn == null) {
        nn = "로그인 해주세요";
        m = null;
    } else {
        nn = memberController.selectOne(logIn.getId()).getNickname();
        m = memberController.selectOne(logIn.getId());
    }

    ArrayList<FilmDTO> flist = filmController.selectAll();
    ArrayList<ShowingDTO> slist = showingController.selectAll();
    ArrayList<RoomDTO> rlist = roomController.selectAll();
    ArrayList<CinemaDTO> clist = cinemaController.selectAll();
    ArrayList<RankDTO> ralist = rankController.selectAll();


    pageContext.setAttribute("flist", flist);
    pageContext.setAttribute("slist", slist);
    pageContext.setAttribute("rlist", rlist);
    pageContext.setAttribute("clist", clist);
    pageContext.setAttribute("ralist", ralist);
    pageContext.setAttribute("memberController", memberController);
    pageContext.setAttribute("filmController", filmController);
    pageContext.setAttribute("showingController", showingController);
    pageContext.setAttribute("cinemaController", cinemaController);
    pageContext.setAttribute("roomController", roomController);
    pageContext.setAttribute("rankController", rankController);
    pageContext.setAttribute("nn", nn);
    pageContext.setAttribute("m", m);

%>
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <a href="/main.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="150" height="40" role="img">
            <text mask="url(#mask)" x="0" y="35" font-size="22" font-family="Arial" font-weight="bold">
                JINU CINEMA
            </text>
        </svg>
    </a>

    <ul id="head_bar" class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="/main.jsp" class="nav-link px-4 link-dark">메인</a></li>
        <li><a href="/movie/movieList.jsp" class="nav-link px-4 link-dark">영화</a></li>
        <li><a href="/cinema/cinemaList.jsp" class="nav-link px-4 link-dark">극장</a></li>
        <li><a href="/show/showList.jsp" class="nav-link px-4 link-dark">상영정보</a></li>
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

</body>
</html>
