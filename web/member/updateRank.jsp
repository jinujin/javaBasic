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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="/assets/js/member/care.js"></script>
    <script src="/assets/js/member/delete.js"></script>

    <title>등업 신청
    </title>

    <link href="/css/updateRank.css" rel="stylesheet">


</head>
<body>

<%@include file="/header_main.jsp" %>
<%
    if (logIn == null) {
        response.sendRedirect("/main.jsp");
    }
%>
<div class="container" style="width: 100%; min-height: 85%">
    <main>
        <c:set var="mlist" value="<%=mlist%>"/>
        <c:set var="logIn" value="<%=logIn%>"/>
        <h3>< 회원 정보 ></h3>
        <div class="table-responsive"></div>
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th scope="col">회원 번호</th>
                <th scope="col">아이디</th>
                <th scope="col">닉네임</th>
                <th scope="col">이메일</th>
                <th scope="col">회원 등급</th>
                <th scope="col">회원 관리</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="m" items="${mlist}">
                <tr class="member-list">
                    <td>${m.id}</td>
                    <td>${m.username}</td>
                    <td>${m.nickname}</td>
                    <td>${m.email}</td>
                    <td>${m.level}</td>
                    <c:if test="${m.id ne logIn.id}">
                        <td>
                            <div class="badge bg-success" onclick="memberCare(${m.id})">관리</div>
                        </td>
                    </c:if>
                    <c:if test="${m.id eq logIn.id}">
                        <td><div class="badge bg-info" onclick="location.href='/member/mypage.jsp?id=${logIn.id}'">내 정보</div></td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <h3>< 등업 신청 목록 ></h3>
        <div class="rank-list">
            <c:set var="list" value="<%=ralist%>"/>
            <c:choose>
                <c:when test="${list.isEmpty()}">
                    <div class="row">
                        <div class="col-6">
                            <h3>등업 신청한 회원이 없습니다.</h3>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach var="r" items="${list}">
                        <div class="col-6">
                            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                <div class="col p-4 d-flex flex-column position-static">
                                    <div class="cinemaList align-items-center text-center">
                                        <h4 class="mb-0">회원 번호 :
                                        </h4>
                                        <div class="cinemaOne">
                                                ${r.memberId}
                                        </div>
                                    </div>
                                    <div class="cinemaList align-items-center text-center">
                                        <h4 class="mb-0">현재 회원 등급 :
                                        </h4>
                                        <div class="cinemaOne">
                                                ${memberController.selectOne(r.memberId).level}
                                        </div>
                                    </div>
                                    <div class="cinemaList align-items-center text-center">
                                        <h4 class="mb-0">변경 신청 등급 :
                                        </h4>
                                        <div class="cinemaOne">
                                                ${rankController.selectOne(r.memberId).level}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <button class="btn btn-outline-secondary info btn-sm"
                                            onclick="updateLevel(${r.memberId})">등급 관리
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>


    </main>
</div>
<%@include file="/footer.jsp" %>

</body>
</html>
