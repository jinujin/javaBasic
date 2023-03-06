let auth = () => {
    let username = $('#username').val();
    let password = $('#password').val();

    let data = {
        "username" : username,
        "password" : password
    };
    $.ajax({
        url:"/member/auth",
        method : "post",
        data : data,
        success : function (message) {
            let result = (JSON).parse(message);
            if (result.result == 'success') {
                location.href = "/main.jsp";
            } else {
                Swal.fire({title:"로그인 실패", text: "아이디와 비밀번호를 다시 확인해주세요.", icon: 'warning'})
            }
            
        }
    })
}