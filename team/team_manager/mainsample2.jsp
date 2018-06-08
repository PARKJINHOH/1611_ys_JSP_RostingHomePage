<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String check = (String) session.getAttribute("name");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 메인페이지 -->
<head>
<title>(주)JSP로스팅</title>

<!-- css선언부 인클루드 -->
<%@ include file="includeJSPF/cssInclude.jspf"%>

</head>

<!-- 몸체부 -->
<body class="appear-animate" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return false">
	<!--oncontextmenu="return false" : 마우스 오른쪽 메뉴 금지
               ondragstart="return false" : 마우스 드래그 금지
               onselectstart="return false" : 선택 복사 금지-->

	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>

	<div class="page" id="top">
		<!-- 백그라운드 -->
		<section class="home-section bg-dark bg-dark-alfa-50"
			data-background="images/picture/backgroundImage.jpg" id="home">
		<div></div>
		<div class="js-height-full container">
			<div class="bg-video-wrapper" id="video-background-1">
				<div class="bg-video-overlay bg-dark-alfa-50"></div>
			</div>

			<div>
				<div bgcolor="000000"></div>
			</div>
			<div class="home-content">
				<div class="home-text">
					<h1 class="hs-line-14 font-alt mb-50 mb-xs-30">
						<!-- 화면 중앙에 gtsystem 대문자로 표기됨 -->
						<a href="mainsample2.jsp" style="text-decoration: none">JSP로스팅</a>
					</h1>
					<h2 class="hs-line-3 mb-0">Since 2016</h2>
				</div>
			</div>
		</div>
		</section>

		<!-- 네비메뉴 인클루드 -->
		<%@include file="includeJSPF/navMenu.jspf"%>

		<hr width="90%" size="2" align="center" color="black">




		<!-- 이미지슬라이더 -->
		<section class="page-section pt-0 pb-0">
		<div class="relative">

			<div class="image-carousel bg-dark">

				<div>
					<div class="post-prev-img mb-0">
						<a href="images/picture/sub_1.jpg"
							class="lightbox-gallery-2 mfp-image"><img
							src="images/picture/sub_1.jpg" alt="" /></a>
					</div>
				</div>

				<div>
					<div class="post-prev-img mb-0">
						<a href="images/picture/sub_2.jpg"
							class="lightbox-gallery-2 mfp-image"><img
							src="images/picture/sub_2.jpg" alt="" /></a>
					</div>
				</div>
				<div>
					<div class="post-prev-img mb-0">
						<a href="images/picture/sub_3.jpg"
							class="lightbox-gallery-2 mfp-image"><img
							src="images/picture/sub_3.jpg" alt="" /></a>
					</div>
				</div>
				
			</div>

		</div>
		</section>
		

		<!-- footer영역 인클루드 -->
		<%@ include file="includeJSPF/footer.jspf"%>

	</div>

	<!-- 자바스크립트 선언부 인클루드 -->
	<%@ include file="includeJSPF/javaScript.jspf"%>

</body>
</html>
