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

    <title>상영 정보
    </title>
    <script>
        function showRegister() {
            let filmId = $('#filmId').val();
            let cinemaId = $('#cinemaId').val();
            let roomId = $('#roomId').val();
            let time = $('#time').val();
            let date = $('#date').val();

            let data = {
                "filmId": filmId,
                "cinemaId": cinemaId,
                "roomId": roomId,
                "time": time,
                "date": date
            };
            $.ajax({
                url: "/show/register",
                method: "get",
                data: data,
                success: function (message) {
                    let result = JSON.parse(message);
                    if (result.status == "success") {
                        Swal.fire({title: '등록 완료', text: result.message, icon: "success"}).then(() => {
                            location.href = result.nextPath;
                        });
                    } else {
                        Swal.fire({title: '등록 실패', text: result.message, icon: "warning"}).then(() => {
                            location.href = result.nextPath;
                        });
                    }
                }
            });
        }
    </script>

    <style>
        @import "/css/show_register.css";
    </style>
</head>
<body>

<%@include file="/header_main.jsp" %>
<div class="container">

    <main>
        <c:set var="list" value="<%=slist%>"/>
        <c:set var="clist" value="<%=clist%>"/>
        <c:set var="flist" value="<%=flist%>"/>
        <c:set var="rlist" value="<%=rlist%>"/>
        <div class="col">
            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
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
                    <select class="form-select is-invalid form-control" id="roomId" name="roomId">
                        <c:forEach var="r" items="${rlist}">
                            <option>${r.id}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback mb-3">
                        위 리스트를 보고 상영관 번호를 선택해주세요.
                    </div>
                    <span class="mb-1">날짜</span>
                    <input type="text" name="date" id="date" class="form-control mb-2">
                    <span class="mb-1">시간</span>
                    <input type="text" name="time" id="time" class="form-control mb-4">
                    <button class="btn btn-outline-info" onclick="showRegister()">등 록 하 기</button>
                </div>
            </div>
        </div>
    </main>
</div>
<%@include file="/footer.jsp" %>


</body>
</html>
