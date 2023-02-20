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

        @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nunito:wght@700&display=swap');


        #mybg {
            position: relative;
            background-image: url("/images/bgtheater.webp");
            background-size: cover;
            width: 100%;
            height: 100%;
        }

        #mydiv {
            width: 51rem;
            height: 31rem;
        }

        #bgtext {
            padding: 50px 40px 0;
            width: 60%;
        }

        #bgtext > div > div {
            position: absolute;
            font-family: 'Gowun Dodum', sans-serif;
            animation-name: move;
            animation-duration: 10s;
            animation-play-state: running;
            animation-iteration-count: 1;
            animation-direction: normal;
            width: 80%;
            text-align: center;

        }

        #bgtext > div {
            width: 100%;
            height: 60%;
            display: flex;
        }

        #mybg > div > h1 {
            font-family: 'Nunito', sans-serif;
        }

        .fw-light {
            margin: 0;
        }

        @keyframes move {
            0% {
                /*bottom: 220px;*/
                bottom: 30%;
            }
            100% {
                /*bottom: 360px;*/
                bottom: 50%;
            }


        }

    </style>


    <title>지누시네마</title>
</head>
<body>
<% // 서블릿 틀릿
    request.setCharacterEncoding("UTF-8");

%>


<div class="container">
    <div class="wrapper">
        <%@include file="/header_main.jsp" %>
        <main>
            <section id="mydiv" class="text-center container">
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
    <%@include file="/footer.jsp" %>

</div>
</body>
</html>
