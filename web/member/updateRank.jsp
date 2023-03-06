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
    <script>
        function updateLevel(memberId) {
            const inputOptions = new Promise((resolve) => {
                resolve({
                    1: '1. 일반회원',
                    2: '2. 평론가',
                    3: '3. 관리자'
                })
            })
            Swal.fire({
                title: '등급 관리',
                input: 'radio',
                inputOptions: inputOptions,
                showDenyButton: true,
                showCancelButton: true,
                cancelButtonText:"취소",
                confirmButtonText:"변경",
                denyButtonText:"거절",
                inputValidator: (value) => {
                    if (!value) {
                        return '변경할 등급을 선택해주세요!'
                    }
                }
            }).then((rank) => {
                if (rank.isConfirmed) {
                    location.href = "/member/updateRank_logic.jsp?id=" + memberId + "&rank=" + rank.value;
                    Swal.fire({title:"변경 완료!"})
                } else if (rank.isDenied) {
                    location.href = "/member/deleteRank_logic.jsp?id=" + memberId;
                    Swal.fire({title:"거절 완료"})
                }
            })
        }

    </script>
    <title>등업 신청
    </title>

    <style>
        @import "/css/cinemaList.css";
    </style>
</head>
<body>

<%@include file="/header_main.jsp" %>
<div class="container" style="width: 100%; min-height: 85%">
    <main>
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
                    <div class="col">
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
                            <div class="col-auto">
                                <button class="btn btn-outline-secondary info"
                                        onclick="updateLevel(${r.memberId})">등급 관리
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
