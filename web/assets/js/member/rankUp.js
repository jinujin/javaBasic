
let rankUp = (memberId) => {
    let data = {
        "memberId": memberId,
    };
    const inputOptions = new Promise((resolve) => {
        resolve({
            1: '1. 일반회원',
            2: '2. 평론가',
            3: '3. 관리자'
        })
    })
    Swal.fire({
        title: '등업 신청',
        input: 'radio',
        inputOptions: inputOptions,
        showCancelButton: true,
        showDenyButton: true,
        cancelButtonText: "취소",
        confirmButtonText: "신청",
        denyButtonText: "기존 신청 취소",
        inputValidator: (value) => {
            if (!value) {
                return '변경할 등급을 선택해주세요!'
            }
        }
    }).then((rank) => {
        data["rank"] = rank.value;
        if (rank.isConfirmed) {
            $.ajax({
                url: "/member/updateRank",
                data: data,
                method: "get",
                success: (message) => {
                    let resp = JSON.parse(message);
                    console.log(resp);
                    if (resp.status == 'success') {
                        Swal.fire({
                            title: resp.content,
                            text: resp.message,
                            icon: resp.status
                        }).then(() => {
                            location.href = resp.nextPath;
                        });
                    } else {
                        Swal.fire({
                            title: resp.content,
                            text: resp.message,
                            icon: resp.status
                        }).then(() => {
                            location.href = resp.nextPath;
                        });
                    }
                }
            })
        } else if (rank.isDenied) {
            location.href = "/member/updateCancel_logic.jsp?id=" + memberId;
            Swal.fire({
                title: "신청 취소 완료",
                text: "이전에 신청한 내역을 취소합니다.",
                icon: "success",
            })
        }
    })
}