<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>회원 가입</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
          crossorigin="anonymous"></script>
  <script>
    // 호이스팅
    let result = false;

    function validateUsername(username) {
      if (username.length >= 5) {
        return true;
      }
      return false;
    }

    function validatePassword(password) {
      if (password.includes('!')) {
        return true;
      }
      return false;
    }

    function validateInput() {
      let username = document.getElementById('username'); // 특정 태그로 접근가능 (DOM)
      let password = document.getElementById('password'); // 특정 태그로 접근가능 (DOM)
      result = validateUsername(username.value) && validatePassword(password.value);

      if (result) {
        document.forms[0].submit();
      } else {
        alert('잘못된 입력입니다. 다시 입력해주세요.');
      }

    }

  </script>
</head>
<body>
<div class="container-fluid">
  <div class="row vh-100 align-items-center text-center">
    <div class="row justify-content-center">
      <form action="/user/register_logic.jsp" method="post">
        <div class="row justify-content-center mb-2">
          <div class="col-6">
            <div class="form-floating">
              <input type="text" id="username" name="username" class="form-control" placeholder="아이디">
              <label for="username">아이디</label>
            </div>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-6">
            <div class="form-floating">
              <input type="password" id="password" name="password" class="form-control" placeholder="비밀번호">
              <label for="password">비밀번호</label>
            </div>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="col-6">
            <div class="form-floating">
              <input type="text" id="nickname" name="nickname" class="form-control" placeholder="닉네임">
              <label for="nickname">닉네임</label>
            </div>
          </div>
        </div>
        <div class="row justify-content-center">
          <div class="btn btn-outline-primary col-6 m-1" onclick="validateInput()" >회원가입</div>
        </div>
      </form>

    </div>
  </div>
</div>
</body>
</html>
