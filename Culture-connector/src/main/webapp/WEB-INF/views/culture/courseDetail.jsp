
<%@ page import="com.multi.mvc.culture.model.vo.Course" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<%
    // course 객체가 request, session, 또는 다른 범위에 어디에 저장되어 있는지에 따라 수정해야 합니다.
    Course course = (Course) request.getAttribute("course");
	
%>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title> 문화 커넥터 </title>
	<!-- Meta Tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Booking - Multipurpose Online Booking Theme">
	
	<!-- 카카오톡 공유 기능 사용하는데 필요한 자바스크립트 파일 -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.6.0/kakao.min.js" ></script> 
	
	<!-- 카카오맵 기능 사용하는데 필요한 자바스크립트 파일/ appkey는 kakaoDeveloper 사이트에서 생성한 고유 javaScript 키를 입력하면 됩니다. -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb83919493996c6c554671877067a90a&libraries=services"></script>

	<!-- Favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo-culture-light.png">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Poppins:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tiny-slider.css">
	<link rel="stylesheet" type="text/css" href="a${pageContext.request.contextPath}/resources/css/glightbox.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/css/flatpickr.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">

</head>
<jsp:include page="/WEB-INF/views/common/cultureheader.jsp">
<jsp:param value="문화시설 상세" name="title"/>
</jsp:include>
<body>

	

