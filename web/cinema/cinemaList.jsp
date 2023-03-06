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
    <title>극 장
    </title>

    <style>
        @import "/css/cinemaList.css";
    </style>
</head>
<body>

<%@include file="/header_main.jsp" %>
<div class="container">
    <main>
        <c:set var="m" value="<%=m%>"/>
        <c:if test="${m != null && m.level==3}">
            <div class="movieMade">
                <button class="btn btn-outline-secondary btn-lg mb-4"
                        onclick="location.href='/cinema/cinema_register.jsp'">
                    극장 등록
                </button>
            </div>
        </c:if>

        <c:set var="list" value="<%=clist%>"/>
        <c:choose>
            <c:when test="${list.isEmpty()}">
                <div class="row">
                    <div class="col-6">
                        <h3>아직 등록된 극장이 존재하지 않습니다.</h3>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="c" items="${list}">
                    <div class="col">
                        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                            <div class="col p-4 d-flex flex-column position-static">
                                <div class="cinemaList align-items-center text-center">
                                    <h4 class="mb-0">극장 이름 :
                                    </h4>
                                    <div class="cinemaOne">
                                            ${c.name}
                                    </div>
                                </div>
                                <div class="cinemaList align-items-center text-center">
                                    <h4 class="mb-0">극장 주소 :
                                    </h4>
                                    <div class="cinemaOne">
                                            ${c.location}
                                    </div>
                                </div>
                                <div class="cinemaList align-items-center text-center">
                                    <h4 class="mb-0">전화 번호 :
                                    </h4>
                                    <div class="cinemaOne">
                                            ${c.number}
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <button class="btn btn-outline-secondary info" type="submit"
                                        onclick="location.href='/cinema/cinemaOne.jsp?cinemaId=${c.id}'">상세 정보
                                </button>
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
