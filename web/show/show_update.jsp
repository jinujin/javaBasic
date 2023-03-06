<%@ page import="model.*" %>
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
        @import "/css/show_update.css";
    </style>
</head>
<body>

<%@include file="/header_main.jsp" %>
<div class="container">
    <%
        int showId = Integer.parseInt(request.getParameter("showId"));

        ShowingDTO s = showingController.selectOne(showId);
    %>
    <main>
        <c:set var="s" value="<%=s%>"/>
        <c:set var="list" value="<%=slist%>"/>
        <c:set var="clist" value="<%=clist%>"/>
        <c:set var="flist" value="<%=flist%>"/>
        <c:set var="rlist" value="<%=rlist%>"/>
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
                <div class="lists">
                    <div class="list-item">
                        <h5> < 영화 > </h5>
                        <c:forEach var="f" items="${flist}">
                            <div>${f.id}번 ${f.title}</div>
                        </c:forEach>
                    </div>
                    <div class="list-item">
                        <h5> < 극장 > </h5>
                        <c:forEach var="c" items="${clist}">
                            <div>${c.id}번 ${c.name}</div>
                        </c:forEach>
                    </div>
                    <div class="list-item">
                        <h5> < 상영관 > </h5>
                        <c:forEach var="r" items="${rlist}">
                            <div>${r.id}번 ${r.name}관</div>
                        </c:forEach>
                    </div>
                </div>

                <form action="/show/showUpdate_logic.jsp?showId=${s.id}" method="post">
                    <div class="col p-2 d-flex flex-column position-static">
                        <select class="form-select is-invalid form-control" id="filmId" name="filmId">
                            <c:forEach var="f" items="${flist}">
                                <option>${f.id}</option>
                            </c:forEach>
                        </select>
                        <div class="invalid-feedback mb-3">
                            위 리스트를 보고 영화 번호를 선택해주세요.
                        </div>
                        <select class="form-select is-invalid form-control" id="cinemaId" name="cinemaId">
                            <c:forEach var="c" items="${clist}">
                                <option>${c.id}</option>
                            </c:forEach>
                        </select>
                        <div class="invalid-feedback mb-3">
                            위 리스트를 보고 극장 번호를 선택해주세요.
                        </div>
                        <select class="form-select is-invalid form-control" id="showingId" name="showingId">
                            <c:forEach var="r" items="${rlist}">
                                <option>${r.id}</option>
                            </c:forEach>
                        </select>
                        <div class="invalid-feedback mb-3">
                            위 리스트를 보고 상영관 번호를 선택해주세요.
                        </div>
                        <span class="mb-1">날짜</span>
                        <input type="text" name="date" value="${s.date}" class="form-control mb-2">
                        <span class="mb-1">시간</span>
                        <input type="text" name="time" value="${s.time}" class="form-control mb-4">
                        <button class="btn btn-outline-info" type="submit">수 정 하 기</button>
                    </div>
                </form>
            </div>
        </div>
    </main>
</div>
<%@include file="/footer.jsp" %>


</body>
</html>