<!-- **************** MAIN CONTENT START **************** -->
<main>

	<section class="pb-0 pb-xl-5">
	<div class="container">
		<div class="row g-4 justify-content-between align-items-center">
			<!-- Left side START -->
			<div class="col-lg-5 position-relative">
				<!-- Svg Decoration -->
				<figure class="position-absolute top-0 start-0 translate-middle z-index-1 ms-4">
					<svg class="fill-warning" width="77px" height="77px">
						<path d="M76.997,41.258 L45.173,41.258 L67.676,63.760 L63.763,67.673 L41.261,45.171 L41.261,76.994 L35.728,76.994 L35.728,45.171 L13.226,67.673 L9.313,63.760 L31.816,41.258 L-0.007,41.258 L-0.007,35.725 L31.816,35.725 L9.313,13.223 L13.226,9.311 L35.728,31.813 L35.728,-0.010 L41.261,-0.010 L41.261,31.813 L63.763,9.311 L67.676,13.223 L45.174,35.725 L76.997,35.725 L76.997,41.258 Z"></path>
					</svg>
				</figure>

				<!-- Svg decoration -->
				 <figure class="position-absolute bottom-0 end-0 d-none d-md-block mb-n5 me-n4">
					<svg height="400" class="fill-primary opacity-2" viewBox="0 0 340 340">
						<circle cx="194.2" cy="2.2" r="2.2"></circle>
						<circle cx="2.2" cy="2.2" r="2.2"></circle>
						<circle cx="218.2" cy="2.2" r="2.2"></circle>
						<circle cx="26.2" cy="2.2" r="2.2"></circle>
						<circle cx="242.2" cy="2.2" r="2.2"></circle>
						<circle cx="50.2" cy="2.2" r="2.2"></circle>
						<circle cx="266.2" cy="2.2" r="2.2"></circle>
						<circle cx="74.2" cy="2.2" r="2.2"></circle>
						<circle cx="290.2" cy="2.2" r="2.2"></circle>
						<circle cx="98.2" cy="2.2" r="2.2"></circle>
						<circle cx="314.2" cy="2.2" r="2.2"></circle>
						<circle cx="122.2" cy="2.2" r="2.2"></circle>
						<circle cx="338.2" cy="2.2" r="2.2"></circle>
						<circle cx="146.2" cy="2.2" r="2.2"></circle>
						<circle cx="170.2" cy="2.2" r="2.2"></circle>
						<circle cx="194.2" cy="26.2" r="2.2"></circle>
						<circle cx="2.2" cy="26.2" r="2.2"></circle>
						<circle cx="218.2" cy="26.2" r="2.2"></circle>
						<circle cx="26.2" cy="26.2" r="2.2"></circle>
						<circle cx="242.2" cy="26.2" r="2.2"></circle>
						<circle cx="50.2" cy="26.2" r="2.2"></circle>
						<circle cx="266.2" cy="26.2" r="2.2"></circle>
						<circle cx="74.2" cy="26.2" r="2.2"></circle>
						<circle cx="290.2" cy="26.2" r="2.2"></circle>
						<circle cx="98.2" cy="26.2" r="2.2"></circle>
						<circle cx="314.2" cy="26.2" r="2.2"></circle>
						<circle cx="122.2" cy="26.2" r="2.2"></circle>
						<circle cx="338.2" cy="26.2" r="2.2"></circle>
						<circle cx="146.2" cy="26.2" r="2.2"></circle>
						<circle cx="170.2" cy="26.2" r="2.2"></circle>
						<circle cx="194.2" cy="50.2" r="2.2"></circle>
						<circle cx="2.2" cy="50.2" r="2.2"></circle>
						<circle cx="218.2" cy="50.2" r="2.2"></circle>
						<circle cx="26.2" cy="50.2" r="2.2"></circle>
						<circle cx="242.2" cy="50.2" r="2.2"></circle>
						<circle cx="50.2" cy="50.2" r="2.2"></circle>
						<circle cx="266.2" cy="50.2" r="2.2"></circle>
						<circle cx="74.2" cy="50.2" r="2.2"></circle>
						<circle cx="290.2" cy="50.2" r="2.2"></circle>
						<circle cx="98.2" cy="50.2" r="2.2"></circle>
						<circle cx="314.2" cy="50.2" r="2.2"></circle>
						<circle cx="122.2" cy="50.2" r="2.2"></circle>
						<circle cx="338.2" cy="50.2" r="2.2"></circle>
						<circle cx="146.2" cy="50.2" r="2.2"></circle>
						<circle cx="170.2" cy="50.2" r="2.2"></circle>
						<circle cx="194.2" cy="74.2" r="2.2"></circle>
						<circle cx="2.2" cy="74.2" r="2.2"></circle>
						<circle cx="218.2" cy="74.2" r="2.2"></circle>
						<circle cx="26.2" cy="74.2" r="2.2"></circle>
						<circle cx="242.2" cy="74.2" r="2.2"></circle>
						<circle cx="50.2" cy="74.2" r="2.2"></circle>
						<circle cx="266.2" cy="74.2" r="2.2"></circle>
						<circle cx="74.2" cy="74.2" r="2.2"></circle>
						<circle cx="290.2" cy="74.2" r="2.2"></circle>
						<circle cx="98.2" cy="74.2" r="2.2"></circle>
						<circle cx="314.2" cy="74.2" r="2.2"></circle>
						<circle cx="122.2" cy="74.2" r="2.2"></circle>
						<circle cx="338.2" cy="74.2" r="2.2"></circle>
						<circle cx="146.2" cy="74.2" r="2.2"></circle>
						<circle cx="170.2" cy="74.2" r="2.2"></circle>
						<circle cx="194.2" cy="98.2" r="2.2"></circle>
						<circle cx="2.2" cy="98.2" r="2.2"></circle>
						<circle cx="218.2" cy="98.2" r="2.2"></circle>
						<circle cx="26.2" cy="98.2" r="2.2"></circle>
						<circle cx="242.2" cy="98.2" r="2.2"></circle>
						<circle cx="50.2" cy="98.2" r="2.2"></circle>
						<circle cx="266.2" cy="98.2" r="2.2"></circle>
						<circle cx="74.2" cy="98.2" r="2.2"></circle>
						<circle cx="290.2" cy="98.2" r="2.2"></circle>
						<circle cx="98.2" cy="98.2" r="2.2"></circle>
						<circle cx="314.2" cy="98.2" r="2.2"></circle>
						<circle cx="122.2" cy="98.2" r="2.2"></circle>
						<circle cx="338.2" cy="98.2" r="2.2"></circle>
						<circle cx="146.2" cy="98.2" r="2.2"></circle>
						<circle cx="170.2" cy="98.2" r="2.2"></circle>
						<circle cx="194.2" cy="122.2" r="2.2"></circle>
						<circle cx="2.2" cy="122.2" r="2.2"></circle>
						<circle cx="218.2" cy="122.2" r="2.2"></circle>
						<circle cx="26.2" cy="122.2" r="2.2"></circle>
						<circle cx="242.2" cy="122.2" r="2.2"></circle>
						<circle cx="50.2" cy="122.2" r="2.2"></circle>
						<circle cx="266.2" cy="122.2" r="2.2"></circle>
						<circle cx="74.2" cy="122.2" r="2.2"></circle>
						<circle cx="290.2" cy="122.2" r="2.2"></circle>
						<circle cx="98.2" cy="122.2" r="2.2"></circle>
						<circle cx="314.2" cy="122.2" r="2.2"></circle>
						<circle cx="122.2" cy="122.2" r="2.2"></circle>
						<circle cx="338.2" cy="122.2" r="2.2"></circle>
						<circle cx="146.2" cy="122.2" r="2.2"></circle>
						<circle cx="170.2" cy="122.2" r="2.2"></circle>
						<circle cx="194.2" cy="146.2" r="2.2"></circle>
						<circle cx="2.2" cy="146.2" r="2.2"></circle>
						<circle cx="218.2" cy="146.2" r="2.2"></circle>
						<circle cx="26.2" cy="146.2" r="2.2"></circle>
						<circle cx="242.2" cy="146.2" r="2.2"></circle>
						<circle cx="50.2" cy="146.2" r="2.2"></circle>
						<circle cx="266.2" cy="146.2" r="2.2"></circle>
						<circle cx="74.2" cy="146.2" r="2.2"></circle>
						<circle cx="290.2" cy="146.2" r="2.2"></circle>
						<circle cx="98.2" cy="146.2" r="2.2"></circle>
						<circle cx="314.2" cy="146.2" r="2.2"></circle>
						<circle cx="122.2" cy="146.2" r="2.2"></circle>
						<circle cx="338.2" cy="146.2" r="2.2"></circle>
						<circle cx="146.2" cy="146.2" r="2.2"></circle>
						<circle cx="170.2" cy="146.2" r="2.2"></circle>
						<circle cx="194.2" cy="170.2" r="2.2"></circle>
						<circle cx="2.2" cy="170.2" r="2.2"></circle>
						<circle cx="218.2" cy="170.2" r="2.2"></circle>
						<circle cx="26.2" cy="170.2" r="2.2"></circle>
						<circle cx="242.2" cy="170.2" r="2.2"></circle>
						<circle cx="50.2" cy="170.2" r="2.2"></circle>
						<circle cx="266.2" cy="170.2" r="2.2"></circle>
						<circle cx="74.2" cy="170.2" r="2.2"></circle>
						<circle cx="290.2" cy="170.2" r="2.2"></circle>
						<circle cx="98.2" cy="170.2" r="2.2"></circle>
						<circle cx="314.2" cy="170.2" r="2.2"></circle>
						<circle cx="122.2" cy="170.2" r="2.2"></circle>
						<circle cx="338.2" cy="170.2" r="2.2"></circle>
						<circle cx="146.2" cy="170.2" r="2.2"></circle>
						<circle cx="170.2" cy="170.2" r="2.2"></circle>
						<circle cx="194.2" cy="194.2" r="2.2"></circle>
						<circle cx="2.2" cy="194.2" r="2.2"></circle>
						<circle cx="218.2" cy="194.2" r="2.2"></circle>
						<circle cx="26.2" cy="194.2" r="2.2"></circle>
						<circle cx="242.2" cy="194.2" r="2.2"></circle>
						<circle cx="50.2" cy="194.2" r="2.2"></circle>
						<circle cx="266.2" cy="194.2" r="2.2"></circle>
						<circle cx="74.2" cy="194.2" r="2.2"></circle>
						<circle cx="290.2" cy="194.2" r="2.2"></circle>
						<circle cx="98.2" cy="194.2" r="2.2"></circle>
						<circle cx="314.2" cy="194.2" r="2.2"></circle>
						<circle cx="122.2" cy="194.2" r="2.2"></circle>
						<circle cx="338.2" cy="194.2" r="2.2"></circle>
						<circle cx="146.2" cy="194.2" r="2.2"></circle>
						<circle cx="170.2" cy="194.2" r="2.2"></circle>
						<circle cx="194.2" cy="218.2" r="2.2"></circle>
						<circle cx="2.2" cy="218.2" r="2.2"></circle>
						<circle cx="218.2" cy="218.2" r="2.2"></circle>
						<circle cx="26.2" cy="218.2" r="2.2"></circle>
						<circle cx="242.2" cy="218.2" r="2.2"></circle>
						<circle cx="50.2" cy="218.2" r="2.2"></circle>
						<circle cx="266.2" cy="218.2" r="2.2"></circle>
						<circle cx="74.2" cy="218.2" r="2.2"></circle>
						<circle cx="290.2" cy="218.2" r="2.2"></circle>
						<circle cx="98.2" cy="218.2" r="2.2"></circle>
						<circle cx="314.2" cy="218.2" r="2.2"></circle>
						<circle cx="122.2" cy="218.2" r="2.2"></circle>
						<circle cx="338.2" cy="218.2" r="2.2"></circle>
						<circle cx="146.2" cy="218.2" r="2.2"></circle>
						<circle cx="170.2" cy="218.2" r="2.2"></circle>
						<circle cx="194.2" cy="242.2" r="2.2"></circle>
						<circle cx="2.2" cy="242.2" r="2.2"></circle>
						<circle cx="218.2" cy="242.2" r="2.2"></circle>
						<circle cx="26.2" cy="242.2" r="2.2"></circle>
						<circle cx="242.2" cy="242.2" r="2.2"></circle>
						<circle cx="50.2" cy="242.2" r="2.2"></circle>
						<circle cx="266.2" cy="242.2" r="2.2"></circle>
						<circle cx="74.2" cy="242.2" r="2.2"></circle>
						<circle cx="290.2" cy="242.2" r="2.2"></circle>
						<circle cx="98.2" cy="242.2" r="2.2"></circle>
						<circle cx="314.2" cy="242.2" r="2.2"></circle>
						<circle cx="122.2" cy="242.2" r="2.2"></circle>
						<circle cx="338.2" cy="242.2" r="2.2"></circle>
						<circle cx="146.2" cy="242.2" r="2.2"></circle>
						<circle cx="170.2" cy="242.2" r="2.2"></circle>
						<circle cx="194.2" cy="266.2" r="2.2"></circle>
						<circle cx="2.2" cy="266.2" r="2.2"></circle>
						<circle cx="218.2" cy="266.2" r="2.2"></circle>
						<circle cx="26.2" cy="266.2" r="2.2"></circle>
						<circle cx="242.2" cy="266.2" r="2.2"></circle>
						<circle cx="50.2" cy="266.2" r="2.2"></circle>
						<circle cx="266.2" cy="266.2" r="2.2"></circle>
						<circle cx="74.2" cy="266.2" r="2.2"></circle>
						<circle cx="290.2" cy="266.2" r="2.2"></circle>
						<circle cx="98.2" cy="266.2" r="2.2"></circle>
						<circle cx="314.2" cy="266.2" r="2.2"></circle>
						<circle cx="122.2" cy="266.2" r="2.2"></circle>
						<circle cx="338.2" cy="266.2" r="2.2"></circle>
						<circle cx="146.2" cy="266.2" r="2.2"></circle>
						<circle cx="170.2" cy="266.2" r="2.2"></circle>
						<circle cx="194.2" cy="290.2" r="2.2"></circle>
						<circle cx="2.2" cy="290.2" r="2.2"></circle>
						<circle cx="218.2" cy="290.2" r="2.2"></circle>
						<circle cx="26.2" cy="290.2" r="2.2"></circle>
						<circle cx="242.2" cy="290.2" r="2.2"></circle>
						<circle cx="50.2" cy="290.2" r="2.2"></circle>
						<circle cx="266.2" cy="290.2" r="2.2"></circle>
						<circle cx="74.2" cy="290.2" r="2.2"></circle>
						<circle cx="290.2" cy="290.2" r="2.2"></circle>
						<circle cx="98.2" cy="290.2" r="2.2"></circle>
						<circle cx="314.2" cy="290.2" r="2.2"></circle>
						<circle cx="122.2" cy="290.2" r="2.2"></circle>
						<circle cx="338.2" cy="290.2" r="2.2"></circle>
						<circle cx="146.2" cy="290.2" r="2.2"></circle>
						<circle cx="170.2" cy="290.2" r="2.2"></circle>
						<circle cx="194.2" cy="314.2" r="2.2"></circle>
						<circle cx="2.2" cy="314.2" r="2.2"></circle>
						<circle cx="218.2" cy="314.2" r="2.2"></circle>
						<circle cx="26.2" cy="314.2" r="2.2"></circle>
						<circle cx="242.2" cy="314.2" r="2.2"></circle>
						<circle cx="50.2" cy="314.2" r="2.2"></circle>
						<circle cx="266.2" cy="314.2" r="2.2"></circle>
						<circle cx="74.2" cy="314.2" r="2.2"></circle>
						<circle cx="290.2" cy="314.2" r="2.2"></circle>
						<circle cx="98.2" cy="314.2" r="2.2"></circle>
						<circle cx="314.2" cy="314.2" r="2.2"></circle>
						<circle cx="122.2" cy="314.2" r="2.2"></circle>
						<circle cx="338.2" cy="314.2" r="2.2"></circle>
						<circle cx="146.2" cy="314.2" r="2.2"></circle>
						<circle cx="170.2" cy="314.2" r="2.2"></circle>
						<circle cx="194.2" cy="338.2" r="2.2"></circle>
						<circle cx="2.2" cy="338.2" r="2.2"></circle>
						<circle cx="218.2" cy="338.2" r="2.2"></circle>
						<circle cx="26.2" cy="338.2" r="2.2"></circle>
						<circle cx="242.2" cy="338.2" r="2.2"></circle>
						<circle cx="50.2" cy="338.2" r="2.2"></circle>
						<circle cx="266.2" cy="338.2" r="2.2"></circle>
						<circle cx="74.2" cy="338.2" r="2.2"></circle>
						<circle cx="290.2" cy="338.2" r="2.2"></circle>
						<circle cx="98.2" cy="338.2" r="2.2"></circle>
						<circle cx="314.2" cy="338.2" r="2.2"></circle>
						<circle cx="122.2" cy="338.2" r="2.2"></circle>
						<circle cx="338.2" cy="338.2" r="2.2"></circle>
						<circle cx="146.2" cy="338.2" r="2.2"></circle>
						<circle cx="170.2" cy="338.2" r="2.2"></circle>
					</svg>
				</figure> 

				<!-- Image -->
				<img src="${course.firstimage}" class="rounded-3 position-relative" alt="">
				
			</div>
			<!-- Left side END -->

			<!-- Right side START -->
			<div class="col-lg-6">
				<h3 class="mb-3 mb-lg-5"><c:out value="${course.title}"/></h3>
				<p class="mb-3 mb-lg-5"><c:out value="${course.overview}"/></p>

				<!-- Features START -->
				<div class="row g-4">
					<!-- Item -->
					<div class="col-sm-6">
						<div class="icon-lg bg-orange bg-opacity-10 text-orange rounded-circle"><i class="bi bi-shield-fill-check"></i></div>
						<h5 class="mt-2">테 마</h5>
						<p class="mb-0"><c:out value="${course.theme }"/> </p>
					</div>
					<!-- Item -->
					<div class="col-sm-6">
						<div class="icon-lg bg-info bg-opacity-10 text-info rounded-circle"><i class="bi bi-lightning-fill"></i></div>
						<h5 class="mt-2">스케쥴</h5>
						<p class="mb-0"><c:out value="${course.schedule }"/></p>
					</div>		
				</div>
				
				<div class="row g-4">
					<!-- Item -->
					<div class="col-sm-6">
						<div class="icon-lg bg-orange bg-opacity-10 text-orange rounded-circle"><i class="bi bi-shield-fill-check"></i></div>
						<h5 class="mt-2">소요 시간</h5>
						<p class="mb-0"><c:out value="${course.taketime }"/> </p>
					</div>
					<!-- Item -->
					<div class="col-sm-6">
						<div class="icon-lg bg-info bg-opacity-10 text-info rounded-circle"><i class="bi bi-lightning-fill"></i></div>
						<h5 class="mt-2">거리</h5>
						<p class="mb-0"><c:out value="${course.distance }"/> </p>
					</div>		
				</div>
				
				<!-- Features END -->

			</div>
			<!-- Right side END -->
		</div>
	</div>
