
<!-- Smart Car -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.lang.*" %>
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
							

<%
    String strSql;
    Connection conn = null; 
    Statement stmt = null;
    ResultSet rs = null;
    int intResult;

    // login을 하지 않은 사용자가 게시물을 읽을 수 없기 때문에
    // 글내용 보기를 시도하는 순간 강제로 login 창을 표시해 줌 
    String strLoginok = (String)session.getAttribute("loginok");

    if (strLoginok == null || !strLoginok.equals("yes")) {
       response.sendRedirect("loginForm.jsp");
    }

    String strId = request.getParameter("id");

    try { 
       Class.forName("com.mysql.jdbc.Driver"); 
       String strConnect = "jdbc:mysql://localhost:3306/forumdb"; 
       conn = DriverManager.getConnection(strConnect,"root", "1234"); 
       //out.println(strConnect + "<br>");

       if (conn == null) {
          out.println("data source에 연결이 되지 않음 : " + strConnect);
       }

       stmt = conn.createStatement();

    // 읽은 횟수 하나 증가
       strSql = "update board set hit = hit + 1 where id = " + strId; 
       intResult = stmt.executeUpdate(strSql);
		
    // 게시물 내용 읽어오기 
       stmt = conn.createStatement();
       strSql = "select * from board "; 
       strSql = strSql + " where id = " + strId;
       //out.println(strSql + "<br>");
       rs = stmt.executeQuery(strSql); 
       if (rs != null && rs.next()) {
          String strBody2;
          String strBody = rs.getString("body");
//          strBody2 = Pattern.compile("\r\n").matcher(strBody).replaceAll("<br>");
          strBody2 = strBody.replaceAll("\r\n", "<br>");               //게시글이 내용이길면 줄바꿈으로 바꿔줌.
%>




<table border=1 cellspacing=1 cellpadding=1>

    <tr><td class=t1 width=80> 글번호 </td>
        <td width=150><%=rs.getInt("id")%></td>
        <td class=t1 width=80> 글쓴이 </td>
        <td width=150> <%=rs.getString("userid")%></td></tr>
	
    <tr><td class=t1 width=80> 글쓴날 </td>
        <td width=200><%=rs.getTimestamp("regdate")%></td>
        <td class=t1 width=80> 조회수 </td>
        <td width=150><%=rs.getInt("hit")%></td></tr>
	    
    <tr><td class=t1 width=80> 제 목 </td>
        <td colspan=3><%=rs.getString("title")%></td></tr>
		
    <tr><td class=t1 colspan=4 align=center> 내 용 </td><tr>
	
    <tr><td class=content valign=top width=460 colspan=4><%=strBody2%></td></tr>

</table>

<p> 
[<A href="smart_car.jsp">게시판으로 돌아가기</A>]
[<A href="update.jsp?id=<%=strId%>&mode=show">글수정</A>]
[<A href="delete.jsp?id=<%=strId%>">글삭제</A>]

<%
       } // end of if
     } catch (Exception e) {

       out.println(e.getMessage());

    } finally { 

       //out.println("finally <br>");
       if (conn != null)  
          conn.close();

    }
%>





 </div>

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
