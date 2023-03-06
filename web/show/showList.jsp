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
    <title>상영 정보
    </title>
    <script>
        function deleteShow(sid) {
            let result = confirm("정말로 삭제하시겠습니까?");
            if (result) {
                location.href = "/show/show_delete.jsp?showId=" + sid;
            }
        }
    </script>

    <style>
        @import "/css/showList.css";
    </style>
</head>
<body>

<%@include file="/header_main.jsp" %>
<div class="container" style="width: 70%; min-height: 100%">
    <main>
        <c:set var="m" value="<%=m%>"/>
        <c:if test="${m != null && m.level==3}">
            <div class="showMade">
                <button class="btn btn-outline-secondary btn-lg mb-4" onclick="location.href='/show/show_register.jsp'">
                    상영 정보 등록
                </button>
            </div>
        </c:if>

        <c:set var="list" value="<%=slist%>"/>
        <c:choose>

            <c:when test="${list.isEmpty()}">
                <div class="row">
                    <div class="col-6">
                        <span>상영 정보가 존재하지 않습니다.</span>
                    </div>
                </div>

            </c:when>
            <c:otherwise>
                <c:forEach var="s" items="${list}">
                    <div class="col">
                        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                            <div class="col-auto d-none d-lg-block">
                                <svg class="bd-placeholder-img" width="230" height="320"
                                     xmlns="http://www.w3.org/2000/svg"
                                     role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice"
                                     focusable="false">
                                    <image href="/images/${filmController.selectOne(s.filmId).image}"></image>
                                </svg>
                            </div>
                            <div class="col p-2 d-flex flex-column position-static">
                                <h1 class="mb-2">${filmController.selectOne(s.filmId).title}
                                </h1>
                                <h3>관람 등급 : ${filmController.selectOne(s.filmId).rating}
                                </h3>

                                <h3>
                                    극장 : ${cinemaController.selectOne(s.cinemaId).name}
                                </h3>
                                <h3>상영관 : ${roomController.selectOne(s.roomId).name}관
                                </h3>
                                <h3>
                                    날짜 : ${showingController.selectOne(s.id).date}
                                </h3>
                                <h3>
                                    시간 : ${showingController.selectOne(s.id).time}
                                </h3>
                                <c:if test="${m != null && m.level==3}">
                                    <div class="aboutShow">
                                        <button class="btn btn-outline-success"
                                                onclick="location.href='/show/show_update.jsp?showId=${s.id}'">
                                            정보 수정
                                        </button>
                                        <button class="btn btn-outline-danger" onclick="deleteShow(${s.id})">
                                            정보 삭제
                                        </button>
                                    </div>
                                </c:if>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </main>
</div>
<%@include file="/footer.jsp" %>


</body>
</html>
