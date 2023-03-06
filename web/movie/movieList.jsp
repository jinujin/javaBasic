<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <style>
        @import "/css/movieList.css";
    </style>

    <title>무비</title>

</head>
<body>
<%@include file="/header_main.jsp" %>
<div class="container">
    <div class="wrapper">
        <main>
            <c:set var="m" value="<%=m%>"/>
            <c:if test="${m != null && m.level==3}">
                <div class="movieMade">
                    <button class="btn btn-outline-secondary btn-lg mb-4"
                            onclick="location.href='/movie/movie_register.jsp'">
                        영화 등록
                    </button>
                </div>
            </c:if>

            <c:set var="list" value="<%=flist%>"/>
            <c:choose>
                <c:when test="${list.isEmpty()}">
                    <div class="row">
                        <div class="col-6">
                            <h3>아직 등록된 영화가 존재하지 않습니다.</h3>
                        </div>
                    </div>
                </c:when>

                <c:otherwise>
                    <div class="row text-center align-items-center">
                        <c:forEach var="f" items="${list}">
                            <div class="col justify-content-center mb-4">
                                <div class="film_list shadow">
                                    <a href="/movie/movieOne.jsp?filmId=${f.id}" class="film_one">
                                        <img src="/images/${f.image}">
                                    </a>
                                    <div class="film_text">
                                            ${f.title}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>
        </main>
    </div>
</div>
<%@include file="/footer.jsp" %>

</body>
</html>
