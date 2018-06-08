
<!-- Smart Car -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

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

		<section class="page-section" align="center">
			<div class="full-wrapper relative clearfix">
				<div class="left" style="width: 15%; height: 100% px; float: left;">
					<img src="images/picture/logo.png" width="220" ;/></br> </br>
					<ul>
						<li><a href="smart_mobile.jsp">공지사항</a></li>
						</br>
						<li><a href="smart_car.jsp">자유게시판</a></li>
						</br>
						<li><a href="solution.jsp">질문게시판</a></li>
						</br>
						<li><a href="providing.jsp">이벤트게시판</a></li>
					</ul>
				</div>

				<div class="right" id="fixed" align="center">
					<div class="home-text">
						<div
							style="width: 75%; height: 100%; float: left; margin-right: 300px">
							<h1 class="hs-line-15 font-alt mb-50 mb-xs-30">게시판글쓰기</h1>
							<%
    // login을 하지 않은 사용자가 게시물을 읽을 수 없기 때문에
    // 글내용 보기를 시도하는 순간 강제로 login 창을 표시해 줌 
    String strLoginok = (String)session.getAttribute("loginok");

    if (strLoginok == null || !strLoginok.equals("yes")) {
       response.sendRedirect("loginForm.jsp");
    }
%>

<FORM action="solwrite.jsp" method="post">
    <table border=0 cellspacing=4 cellpadding=2>
    <tr>	
        <td align=right>글쓴이</td>
        <td><%= session.getAttribute("id") %></td></tr>
    <tr>	
        <td align=right>글제목</td>
        <td><input name="title" type="text" size="60"></td></tr>
    <tr>	
        <td align=right>글내용</td>
        <td><textarea name="body" rows=12 cols=60></textarea></td></tr>
    <tr>
        <td align=center colspan=2>
        <input type="submit" value="글 올리기">&nbsp;&nbsp;
        <input type="reset" value="다시 쓰기">&nbsp;&nbsp;
	<input type="button" value="게시판돌아가기" onclick="location.href='solution.jsp'">
        </td></tr>
    </table>
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