</section>




<section>
	<div class="container text-center">
		<div class="row mb-5 col-10 text-center">
	        
	         <!-- blog item-->
	          <c:if test="${not empty course.subcontenttitle0}">
		          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
		            <div class="card shadow border-0 h-100"><img class="img-fluid card-img-top" src="${course.subcontentfirstimage0 }">
		              <div class="card-body">
		                <h5 class="my-2">	<c:out value="${course.subcontenttitle0}"/></h5>
		                <p class="my-2 text-muted text-sm" id="truncateText0"> <c:out value="${course.subcontentaddoverview0}"/></p>
		              </div>
		            </div>
		          </div>
	          </c:if>
	         
	         <!-- blog item-->
	          <c:if test="${not empty course.subcontenttitle1}">
		          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
		            <div class="card shadow border-0 h-100"><img class="img-fluid card-img-top" src="${course.subcontentfirstimage1 }">
		              <div class="card-body">
		                <h5 class="my-2">	<c:out value="${course.subcontenttitle1}"/></h5>
		                <p class="my-2 text-muted text-sm" id="truncateText1" > <c:out value="${course.subcontentaddoverview1}"/></p>
		              </div>
		            </div>
		          </div>
	          </c:if>
	         
	         <!-- blog item-->
	          <c:if test="${not empty course.subcontenttitle2}">
		          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
		            <div class="card shadow border-0 h-100"><img class="img-fluid card-img-top" src="${course.subcontentfirstimage2 }">
		              <div class="card-body">
		                <h5 class="my-2">	<c:out value="${course.subcontenttitle2}"/></h5>
		                <p class="my-2 text-muted text-sm" id="truncateText2"> <c:out value="${course.subcontentaddoverview2}"/></p>
		              </div>
		            </div>
		          </div>
	          </c:if>
	         
	         <!-- blog item-->
	          <c:if test="${not empty course.subcontenttitle3}">
		          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
		            <div class="card shadow border-0 h-100"><img class="img-fluid card-img-top" src="${course.subcontentfirstimage3 }">
		              <div class="card-body">
		                <h5 class="my-2">	<c:out value="${course.subcontenttitle3}"/></h5>
		                <p class="my-2 text-muted text-sm" id="truncateText3"> <c:out value="${course.subcontentaddoverview3}"/></p>
		              </div>
		            </div>
		          </div>
	          </c:if>
	         
	         <!-- blog item-->
	          <c:if test="${not empty course.subcontenttitle4}">
		          <div class="col-lg-4 col-sm-6 mb-4 hover-animate">
		            <div class="card shadow border-0 h-100"><img class="img-fluid card-img-top" src="${course.subcontentfirstimage4 }">
		              <div class="card-body">
		                <h5 class="my-2">	<c:out value="${course.subcontenttitle4}"/></h5>
		                <p class="my-2 text-muted text-sm" id="truncateText4"> <c:out value="${course.subcontentaddoverview4}"/></p>
		              </div>
		            </div>
		          </div>
	          </c:if>
	         
	        
	         
	        </div>
		</div>
