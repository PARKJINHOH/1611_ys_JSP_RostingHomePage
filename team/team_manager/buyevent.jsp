
<!-- feature폰 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String check = (String) session.getAttribute("name");
%>

<!DOCTYPE html>
<html>
<head>

<title>GTSystem㈜</title>
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
							<a href="mainsample2.jsp" style="text-decoration: none">GTSystem</a>
							<!-- 화면 중앙에 gtsystem 대문자로 표기됨 -->
						</h1>

						<h2 class="hs-line-3 mb-0">Since 2009-March &bull; Seocho-gu
							&bull; GT-System</h2>
					</div>
				</div>

			</div>
		</section>

		<!-- nav메뉴 인클루드 -->
		<%@ include file="includeJSPF/navMenu.jspf"%>

		<section class="page-section" align="center">
			<div class="full-wrapper relative clearfix">

				<div class="left" style="width: 15%; height: 100% px; float: left;">
					<img src="images/picture/logo.png" width="220" ;/></br> </br>
					<ul>
						<li><a href="ips.jsp">IPS 실내측위 시스템 솔루션</a></li>
						</br>
						<li><a href="dtg.jsp">DTG ETAS 전송어플</a></li>
						</br>
						<li><a href="and.jsp">Android Application</a></li>
						</br>
						<li><a href="avn.jsp">AVN System</a></li>
						</br>
						<li><a href="smart.jsp">Smart Phone</a></li>
						</br>
						<li><a href="feature.jsp">Feature Phone</a></li>
						</br>
					</ul>
				</div>


				<div class="right" id="fixed" align="center">
					<div class="home-text">
						<div
							style="width: 80%; height: 100%; float: left; margin-right: 300px">
							<h1 class="hs-line-15 font-alt mb-50 mb-xs-30">Feature Phone
							</h1>
							<h3></h3>
							<img src="images/picture/feature1.jpg" /> <img
								src="images/picture/feature2.jpg" />
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
