
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
							<h1 class="hs-line-15 font-alt mb-50 mb-xs-30">게시판수정</h1>
							

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
       response.sendRedirect("../loginform.jsp");
    }

    String strId = request.getParameter("id");
    String strMode = request.getParameter("mode");
    String strTitle;
    String strBody;
    String strBody2;

    try { 
        Class.forName("com.mysql.jdbc.Driver"); 
        String strConnect = "jdbc:mysql://localhost:3306/forumdb"; 
        conn = DriverManager.getConnection(strConnect,"root", "1234"); 
        //out.println(strConnect + "<br>");
        if (conn == null) {
           out.println("data source에 연결이 되지 않음 : " + strConnect);
        }
        if (strMode.equals("update"))
        {
           // 수정된 내용 DB에 쓰기
           stmt = conn.createStatement();
           strTitle = request.getParameter("title");
           strBody = request.getParameter("body");

           strSql = "update forum set ";
           strSql = strSql + "title = '" + strTitle + "',";
           strSql = strSql + "body = '" + strBody + "',";
           strSql = strSql + "hit =  0 ";
           strSql = strSql + "where id = " + strId;

           intResult = stmt.executeUpdate(strSql);

           // 게시판으로 돌아가기
           response.sendRedirect("solution.jsp?page=" + request.getParameter("page"));

        }
        else
        {       
           // 게시물 내용 읽어오기 
           stmt = conn.createStatement();
           strSql = "select * from forum "; 
           strSql = strSql + " where id = " + strId;
           //out.println(strSql + "<br>");
           rs = stmt.executeQuery(strSql); 
           if (rs != null && rs.next()) {
              strTitle = rs.getString("title");
              strBody = rs.getString("body");
              strBody2 = strBody.replaceAll("\r\n", "<br>");

%>

              <FORM action="update.jsp?id=<%=strId%>&mode=update&page=<%=request.getParameter("page")%>" method="post">
                <table border=0 cellspacing=4 cellpadding=2>
                  <tr>	
                     <td align=left>글쓴이</td>
                     <td><%= session.getAttribute("userid") %></td>
                  </tr>
                  <tr>	
                     <td align=left>글제목</td>
                     <td><input name="title" type="text" size="60" value=<%=strTitle %>></td>
                  </tr>
                  <tr>	
                     <td align=left>글내용</td>
                     <td><textarea name="body" rows=12 cols=60><%= strBody %></textarea></td>
                  </tr>
                  <tr>
                     <td align=center colspan=2>
                        <input type="submit" value="글 올리기">&nbsp;&nbsp;
                        <input type="reset" value="다시 쓰기">
                     </td>
                  </tr>
                </table>
              </FORM>

<%
           }
       } // end of if
     } catch (Exception e) {

       out.println(e.getMessage());

    } finally { 

       //out.println("finally <br>");
       if (conn != null)  
          conn.close();

    }
%>

[<a href="solution.jsp?page=<%=request.getParameter("page")%>">게시판으로 돌아가기</A>]


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
