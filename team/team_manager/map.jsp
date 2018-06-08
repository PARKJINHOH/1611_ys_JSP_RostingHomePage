
<!-- 위치 구글지도첨부 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String check = (String) session.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>

<title>JSP 로스팅</title>

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
							<a href="mainsample2.jsp" style="text-decoration: none">JSP 로스팅</a>
							<!-- 화면 중앙에 gtsystem 대문자로 표기됨 -->
						</h1>

						<h2 class="hs-line-3 mb-0">Since 2016</h2>
					</div>
				</div>

			</div>
		</section>

		<!-- nav메뉴 인클루드 -->
		<%@ include file="includeJSPF/navMenu.jspf"%>

		<section class="page-section" align="center"">
			<div class="full-wrapper relative clearfix">
				<div class="left" style="width: 20%; height: 100% px;">
					<img src="images/picture/logo.png" width="220" ;/></br> </br> </br>
					<ul>
						<li><a href="info.jsp">회사소개</a></li>
						</br>
						<li><a href="ProJectName.jsp">프로잭트 명단</a></li>
						</br>
						<li><a href="map.jsp">위치</a></li>
						</br>
					</ul>
				</div>
				<div class="right" id="fixed" align="center">
					<div class="home-text">
						<div
							style="width: 80%; height: 100%; float: left; margin-right: 300px">
							<h1 class="hs-line-15 font-alt mb-50 mb-xs-30">위치</h1>
							


					<!-- 구글지도 iframe태그로 첨부 -->
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3169.7235004842632!2d126.90791574410962!3d37.39637072358287!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b66d4e7d1dfa7%3A0x90333c28b83c0e84!2z7Jew7ISx64yA7ZWZ6rWQ!5e0!3m2!1sko!2skr!4v1477967489824"
								width="800px" height="450px" frameborder="0" style="border: 0"
								allowfullscreen></iframe>
						</div>

					</div>
				</div>



				<div style="margin-left: 30%; margin-right: 20%;">
					<h2>[ 오시는길 ]</h2>
					<ul>
						<h3>지하철</h3>
						<li>지하철 1호선 : 안양역 하차 (1번 출구)</li>
						<li>- 스쿨버스 or 마을버스 1번 환승</li>
						<li></li>


						<h3>도보</h3>
						<li>안양역에서 도보로 15분</li>
						<li>안양 1번가 or 교보생명에서 도보로 10분</li>						
					</ul>
					
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
