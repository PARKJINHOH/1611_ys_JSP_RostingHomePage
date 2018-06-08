
<!-- HMI (Human Machine Interface) -->
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

						<h2 class="hs-line-3 mb-0">Since 2016</h2>
					</div>
				</div>

			</div>
		</section>

		<!-- nav메뉴 인클루드 -->
		<%@ include file="includeJSPF/navMenu.jspf"%>

		<section class="page-section" align="center"">
			<div class="full-wrapper relative clearfix">
				<div class="left" style="width: 15%; height: 100% px;">
					<img src="images/picture/logo.png" width="220" ;/></br> </br> </br>
					<ul>
						<li><a href="1st_country.jsp"><H3>나라별원두</H3></a></li>
						<ul>
							<div>
								<li><a href="1st__nam.jsp">남아메리카</a></li>
								<li><a href="1st__mid.jsp">중앙아메리카</a></li>
								<li><a href="1st__midmid.jsp">중동/극동지역</a></li>
								<li><a href="1st__afreeca.jsp">아프리카/기타</a></li>
							</div>
						</ul>
						</br>
						<li><a href="1st_been.jsp"><H3>원두종류</H3></a></li>
						</br>
					</ul>
				</div>
				<div class="right" id="fixed" align="center">
					<div class="home-text">
						<div
							style="width: 80%; height: 100%; float: left; margin-right: 300px;">
							<h1 class="hs-line-15 font-alt mb-50 mb-xs-30">중앙아메리카 원두 소개</h1>
							<img src="images/picture/MIDAMERICA.JPG" />
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
