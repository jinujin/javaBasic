function printList(replyArray) {
    let temp = new URLSearchParams(window.location.search).get("id");
    replyArray.forEach(reply => {
        let div = $(document.createElement("div"));
        let td = $(document.createElement("td")).attr("colspan", "2");
        let str = reply.writer + ": " + reply.content + " at " + reply.date;

        $(td).text(str);
        if (reply.isOwned == true) {
            let btnUpdate = $(document.createElement("div")).addClass("badge bg-success").text("수정");
            btnUpdate.click(() => {
                updateUi(td, reply);
            });
            let btnDelete = $(document.createElement("div")).addClass("badge bg-danger ").text("삭제");
            btnDelete.click(() => {
                deleteReply(reply.id);
            });
            $(td).append(btnUpdate);
            $(td).append(btnDelete);
        }
        $(tr).append(td);
        $('#tbody-reply').append(tr);
    });
}
function updateUi(td, reply) {
    let divDelete = $(document.createElement("div")).addClass("for-update");
    let deleteDiv = $(divDelete).parent(); // 모든 자식 노드들 삭제
    $(deleteDiv).html("");
    let spanHead = $(document.createElement("span")).
        addClass("input-group-text");
    let spanBtn = $(document.createElement("span")).
        addClass("btn").
        attr("type","submit").click().text("확 인");
    let form = $(document.createElement("form")).
        attr("action","/movie/updateReview_logic.jsp?id=<%=gid%>&filmId=<%=filmId%>").
        attr("method","post");
    let div = $(document.createElement("div"));
    let label = $(document.createElement("label")).attr("for","score").
        addClass("form-label").text("Score");
    let select = $(document.createElement("select")).
        attr("id","score").
        attr("name","score").
        addClass("form-select is-invalid form-control");
    let option = $(document.createElement("option"));

    let input =
        $(document.createElement("textarea")).
        attr("aria-label", "With textarea").
        attr("style","height: 110px").
        attr("name","criticism").
        addClass("form-control").val(reply.content);

    // let newform = $(document.createElement("td")).addClass("d-flex").attr("colspan","2").append(form).append(btnUpdate);

    // $(tr).append(newTd);

}