let deleteMember = () => {
    let id = new URLSearchParams(window.location.search).get("id");
    let data = {
        "id": id
    }

    Swal.fire({
        title : '회원 탈퇴를 하시겠습니까?',
        showCancelButton : true,
        confirmButtonText: "탈퇴",
        cancelButtonText: "취소",
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url:"/member/delete",
                method: "get",
                data : data,
                success: function (message) {
                    let result = (JSON).parse(message);
                    if (result.status == "success") {
                        Swal.fire({
                            title: result.content,
                            text: result.message,
                            icon: result.status
                        }).then(() => {
                            location.href = result.nextPath;
                        });
                    } else {
                        Swal.fire({
                            title: result.content,
                            text: result.message,
                            icon: result.status
                        }).then(() => {
                            location.href = result.nextPath;
                        });
                    }
                }
            });
        }
    })




}