</section>


<!--  지도 시작 -->
<section>
	<div class="container">
		<div id="map" style="width:100%;height:600px;"></div>
	</div>
</section>
<!-- 자도 끝-->

	


</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- =======================
Footer START -->
<footer class="bg-dark pt-5">
  <div class="container">
      <!-- Row START -->
      <div class="row g-4">
          <!-- Widget 1 START -->
          <div class="col-lg-3">
              <!-- logo -->
              <a href="index.html">
                  <img class="h-40px" src="assets/images/logo-culture-light.png" alt="로고">
              </a>
              <p class="my-3 text-body-secondary">
                  문화커넥터와 함께 떠나는 문화여행
              </p>
             
          </div>
          <!-- Widget 1 END -->

          <!-- Widget 2 START -->
          <div class="col-lg-8 ms-auto">
              <div class="row g-4">
                  <!-- Link block -->
                  <div class="col-6 col-md-3">
                      <h5 class="text-white mb-2 mb-md-4">페이지</h5>
                      <ul class="nav flex-column text-primary-hover">
                          <li class="nav-item">
                              <a class="nav-link text-body-secondary" href="main.html"
                              >홈</a
                              >
                          </li>
                          <li class="nav-item">
                              <a class="nav-link text-body-secondary" href="cluture-theme1.html"
                              >문화 테마</a
                              >
                          </li>
                          <li class="nav-item">
                              <a class="nav-link text-body-secondary" href="cuisine-tour.html"
                              >음식 투어</a
                              >
                          </li>
                          <li class="nav-item">
                              <a class="nav-link text-body-secondary" href="cluture-news1.html"
                              >문화 소식</a
                              >
                          </li>
                          <li class="nav-item">
                              <a class="nav-link text-body-secondary" href="review-talk1.html"
                              >리뷰(수다톡)</a
                              >
                          </li>
                          <li class="nav-item">
                              <a class="nav-link text-body-secondary" href="cluture-tour-map.html"
                              >문화(여행) 지도</a
                              >
                          </li>
                      </ul>
                  </div>

                  <!-- Link block -->
                  <div class="col-6 col-md-3">
                      <h5 class="text-white mb-2 mb-md-4">회원정보</h5>
                      <ul class="nav flex-column text-primary-hover">
                          <li class="nav-item">
                              <a class="nav-link text-body-secondary" href="#">가입하기</a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link text-body-secondary" href="sign-in.html">로그인</a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link text-body-secondary" href="#"
                              >내정보</a
                              >
                          </li>
                         
                      </ul>
                  </div>
                  

              
           
          </div>
          <!-- Widget 2 END -->
      </div>
      <!-- Row END -->

     
  </div>
     <!-- Bottom footer -->
  <div class="row">
    <div class="container">
      <div
        class="d-lg-flex justify-content-between align-items-center py-3 text-center text-lg-start"
      >
        <!-- copyright text -->
        <div class="text-body-secondary text-primary-hover">
          저작권 ©2024 멀티캠퍼스 문화커넥터
       
        </div>
     
      </div>
    </div>
  </div>
