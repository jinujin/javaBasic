<%@ page import="model.MemberDTO" %>
<%@ page import="controller.MemberController" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.CinemaController" %>
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
  <title>극장 등록
  </title>
  <style>
    @import "/css/cinema_register.css";
  </style>
</head>
<body>
<%@include file="/header_main.jsp" %>
<div class="container">
  <main>
    <form action="/cinema/cinemaRegister_logic.jsp" method="post">
      <div class="text-center">
        <h2>< 극장 등록 ></h2>
      </div>
      <div class="col">
        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
          <div class="col p-4 d-flex flex-column position-static">
            <div class="cinemaList align-items-center text-center">
              <h4 class="mb-2">극장 이름
              </h4>
              <div class="cinemaOne mb-3">
                <input type="text" name="name" class="form-control">
              </div>
            </div>
            <div class="cinemaList align-items-center text-center">
              <h4 class="mb-2">극장 주소
              </h4>
              <div class="cinemaOne mb-3">
                <input type="text" name="location" class="form-control">
              </div>
            </div>
            <div class="cinemaList align-items-center text-center">
              <h4 class="mb-2">전화 번호
              </h4>
              <div class="cinemaOne mb-3">
                <input type="text" name="number" class="form-control">
              </div>
            </div>
          </div>ㄴㄴ
          <button class="btn btn-outline-info" type="submit">등 록 하 기</button>
        </div>
      </div>
    </form>
  </main>
</div>
<%@include file="/footer.jsp" %>
</body>
</html>
