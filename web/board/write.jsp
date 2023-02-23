<%@ page import="model.UserDTO" %>
<%@ page import="dbConn.ConnectionMaker" %>
<%@ page import="dbController.BoardController" %>
<%@ page import="dbConn.MysqlConnectionMaker" %>
<%@ page import="model.BoardDTO" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <script src="/assets/build/ckeditor.js"></script>
    <%
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        if (logIn == null) {
            response.sendRedirect("/index.jsp");
        }

    %>
    <title>글 작성하기</title>
    <style>
        .ck-editor__editable {
            height: 500px;
        }
    </style>
</head>

<body>

<div class="container-fluid">
    <div class="align-items-center vh-100">
        <div class="col-10">
            <form action="/board/write_logic.jsp" method="post">
                <table class="table table-striped table-secondary">
                    <tr>
                        <th>제목</th>
                        <td>
                            <input type="text" name="title" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea id="editor" name="content"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <button class="btn btn-outline-success">
                                작성하기
                            </button>
                        </td>
                    </tr>

                </table>
            </form>
            <button class="btn btn-outline-success" onclick="location.href='/board/printList.jsp'">
                글 목록으로
            </button>
        </div>
    </div>
</div>
<script>
    ClassicEditor.create(document.querySelector('#editor'),{

    }).catch(error =>{
        console.log(error);
    });
</script>
</body>
</html>
