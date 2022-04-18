<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
    <style>

      .container {
        display: flex;
        align-items: center;
        font-family: 'Noto Sans KR', sans-serif;
      }

      /* .container {
        border: 1px solid gray;
        padding: 50px;
        border-radius: 20px;
      } */

      .btn-osstem{
        color: white;
        background-color: #f47d36;
        border-color: #f47d36;
      }

      .btn-osstem:hover {
        color: white;
        background-color: #fc6d1a;
        border-color: #fc6d1a;
      }

      .btn-google{
        color: white;
        background-color: #f47d36;
        border-color: #f47d36;
      }

      .btn-google:hover {
        color: white;
        background-color: #fc6d1a;
        border-color: #fc6d1a;
      }

      .form-group {
        width: 400px;
      }

      #buttons {
        font-size: 13px;
        color: #888;
      }
      
      .find_text {
        border-right: 1px solid #888;
        padding-right: 40px;
      }

      a {
        color: black;
      }

      a:hover {
        color: #f47d36;
      }

      .form-control:focus {
        color: #495057;
        background-color: #fff;
        border-color: #f47d36;
        outline: 0;
        box-shadow: 0 0 0 0.25rem rgb(242 101 34 / 25%);
      }
    </style>
    
    <script>
      function sendText() {
        let name = "이동현";
        localStorage.setItem("name", name);
      }
    </script>
  </head>
    <div class="container">
      <div class="row">
        <div>
          <div class="form-block mx-5">
            <div class="text-center mb-5" style="border-bottom: 2px solid #f47d36; padding: 20px;">
              <h2 class="text-uppercase">Login to <strong style="color: #f47d36;" >Osstem</strong></h2>
            </div>
            <form action="#" method="post">
              <div class="form-group">
                <label for="username"><strong>아이디</strong></label>
                <input type="text" class="form-control" placeholder="Email@email.com" id="username"/>
              </div>
              <div class="form-group mb-3">
                <label for="password"><Strong>비밀번호</Strong></label>
                <input type="password" class="form-control" placeholder="Password" id="password" />
              </div>

              <div class="mb-4">
                <div id="buttons" class="row justify-content-between mx-3">
                  <span><a target="_blank" href="https://nid.naver.com/user2/api/route?m=routePwInquiry&amp;lang=ko_KR" class="find_text">비밀번호 찾기</a></span>
                  <span><a target="_blank" href="https://nid.naver.com/user2/api/route?m=routeIdInquiry&amp;lang=ko_KR" class="find_text">아이디 찾기</a></span>
                  <span><a href="signUpForm.html" onclick="sendText()">회원가입</a></span>
                </div>
              </div>
              
              <input type="submit" value="로그인" class="btn btn-block py-2 btn-osstem">
              <!-- <span class="text-center my-3 d-block">or</span>
              <a href="#" class="btn btn-block py-2 btn-primary"><i class="fab fa-google mr-2"></i> Google로 로그인 하기</a> -->
            </form>
          </div>
        </div>
      </div>
    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>