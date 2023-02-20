<%@ page import="model.MemberDTO" %>
<%@ page import="connector.ConnectionMaker" %>
<%@ page import="connector.MysqlConnectionMaker" %>
<%@ page import="controller.MemberController" %><%--
  Created by IntelliJ IDEA.
  User: JinWoo
  Date: 2023-02-15
  Time: 오후 5:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
          crossorigin="anonymous"></script>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Nunito:wght@700&display=swap');


    main div button {
      font-family: "Noto Sans KR", "Roboto", "dotum", "sans-serif";
      vertical-align: middle;
      -webkit-appearance: none;
      cursor: pointer;
      padding-left: 18px;
      font-size: 11px;
      color: #000;
      background: url("/images/bgcloud.jpg") no-repeat 0 center;
      height: 15px;
      line-height: 15px;
      border: 0;
    }


  </style>

  <%
    MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");
    if (logIn == null) {
      response.sendRedirect("/main.jsp");
    }
//    int id = Integer.parseInt(request.getParameter("id"));
    ConnectionMaker connectionMaker = new MysqlConnectionMaker();
    MemberController memberController = new MemberController(connectionMaker);

    MemberDTO m = memberController.selectOne(1);

    pageContext.setAttribute("memberController", memberController);

  %>
  <title>내 정보</title>
</head>
<body>
<div class="container">
  <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
    <a href="/main.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
      <svg class="bi me-2" width="150" height="40" role="img">z
        <defs>
          <mask id="mask">
            <image xlink:href="data:image/jpeg;base64,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"></image>
          </mask>
        </defs>
        <text mask="url(#mask)" x="0" y="35" font-size="22" font-family="Arial" font-weight="bold">
          JINU CINEMA
        </text>
      </svg>
    </a>

    <ul id="head_bar" class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
      <li><a href="/main.jsp" class="nav-link px-5 link-dark">메인</a></li>
      <li><a href="#" class="nav-link px-5 link-dark">영화</a></li>
      <li><a href="#" class="nav-link px-5 link-dark">극장</a></li>
      <li><a href="#" class="nav-link px-5 link-dark">상영정보</a></li>
      <%--<li><a href="#" class="nav-link px-2 link-dark"></a></li> <!--영화 순위 (평점 기준)-->--%>
    </ul>
    <div class="col-md-3 text-end">
      <button type="button" class="btn btn-outline-primary me-2" onclick="location.href='/member/mypage.jsp?id=<%=logIn.getId()%>'">
        내 정보
      </button>
      <button type="button" class="btn btn-primary" onclick="location.href='/member/logout.jsp'">로그아웃
      </button>
    </div>
  </header>
  <main>
    <div class="fs-2">
      <span class="fw-bold"><%=m.getNickname()%>님</span> 반가워요!
    </div>
    <div>
      <button type="button" class="btn_txt_edit" title="레이어팝업 열기">편집</button>
    </div>
    <div>
      <button type="button" class="btn_txt_edit btnFocus" title="레이어팝업 열기">편집focus</button>
    </div>

    <main>
      <div class="subindex_item">
        <div class="subindex_greenbox">
          <div class="myprofile">
            <div class="info_title">
              <h3 class="title_text">기본정보</h3>
              <a href="javascript:;" id="info1" class="link_info" aria-expanded="false"><span class="blind">도움말</span></a>

              <div id="info1ToolTip" class="info_tooltip" aria-hidden="true" style="display: none;">
                <strong class="info_head">사용자 이름</strong>
                <p class="info_desc">유료, 게임 등의 일부 서비스를 이용하려면 “본인확인”을 통한 실명 정보 확인이 필요합니다. 이름, 생년월일, 성별 정보가 변경되었다면 수정도 할 수 있습니다.</p>
                <strong class="info_head">연락처 이메일</strong>
                <p class="info_desc">네이버 서비스의 변경/종료 등 대부분의 네이버 안내에 사용합니다.</p>
                <strong class="info_head">본인확인 이메일</strong>
                <p class="info_desc">아이디, 비밀번호 찾기, 로그인이 안되는 경우 등 본인확인이 필요한 경우 사용합니다.</p>
                <button type="button" id="infoExit1" class="btn_exit"><span class="blind">닫기</span></button>
              </div>

            </div>
            <ul class="myinfo_area">
              <li>
                <div class="myphoto">
                  <img src="https://static.nid.naver.com/images/web/user/default.png" width="56" height="56" alt="내 프로필 이미지">
                </div>
              </li>
              <li>
                <div class="myaccount">
                  <div class="myname">
                    <div class="name_text">김진우</div>
                    <button type="button" class="btn_edit" onclick="changeName()">
                      <span class="text">실명수정</span>
                    </button>
                  </div>
                  <div class="myaddress">espin97@naver.com</div>
                </div>
              </li>
            </ul>
          </div>

          <ul class="subindex_row">
            <li>
              <div id="phoneNoRegDiv" class="row_item phone ">
                <span id="phoneNoRegSpan" class="item_text">+82 10-3***-6***</span>
                <button type="button" id="phoneNoRegBtn" class="btn_edit" onclick="showPhoneNumberChangePopUp()">
                  <span id="phoneNoRegBtnTxt" class="text">수정</span>
                </button>
              </div>
            </li>

            <li>
              <div class="row_item mail ">
                <span id="myLetterEmailRegSpan" class="item_text">es******@n*******.com</span>
                <button type="button" class="btn_edit" onclick="showMyLetterEmailChangePopUp()">
                  <span class="text">수정</span>
                </button>
              </div>
              <div id="pswdEmailRegDiv" class="row_item mail ">
                <span id="pswdEmailRegSpan" class="item_text">eu******@n*******.com</span>
                <button type="button" id="pswdEmailRegBtn" class="btn_edit" onclick="showPswdEmailChangePopUp()">
                  <span id="pswdEmailRegBtnTxt" class="text">수정</span>
                </button>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </main>

  </main>
</div>

</body>
</html>

<div class="bd-example">
  <ul class="list-group list-group-flush">
    <li class="list-group-item">An item</li>
    <li class="list-group-item">A second item</li>
    <li class="list-group-item">A third item</li>
    <li class="list-group-item">A fourth item</li>
    <li class="list-group-item">And a fifth one</li>
  </ul>
</div>