</div>
</footer>
<!-- Footer END -->



<!-- Back to top -->
<div class="back-top"></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="assets/vendor/tiny-slider/tiny-slider.js"></script>
<script src="assets/vendor/purecounterjs/dist/purecounter_vanilla.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.js"></script>
<script src="assets/vendor/flatpickr/js/flatpickr.min.js"></script>
<script src="assets/vendor/choices/js/choices.min.js"></script>
<script src="assets/vendor/jarallax/jarallax.min.js"></script>
<script src="assets/vendor/jarallax/jarallax-video.min.js"></script>

<!-- ThemeFunctions -->
<script src="assets/js/functions.js"></script>


<script type="text/javascript">

/* Kakao.init('bb83919493996c6c554671877067a90a');
console.log(location.href) */
</script>



<!-- <script>
Kakao.init('bb83919493996c6c554671877067a90a'); // 사용하려는 앱의 JavaScript 키 입력
</script>
 -->


<script>



<!-- 카카오톡 공유 썸네일에 사용할 변수 -->
var thumbImg = document.getElementById("mainImage").value; //이미지 주소
console.log(thumbImg)
var thumbTitle = document.getElementById("locationName").value; 
console.log(thumbTitle)

<!-- 카카오톡 공유 기능 -->
Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: thumbTitle,
      description: '#부산',
      imageUrl:
    	  thumbImg,
      link: {
        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
        mobileWebUrl: 'https://developers.kakao.com',
        webUrl: location.href, // 현재 접속 중인 웹사이트 경로를 출력하는 함수
      },
    },
    social: {
      likeCount: 286,
      commentCount: 45,
      sharedCount: 845,
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: location.href,
        },
      },
      {
        title: '앱으로 보기',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: location.href,
        },
      },
    ],
  });
