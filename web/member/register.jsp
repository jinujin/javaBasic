<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <title>회원 가입</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Ubuntu&display=swap');

        img {
            border: 2px solid #AACB73;
            width: 120px;
            height: 180px;
            object-fit: cover;
        }

        h1 {
            font-family: 'Gowun Dodum', sans-serif;
        }
    </style>
    <script>
        let result = false;

        function validateUsername(username) {

            if (username.length >= 5) {
                return true;
            }
            return false;
        }

        function validatePassword(password) {
            if (password.includes('!') || password.includes('@')) {
                return true;
            }
            return false;
        }

        function validateInput() {
            let username = document.getElementById('username');
            let password = document.getElementById('password');
            result = validateUsername(username.value) && validatePassword(password.value);
            var data = {
                "username": username.value
            };

            $.ajax({
                url: "/member/validate",
                type: "get",
                data: data,
                success: function (message) {
                    let jsonResult = JSON.parse(message)
                    if (!jsonResult.result) {
                        Swal.fire({title: '!!! 회원가입 실패 !!!', text: "중복된 아이디 입니다.", icon: 'error'});

                    } else if (result) {
                        Swal.fire({title: '회원 가입 성공', text: '회원 가입을 축하드립니다.', icon: 'success'});
                        document.forms[0].submit();
                    } else if (!validateUsername(username.value)) {
                        Swal.fire({title: '!!! 아이디 입력 실패 !!!', text: '5글자 이상 입력해주세요.', icon: 'error'});
                    } else if (!validatePassword(password.value)) {
                        Swal.fire({title: '!!! 비밀번호 입력 실패 !!!', text: '`!`이나 `@`를 추가해주세요.', icon: 'error'});
                    }
                }
            });
        }

    </script>

</head>
<body>
<div class="container-fluid">
    <div class="row vh-100 align-items-center text-center">
        <button type="button" class="btn btn-outline-success mb-4 mt-4" onclick="location.href='/main.jsp'">I W A N N A G O H O M
            E
        </button>
        <div class="row justify-content-center">
            <form action="/member/register_logic.jsp" method="post">
                <img class="mb-4" src="/images/brightQuokka.png" alt="귀여운 쿼카 사진">
                <h1 class="h3 mb-3 fw-normal">지누시네마에 오신걸 환영합니다</h1>
                <div class="row justify-content-center mb-2">
                    <div class="col-4">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="username" name="username" placeholder="아이디">
                            <label for="username">아이디 (5글자 이상)</label>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-2">
                    <div class="col-4">
                        <div class="form-floating">
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="비밀번호">
                            <label for="password">비밀번호 ('!'나 '@' 포함)</label>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-2">
                    <div class="col-4">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="nickname" name="nickname"
                                   placeholder="닉네임">
                            <label for="nickname">닉네임</label>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-2">
                    <div class="col-4">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="email" name="email"
                                   placeholder="이메일">
                            <label for="nickname">이메일</label>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mb-2">
                    <div class="col-5">
                        <div class="w-50 btn btn-lg btn-primary" onclick="validateInput()">회 원 가 입</div>
                        <br>
                        <p class="mt-5 mb-3 text-muted">© JINU CINEMA</p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
