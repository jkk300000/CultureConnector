<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

 <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.3/components/logins/login-7/assets/css/login-7.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo-culture-light.png" />

</head>
<body>
<body>
    <!-- Login 7 - Bootstrap Brain Component -->
<section class="bg-light p-3 p-md-4 p-xl-5">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6 col-xxl-5">
          <div class="card border border-light-subtle rounded-4">
            <div class="card-body p-3 p-md-4 p-xl-5">
              <div class="row">
                <div class="col-12">
                  <div class="mb-5">
                    <div class="text-center mb-4">
                      <a href="#!">
                        <img src="${pageContext.request.contextPath}/resources/images/logo-culture-light.png" width="100" height="57">
                      </a>
                    </div>
                    <h4 class="text-center">문화커넥터에 오신걸 환영합니다.</h4>
                  </div>
                </div>
              </div>
              
              <form action="${path}/login" method="post" id="loginFrm" name="loginFrm" >
                <div class="row gy-3 overflow-hidden">
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="text" class="form-control" name="memberId" id="memberId" placeholder="아이디를 입력하세요" required>
                      <label for="id" class="form-label">ID</label>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-floating mb-3">
                      <input type="password" class="form-control" name="memberPwd" id="memberPwd" value="" placeholder="Password" required>
                      <label for="password" class="form-label">Password</label>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" name="remember_me" id="remember_me">
                      <label class="form-check-label text-secondary" for="remember_me">
                        로그인 유지
                      </label>
                    </div>
                  </div>
                  <div class="col-12">
                    <div class="d-grid">
                      <button class="btn bsb-btn-xl btn-primary" type="submit">로그인</button>
                    </div>
                  </div>
                </div>
              </form>
              
              <div class="row">
                <div class="col-12">
                  <hr class="mt-5 mb-4 border-secondary-subtle">
                  <div class="d-flex gap-2 gap-md-4 flex-column flex-md-row justify-content-md-end">
                    <a href="${path}/member/enroll" class="link-secondary text-decoration-none">회원가입</a>
                    <a href="#!" class="link-secondary text-decoration-none">아이디 찾기</a>
                    <a href="#!" class="link-secondary text-decoration-none">비밀번호 찾기</a>
                  </div>
                </div>
              </div>
              <div style="margin-left:80px; margin-top:20px">
              <h6>소셜 계정으로 가입하기(  
              <a style="border: none;" href="https://accounts.google.com/o/oauth2/v2/auth?response_type=code&client_id=279034163666-29bpefgl96tg0c3tosugfbrf9d3bgogj.apps.googleusercontent.com&redirect_uri=http://localhost:8080/mvc/member/enroll/google&scope=profile email">구글/</a>
              <a style="border: none;" href="">네이버/</a>
              <a style="border: none;" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=28661b9849fd4704ad288e59fe9b571c&redirect_uri=http://localhost:8080/mvc/member/enroll/kakao">카카오</a>) </h6>
              </div>
              <div class="row">
                <div class="col-12">
                  <p class="mt-5 mb-5" id="socialLoginMsg" style="text-align:center;">소셜 로그인</p>
				
                  
                  <div class="d-flex gap-2 gap-sm-3 justify-content-center">
                    <a href="https://accounts.google.com/o/oauth2/v2/auth?response_type=code&client_id=279034163666-29bpefgl96tg0c3tosugfbrf9d3bgogj.apps.googleusercontent.com&redirect_uri=http://localhost:8080/mvc/member/enroll/google&scope=profile email" class="btn btn-lg btn-outline-dark p-3 lh-1">
                      <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor"  class="bi bi-google" viewBox="0 0 16 16">
                        <path d="M15.545 6.558a9.42 9.42 0 0 1 .139 1.626c0 2.434-.87 4.492-2.384 5.885h.002C11.978 15.292 10.158 16 8 16A8 8 0 1 1 8 0a7.689 7.689 0 0 1 5.352 2.082l-2.284 2.284A4.347 4.347 0 0 0 8 3.166c-2.087 0-3.86 1.408-4.492 3.304a4.792 4.792 0 0 0 0 3.063h.003c.635 1.893 2.405 3.301 4.492 3.301 1.078 0 2.004-.276 2.722-.764h-.003a3.702 3.702 0 0 0 1.599-2.431H8v-3.08h7.545z" />
                      </svg>
                    </a>
                    <a href="#!" class="btn btn-lg btn-outline-success p-3 lh-1">
                        <svg width="28" height="28" viewBox="0 0 20 20" fill="currentColor" class="bi bi-naver" xmlns="http://www.w3.org/2000/svg">
                            <path d="M18 20H2C0.9 20 0 19.1 0 18V2C0 0.9 0.9 0 2 0H18C19.1 0 20 0.9 20 2V18C20 19.1 19.1 20 18 20Z" fill="#03C75A"/>
                            <path d="M11.35 10.25L8.50002 6.19995H6.15002V13.8H8.65002V9.74995L11.5 13.8H13.85V6.19995H11.35V10.25Z" fill="white"/>
                        </svg>
                    </a>

                   <a id="btn" href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=28661b9849fd4704ad288e59fe9b571c&redirect_uri=http://localhost:8080/mvc/kakaoLogin" class="btn btn-lg btn-outline-success p-3 lh-1" style="">
                   		
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="bi bi-kakao" width="28" height="28" >  
                            <path d="M12 3c5.799 0 10.5 3.664 10.5 8.185 0 4.52-4.701 8.184-10.5 8.184a13.5 13.5 0 0 1-1.727-.11l-4.408 2.883c-.501.265-.678.236-.472-.413l.892-3.678c-2.88-1.46-4.785-3.99-4.785-6.866C1.5 6.665 6.201 3 12 3zm5.907 8.06l1.47-1.424a.472.472 0 0 0-.656-.678l-1.928 1.866V9.282a.472.472 0 0 0-.944 0v2.557a.471.471 0 0 0 0 .222V13.5a.472.472 0 0 0 .944 0v-1.363l.427-.413 1.428 2.033a.472.472 0 1 0 .773-.543l-1.514-2.155zm-2.958 1.924h-1.46V9.297a.472.472 0 0 0-.943 0v4.159c0 .26.21.472.471.472h1.932a.472.472 0 1 0 0-.944zm-5.857-1.092l.696-1.707.638 1.707H9.092zm2.523.488l.002-.016a.469.469 0 0 0-.127-.32l-1.046-2.8a.69.69 0 0 0-.627-.474.696.696 0 0 0-.653.447l-1.661 4.075a.472.472 0 0 0 .874.357l.33-.813h2.07l.299.8a.472.472 0 1 0 .884-.33l-.345-.926zM8.293 9.302a.472.472 0 0 0-.471-.472H4.577a.472.472 0 1 0 0 .944h1.16v3.736a.472.472 0 0 0 .944 0V9.774h1.14c.261 0 .472-.212.472-.472z"/> 
                        </svg>

                    </a>
                       
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>







</html>