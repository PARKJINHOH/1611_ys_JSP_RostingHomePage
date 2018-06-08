<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 로그인 -->
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
							<a href="mainsample2.jsp" style="text-decoration: none">JSP로스팅 로그인 폼</a>
							<!-- 화면 중앙에 gtsystem 대문자로 표기됨 -->
						</h1>

						<h2 class="hs-line-3 mb-0">Since 2016</h2>
					</div>
				</div>

			</div>
		</section>

		<nav class="main-nav dark transparent stick-fixed" id="wrap">
			<div class="full-wrapper relative clearfix">
				<div class="inner-nav desktop-nav">
					<!-- 네비 -->
					<ul class="clearlist local-scroll">
						<li><a href="#">Company</a> <!--class="active"--> <!-- 네비메뉴모음 -->
							<ul id="sub_1">
								<div>
									<li><a href="map.jsp">위치</a></li>
									<li><a href="cooperation.jsp">협력사</a></li>
									<li><a href="history.jsp">연혁</a></li>
									<li><a href="organization.jsp">조직도</a></li>
									<li><a href="IntroCompany.jsp">CEO 인사말</a></li>
									<li><a href="info.jsp">회사소개</a></li>
								</div>
							</ul></li>
						<li><a href="#">Business</a>
							<ul id="sub_2">
								<div>
									<li><a href="providing.jsp">Solution Providing</a></li>
									<li><a href="solution.jsp">IoT Service & Solution</a></li>
									<li><a href="smart_car.jsp">Smart Car</a></li>
									<li><a href="smart_mobile.jsp">Smart Mobile</a></li>
								</div>
							</ul></li>
						<li><a href="#">Portfolio</a>
							<ul id="sub_3">
								<div>
									<li><a href="feature.jsp">Feature Phone</a></li>
									<li><a href="smart.jsp">Smart Phone</a></li>
									<li><a href="avn.jsp">AVN System</a></li>
									<li><a href="and.jsp">Android Application</a></li>
									<li><a href="dtg.jsp">DTG ETAS 전송어플</a></li>
									<li><a href="ips.jsp">IPS 실내측위 시스템 솔루션</a></li>
								</div>
							</ul></li>
						<li><a href="#">Recruit</a>
							<ul id="sub_4">
								<div>
									<li><a href="recruit.jsp">Recruit</a></li>
								</div>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>


		<section class="page-section" align="center"">
			<div class="full-wrapper relative clearfix">

				<div align="center">
					<div>
						<div>
							<h2>로그인</h2>

							<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
								<TR>
									<TD><hr size='1' noshade></TD>
								</TR>
							</TABLE>
							<FORM Name='Member_Input' Method='post' Action='loginPro.jsp'>

								<TABLE border='0' cellSpacing=0 cellPadding=5 align=center>
									<TR>
										<TD><font size='2'>아 이 디</font></TD>
										<TD><input type='text' maxLength='20' size='15' name='id'></TD>
									</TR>
									<TR>
										<TD><font size='2'>비 밀 번 호</font></TD>
										<TD><input type='password' maxLength='20' size='15'
											name='password'></TD>
									</TR>
								</TABLE>

								<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
									<TR>
										<TD><hr size='1' noshade></TD>
									</TR>
								</TABLE>

								<TABLE align="center">
									<TR>
										<TD colspan='2' align='center'><input type='submit'
											value='로그인'></TD>
									</TR>
								</TABLE>
							</FORM>
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