</script>

   
   
<script>

var title0 = '<%= (course != null && course.getSubcontenttitle0() != null) ? course.getSubcontenttitle0() : "" %>';
var x0 = '<%= (course != null && course.getSubcontentaddmapx0() != null) ? course.getSubcontentaddmapx0() : "" %>';
var y0 = '<%= (course != null && course.getSubcontentaddmapy0() != null) ? course.getSubcontentaddmapy0() : "" %>';

var title1 = '<%= (course != null && course.getSubcontenttitle1() != null) ? course.getSubcontenttitle1() : "" %>';
var x1 = '<%= (course != null && course.getSubcontentaddmapx1() != null) ? course.getSubcontentaddmapx1() : "" %>';
var y1 = '<%= (course != null && course.getSubcontentaddmapy1() != null) ? course.getSubcontentaddmapy1() : "" %>';

var title2 = '<%= (course != null && course.getSubcontenttitle2() != null) ? course.getSubcontenttitle2() : "" %>';
var x2 = '<%= (course != null && course.getSubcontentaddmapx2() != null) ? course.getSubcontentaddmapx2() : "" %>';
var y2 = '<%= (course != null && course.getSubcontentaddmapy2() != null) ? course.getSubcontentaddmapy2() : "" %>';

var title3 = '<%= (course != null && course.getSubcontenttitle3() != null) ? course.getSubcontenttitle3() : "" %>';
var x3 = '<%= (course != null && course.getSubcontentaddmapx3() != null) ? course.getSubcontentaddmapx3() : "" %>';
var y3 = '<%= (course != null && course.getSubcontentaddmapy3() != null) ? course.getSubcontentaddmapy3() : "" %>';

