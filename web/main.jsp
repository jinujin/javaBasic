<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <style>
        @import "/css/main.css";
    </style>


    <title>지누시네마</title>
</head>
<body>
<%@include file="/header_main.jsp" %>
<div class="container" style="min-height: 70%; min-width: 100%">
    <div class="wrapper">
        <main>
            <section id="mydiv" class="text-center">
                <div id="mybg" class="row">
                    <div id="bgtext" class="col">
                        <h1 class="fw-light">JINU CINEMA</h1>
                        <div class="justify-content-center align-items-center text-center">
                            <div class="lead text-muted">
                                지누 시네마는 최상의 관람환경, 양질의 컨텐츠로
                                영화를 통해 고객에게 행복한 기억을 선물합니다.
                                또한, 혁신적이고 편리한 시설과 차별화된 서비스로 고객과 행복한 기억을 공유하기 위해 끊임없이 노력하고 있습니다.
                                앞으로도 지속적인 발전을 통해 고객의 마음에 즐거움을 선사하는 문화공간으로 특별한 감동을 선사하겠습니다.
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </main>
    </div>
</div>
<%@include file="/footer.jsp" %>

</body>
</html>
