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
        cancelButtonText: "취소",
        confirmButtonText: "변경",
        denyButtonText: "거절",
        inputValidator: (value) => {
            if (!value) {
                return '변경할 등급을 선택해주세요!'
            }
        }
    }).then((rank) => {
        if (rank.isConfirmed) {
            location.href = "/member/updateRank_logic.jsp?id=" + memberId + "&rank=" + rank.value;
            Swal.fire({title: "변경 완료!"})
        } else if (rank.isDenied) {
            location.href = "/member/deleteRank_logic.jsp?id=" + memberId;
            Swal.fire({title: "거절 완료"})
        }
    })
}

function onlyUpdateLevel(memberId) {
    const inputOptions = new Promise((resolve) => {
        resolve({
            1: '1. 일반회원',
            2: '2. 평론가',
            3: '3. 관리자'
        })
    })
    Swal.fire({
        title: '등급 변경',
        input: 'radio',
        inputOptions: inputOptions,
        showCancelButton: true,
        cancelButtonText: "취소",
        confirmButtonText: "변경",
        inputValidator: (value) => {
            if (!value) {
                return '변경할 등급을 선택해주세요!'
            }
        }
    }).then((rank) => {
        if (rank.isConfirmed) {
            location.href = "/member/updateRank_logic.jsp?id=" + memberId + "&rank=" + rank.value;
            Swal.fire({title: "처리 완료!"})
        }
    })
}

function memberCare(memberId) {
    Swal.fire({
        title: '회원 관리',
        showDenyButton: true,
        showCancelButton: true,
        cancelButtonText: "취소",
        confirmButtonText: "등급 변경",
        denyButtonText: "강제 탈퇴",
    }).then((choice) => {
        if (choice.isConfirmed) {
            onlyUpdateLevel(memberId);
        } else if (choice.isDenied) {
            deleteMember(memberId);
        }
    })
}