<%@ page import="model.CinemaDTO" %>
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
    <title>극장 정보
    </title>
    <script>
        function deleteCinema(cid) {
            let result = confirm("정말로 삭제하시겠습니까?");
            if (result) {
                location.href = "/cinema/cinema_delete.jsp?cinemaId=" + cid;
            }
        }
    </script>
    <style>
        @import "/css/cinemaOne.css";

    </style>
</head>
<body>
<%@include file="/header_main.jsp" %>
<%
    int cinemaId = Integer.parseInt(request.getParameter("cinemaId"));
    CinemaDTO c = cinemaController.selectOne(cinemaId);
%>
<div class="container">
    <main>
        <c:set var="m" value="<%=m%>"/>
        <c:if test="${m != null && m.level==3}">
            <div class="aboutMovie">
                <button class="btn btn-outline-secondary btn-lg mb-4"
                        onclick="location.href='/cinema/cinema_update.jsp?cinemaId=<%=cinemaId%>'">
                    극장 수정
                </button>
                <button class="btn btn-outline-secondary btn-lg mb-4" onclick="deleteCinema(<%=cinemaId%>)">
                    극장 삭제
                </button>
            </div>
        </c:if>
        <div class="col">
            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                <div class="col p-4 d-flex flex-column position-static">
                    <div class="cinemaList align-items-center text-center">
                        <h4 class="mb-2">극장 이름
                        </h4>
                        <div class="cinemaOne mb-3">
                            <%=c.getName()%>
                        </div>
                    </div>
                    <div class="cinemaList align-items-center text-center">
                        <h4 class="mb-2">극장 주소
                        </h4>
                        <div class="cinemaOne mb-3">
                            <%=c.getLocation()%>
                        </div>
                    </div>
                    <div class="cinemaList align-items-center text-center">
                        <h4 class="mb-2">전화 번호
                        </h4>
                        <div class="cinemaOne mb-3">
                            <%=c.getNumber()%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<%@include file="/footer.jsp" %>
</body>
</html>
