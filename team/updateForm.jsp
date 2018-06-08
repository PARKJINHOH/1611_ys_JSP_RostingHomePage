<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.lang.*" %>
<% request.setCharacterEncoding("utf-8");%>
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


		<section class="page-section">
			<div class="full-wrapper relative clearfix">

				<div>
					<div>
						<div>
                                                        

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

    String strId = (String)session.getAttribute("id");

    try { 
        Class.forName("com.mysql.jdbc.Driver"); 
        String strConnect = "jdbc:mysql://localhost:3306/forumdb"; 
        conn = DriverManager.getConnection(strConnect,"root", "1234"); 
        //out.println(strConnect + "<br>");
        if (conn == null) {
           out.println("data source에 연결이 되지 않음 : " + strConnect);
        }
  

        // 게시물 내용 읽어오기 
        stmt = conn.createStatement();
        strSql = "select * from member "; 
        strSql = strSql + " where id = '" + strId + "'";
        //out.println(strSql + "<br>");
        rs = stmt.executeQuery(strSql); 
        if (rs != null && rs.next()) {
           String strName = rs.getString("name");
           String strEmail1 = rs.getString("email1");
           String strHobby = rs.getString("hobby");
           String strGender = rs.getString("gender");
%>


							<h2 align="center">회원정보 수정하기</h2>
							<TABLE align="center" border='0' width='600' cellpadding='0' cellspacing='0'>
								<TR>
									<TD><hr size='1' noshade></TD>
								</TR>
							</TABLE>
							<FORM Name='Member_Input' Method='post' Action='updatePro.jsp'>

								<TABLE border='0' cellSpacing=0 cellPadding=5 align=center>
									<TR>
										<TD><font size='2'>아 이 디</font></TD>
										<TD><input type='text' maxLength='20' size='15' name='id' readonly value='<%= strId %>'></TD>
									</TR>
									<TR>
										<TD><font size='2'>기 존 비 밀 번 호</font></TD>
										<TD><input type='password' maxLength='20' size='15'
											name='password'></TD>
									</TR>
									<TR>
										<TD><font size='2'>변 경 할 비 밀 번 호</font></TD>
										<TD><input type='password' maxLength='20' size='15'
											name='new_password'></TD>
									</TR>
									<TR>
										<TD><font size='2'>변 경 할 이 름</font></TD>
										<TD><input type='text' maxLength='10' size='15'
											name='name' value='<%= strName %>'>></TD>
									</TR>

									<TR>
										<TD><font size='2'>변 경 할 E - M a i l</font></TD>
										<TD><input type="text" name="email1" id="email1"
											size="10"> @ <input type="text" name="email2"
											size="8" id="ee"> <select name="emailSelect"
											id="emailSelect" onChange="checkemailaddy();">
												<option value="" selected>직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="hanmail.com">hanmail.com</option>
												<option value="yahoo.co.kr">yahoo.co.kr</option>
												<option value="nate.com">nate.com</option>
												<option value="google.co.kr">google.co.kr</option>
										</select><br></TD>
									</TR>
								</TABLE>

								<TABLE align="center" border='0' width='600' cellpadding='0' cellspacing='0'>
									<TR>
										<TD><hr size='1' noshade></TD>
									</TR>
								</TABLE>

								<TABLE align="center">
									<TR>
										<TD colspan='2' align='center'><input type='submit'
											value='수정하기'  onclick="return sendForm()"> <input
											type="reset" value="다시입력"></TD>
									</TR>
								</TABLE>
							</FORM>
<%
      }
      else
      {
             out.println("정보가 없어요.....");
             // .....
      }        
    } catch (Exception e) {

       out.println(e.getMessage());

    } finally { 

       //out.println("finally <br>");
       if (conn != null)  
          conn.close();

    }
%>

     <script src="http://code.jquery.com/jquery-1.5.js"></script>
     <script>
        function dd() {
	    $("#ee").val($('#emailSelect').val());
        }
        $("#emailSelect").change(dd);
     </script>
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