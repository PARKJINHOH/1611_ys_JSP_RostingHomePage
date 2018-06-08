
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
							<h1 class="hs-line-15 font-alt mb-50 mb-xs-30">자유게시판</h1>
							<!%

   //pagelist.jsp에서만 영향이있음

   int intPageSize = 6;  // 한페이지(각각의 번호붙은 페이지)의 테이블에 몇개의 행을 만들수있는지 표시할까 정의함(사이즈를 정함.)
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
       strSql = "select * from board order by id desc ";
       //out.println(strSql + "<br>");
       rs = stmt.executeQuery(strSql);                     // rs : 조건에맞는 행들의 집합임
       if (rs != null) {
%>

<table border=1 cellSpacing=2>

    <tr bgcolor=#ffd891>
        <th width=50 height=20>No</th>
        <th width=400>제&nbsp;&nbsp;목</th>
        <th width=150>글쓴이</th>
        <th width=200>글쓴날</th>
        <th width=70>조회수</th>
    </tr>
<%	
         while (rs.next()) {
%>
            <tr class=list bordercolor=#f3f3f3
               onmouseover="style.background = '#b7b7e9'"
               onmouseout="style.background = '#f3f3f3'">

               <td width=30 align=right> <%= rs.getInt("id")%>&nbsp;</td>

               <td width=340>
                   <A href="show.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title")%></a>
               </td>
    
               <td width=120 align=center><%=rs.getString("userid")%></td>
               <td width=120 align=center><%=rs.getTimestamp("regdate")%></td>
               <td width=40 align=center><%=rs.getInt("hit")%></td>

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
<div><br><br> [<A align=right href="writeform.jsp">게시판에 글쓰기</A>] </div>

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
