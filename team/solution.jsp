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
						<li><a href="smart_car.jsp">자유게시판</a></li>
						</br>
						<li><a href="solution.jsp">질문게시판</a></li>

					</ul>
				</div>

				<div class="right" id="fixed" align="center">
					<div class="home-text">
						<div
							style="width: 75%; height: 100%; float: left; margin-right: 300px">
							<h1 class="hs-line-15 font-alt mb-50 mb-xs-30">질문게시판</h1>
							<!%



<%!
    int intPageSize = 6;
    int intCurPage;
    int intLastPage;
    int intNoRows;
    int intPageListSize;
%>

<%
    String strSql;
    Connection conn = null; 
    Statement stmt = null;
    ResultSet rs = null;
    String strPage = request.getParameter("page");
    if (strPage == null)
       intCurPage = 1;
    else {
       intCurPage = Integer.parseInt(strPage);
       if (intCurPage < 1)
          intCurPage = 1;
    }

    try { 
       Class.forName("com.mysql.jdbc.Driver"); 
       String strConnect = "jdbc:mysql://localhost:3306/forumdb";
       conn = DriverManager.getConnection(strConnect,"root", "1234"); 
       //out.println(strConnect + "<br>");

       if (conn == null) {
          out.println("data source에 연결이 되지 않음 : " + strConnect);
       }

       stmt = conn.createStatement();
       strSql = "select * from forum order by pos desc ";
       out.println(strSql + "<br>");
       rs = stmt.executeQuery(strSql); 
       if (rs != null && rs.next()) {
          rs.last();
          intNoRows = rs.getRow();
          intLastPage = (intNoRows + intPageSize - 1) / intPageSize;
          rs.absolute((intCurPage - 1) * intPageSize);
%>

<table border=1 cellSpacing=2>

    <tr bgcolor=#ffd891>
        <th width=50 height=20>No</th>
        <th width=400>제&nbsp;&nbsp;목</th>
        <th width=150>글쓴이</th>
        <th width=200>글쓴날</th>
        <th width=70>조회수</th>
        <th width=80>전글번호</th>
        <th width=80>들여쓰기</th>
        <th width=220>자동위치</th>
    </tr>
<%	
         int intCnt = 0;
         while (rs.next() && intCnt < intPageSize) {
%>
            <tr class=list bordercolor=#f3f3f3
               onmouseover="style.background = '#b7b7e9'" 
               onmouseout="style.background = '#f3f3f3'">

               <td width=30 align=right> <%= rs.getInt("id")%>&nbsp;</td>

               <td width=340>
<%
      if (rs.getInt("lev") > 0)
      {
         for (int i = 0; i < rs.getInt("lev"); i++)
             out.println("&nbsp;&nbsp;&nbsp;");
         out.println("Re: ");
      } 
%>
                <font size=2>
                   <A href="solshow.jsp?id=<%=rs.getInt("id")%>&page=<%=intCurPage%>"><%=rs.getString("title")%></a>
                </font>
               </td>
    
               <td width=120 align=center><%=rs.getString("userid")%></td>
               <td width=120 align=center><%=rs.getTimestamp("regdate")%></td>
               <td width=40 align=center><%=rs.getInt("hit")%></td>
               <td width=40 align=left><%=rs.getInt("refid")%></td>
               <td width=40 align=left><%=rs.getInt("lev")%></td>
               <td width=340 align=left><%=rs.getString("pos")%></td>

            </tr>
<%
            intCnt = intCnt + 1;
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

<%@ include file="pagelist.jsp"%>

[<A href="solwriteform.jsp?page=1">게시판에 글쓰기</A>]&nbsp;&nbsp;
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
