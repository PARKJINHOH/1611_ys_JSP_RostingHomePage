<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String check = (String) session.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>

<title>JSP로스팅</title>

<!-- CSS선언부 인클루드 -->
<%@ include file="includeJSPF/cssInclude.jspf"%>

</head>
<body class="appear-animate" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return false">
	<!--oncontextmenu="return false" : 마우스 오른쪽 메뉴 금지
               ondragstart="return false" : 마우스 드래그 금지
               onselectstart="return false" : 선택 복사 금지-->

	<div class="page-loader">
		<div class="loader">Loading...</div>
	</div>

	<div class="page" id="top">

		<section class="page-section bg-dark bg-dark-alfa-50"
			data-background="images/picture/smart2.jpg" id="home">
			<div class="relative container">

				<div class="home-content">

					<div class="home-text">

						<h1 class="hs-line-14 font-alt mb-50 mb-xs-30">
							<a href="mainsample2.jsp" style="text-decoration: none">JSP로스팅</a>
							<!-- 화면 중앙에 gtsystem 대문자로 표기됨 -->
						</h1>

						<h2 class="hs-line-3 mb-0">관리자 페이지 입니다. 권한이 없는 분들은 나가주세요.</h2>
					</div>
				</div>

			</div>
		</section>

		<!-- nav메뉴 인클루드 -->
		<%@ include file="includeJSPF/navMenu.jspf"%>

		<section class="page-section" align="center"">
			<div class="full-wrapper relative clearfix">
				<!-- 좌측 사이드메뉴 -->
				<div class="left" style="width: 15%; height: 100% px;">
					<img src="images/picture/logo.png" width="220" ;/></br> </br> </br>
					<ul>
						<li><a href="recruit.jsp">회원목록(관리자용)</a></li>
					</ul>
				</div>
				<!-- 내용을 포함하는 div영역 -->
				<div class="right" id="fixed" align="center">
					<div class="home-text">
						<div
							style="width: 80%; height: 100%; float: left; margin-right: 300px">
							<h2 class="hs-line-15 font-alt mb-50 mb-xs-30">[ 관리자 페이지]</h2>
							<img src="images/picture/recruit.jpg" />
						</div>
					</div>
				</div>
			</div>

		</section>

		<hr class="mt-0 mb-0 " />

		<!-- footer영역 인클루드 -->
		<%@ include file="includeJSPF/footer.jspf"%>

	</div>

	<!-- 자바스크립트선언부 인클루드 -->
	<%@ include file="includeJSPF/javaScript.jspf"%>

</body>
</html>