var title4 = '<%= (course != null && course.getSubcontenttitle4() != null) ? course.getSubcontenttitle4() : "" %>';
var x4 = '<%= (course != null && course.getSubcontentaddmapx4() != null) ? course.getSubcontentaddmapx4() : "" %>';
var y4 = '<%= (course != null && course.getSubcontentaddmapy4() != null) ? course.getSubcontentaddmapy4() : "" %>';


var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(y1, x1), // 지도의 중심좌표
    level: 8 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [];

if (title0 !== "") {
	positions.push({
	    title: title0,
	    latlng: new kakao.maps.LatLng(y0, x0)
	});
}

if (title0 !== "") {
	positions.push({
	    title: title1,
	    latlng: new kakao.maps.LatLng(y1, x1)
	});
}

if (title0 !== "") {
	positions.push({
	    title: title2,
	    latlng: new kakao.maps.LatLng(y2, x2)
	});
}

if (title0 !== "") {
	positions.push({
	    title: title3,
	    latlng: new kakao.maps.LatLng(y3, x3)
	});
}

if (title0 !== "") {
	positions.push({
	    title: title4,
	    latlng: new kakao.maps.LatLng(y4, x4)
	});
}
	


// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
   
   
}
</script>


	
	<!--  출력되는 글자수 제한 -->
