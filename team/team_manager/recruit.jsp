
<!-- IoT Service & recruitution -->
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
						<li><a href="recruit.jsp">회원목록</a></li>
						
					</ul>
				</div>



				<div class="right" id="fixed" align="center">
					<div class="home-text">
						<div
							style="width: 75%; height: 100%; float: left; margin-right: 300px">
							<h1 class="hs-line-15 font-alt mb-50 mb-xs-30">회원목록</h1>
							<!%

   //pagelist.jsp에서만 영향이있음

   int intPageSize = 10;  // 한페이지(각각의 번호붙은 페이지)의 테이블에 몇개의 행을 만들수있는지 표시할까 정의함(사이즈를 정함.)
   int intCurPage;       //현재 페이지 번호
   int intLastPage;      // 마지막 페이지 번호
   int intNoRows;         // 게시물 수
   int intPageListSize;     // 페이지 목록 크기
%>


<%
    String strSql;
    Connection conn = null; 
    Statement stmt = null;
    ResultSet rs = null;

    try { 
       Class.forName("com.mysql.jdbc.Driver"); 
       String strConnect = "jdbc:mysql://localhost:3306/forumdb"; 
       conn = DriverManager.getConnection(strConnect,"root", "1234"); 

       //out.println(strConnect + "<br>");

       if (conn == null) {
          out.println("data source에 연결이 되지 않음 : " + strConnect);
       }

       stmt = conn.createStatement();
       strSql = "select * from member order by id asc ";
       //out.println(strSql + "<br>");
       rs = stmt.executeQuery(strSql);                     // rs : 조건에맞는 행들의 집합임
       if (rs != null) {
%>

<table border=1 cellSpacing=2>

    <tr bgcolor=#ffd891>

        <td width=100 align=center>id</td>
        <td width=100 align=center>password</td>
        <td width=100 align=center>name</td>
        <td width=100 align=center>email1</td>
        <td width=100 align=center>email2</td>
        <td width=100 align=center>gender</td>
        <td width=100 align=center>hobby</td>
        <td width=200 align=center>register</td>
    </tr>
<%	
         while (rs.next()) {
%>
            <tr class=list bordercolor=#f3f3f3
               onmouseover="style.background = '#b7b7e9'"
               onmouseout="style.background = '#f3f3f3'">


               <td width=100 align=center><%=rs.getString("id")%></td>    
               <td width=100 align=center><%=rs.getString("password")%></td>
               <td width=100 align=center><%=rs.getString("name")%></td>
               <td width=100 align=center><%=rs.getString("email1")%></td>
               <td width=100 align=center><%=rs.getString("email2")%></td>
               <td width=100 align=center><%=rs.getString("gender")%></td>
               <td width=100 align=center><%=rs.getString("hobby")%></td>
               <td width=200 align=center><%=rs.getTimestamp("register")%></td>

            </tr>
<%
         } // end of while
       } // end of if
     } catch (Exception e) {

       out.println(e.getMessage());

    } finally { 

       //out.println("finally <br>");
       if (conn != null)  
          conn.close();

    }
%>

</table> 
<div><br><br> [<A align=right href="recruitdeleteForm.jsp">회원탈퇴</A>] </div>

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