<script>
	  <c:choose>
	      <c:when test="${empty course.subcontentfirstimage0}">
	          // 조건이 참일 때 실행되는 내용
	          var element0 = document.getElementById("truncateText0");
	          var maxLength = 200;
	          var truncatedText = element0.innerText.substring(0, maxLength) + "...";
	          element0.innerText = truncatedText;
	      </c:when>
	      <c:otherwise>
	          // 조건이 거짓일 때 실행되는 내용
	          var element0 = document.getElementById("truncateText0");
	          var maxLength = 60;
	          var truncatedText = element0.innerText.substring(0, maxLength) + "...";
	          element0.innerText = truncatedText;
	      </c:otherwise>
	  </c:choose>
	
	  <c:choose>
	      <c:when test="${empty course.subcontentfirstimage1}">
	          // 조건이 참일 때 실행되는 내용
	          var element1 = document.getElementById("truncateText1");
	          var maxLength = 200;
	          var truncatedText = element1.innerText.substring(0, maxLength) + "...";
	          element1.innerText = truncatedText;
	      </c:when>
	      <c:otherwise>
	          // 조건이 거짓일 때 실행되는 내용
	          var element1 = document.getElementById("truncateText1");
	          var maxLength = 60;
	          var truncatedText = element1.innerText.substring(0, maxLength) + "...";
	          element1.innerText = truncatedText;
	      </c:otherwise>
	  </c:choose>
	
	  <c:choose>
	      <c:when test="${empty course.subcontentfirstimage2}">
	          // 조건이 참일 때 실행되는 내용
	          var element2 = document.getElementById("truncateText2");
	          var maxLength = 200;
	          var truncatedText = element2.innerText.substring(0, maxLength) + "...";
	          element2.innerText = truncatedText;
	      </c:when>
	      <c:otherwise>
	          // 조건이 거짓일 때 실행되는 내용
	          var element2 = document.getElementById("truncateText2");
	          var maxLength = 60;
	          var truncatedText = element2.innerText.substring(0, maxLength) + "...";
	          element2.innerText = truncatedText;
	      </c:otherwise>
	  </c:choose>
	
	  <c:choose>
	      <c:when test="${empty course.subcontentfirstimage3}">
	          // 조건이 참일 때 실행되는 내용
	          var element3 = document.getElementById("truncateText3");
	          var maxLength = 200;
	          var truncatedText = element3.innerText.substring(0, maxLength) + "...";
	          element3.innerText = truncatedText;
	      </c:when>
	      <c:otherwise>
	          // 조건이 거짓일 때 실행되는 내용
	          var element3 = document.getElementById("truncateText3");
	          var maxLength = 60;
	          var truncatedText = element3.innerText.substring(0, maxLength) + "...";
	          element3.innerText = truncatedText;
	      </c:otherwise>
	  </c:choose>
	
	  <c:choose>
	      <c:when test="${empty course.subcontentfirstimage4}">
	          // 조건이 참일 때 실행되는 내용
	          var element4 = document.getElementById("truncateText4");
	          var maxLength = 200;
	          var truncatedText = element4.innerText.substring(0, maxLength) + "...";
	          element4.innerText = truncatedText;
	      </c:when>
	      <c:otherwise>
	          // 조건이 거짓일 때 실행되는 내용
	          var element4 = document.getElementById("truncateText4");
	          var maxLength = 60;
	          var truncatedText = element4.innerText.substring(0, maxLength) + "...";
	          element4.innerText = truncatedText;
	      </c:otherwise>
	  </c:choose>
	
</script>


</body>
</html>




















