<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 회원가입 -->

<title>GTSystem㈜</title>

<!-- CSS선언부 인클루드 -->
<%@ include file="includeJSPF/cssInclude.jspf"%>


</head>
<body>
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

						<h2 class="hs-line-3 mb-0">Since 2009-March &bull; Seocho-gu
							&bull; GT-System</h2>
					</div>
				</div>

			</div>
		</section>

		<nav class="main-nav dark transparent stick-fixed" id="wrap">
			<div class="inner-nav desktop-nav">

			<ul class="clearlist local-scroll">

				<li><a href="#">커피이야기</a>
					<ul id="sub_0">
						<div>
							<!-- 하위메뉴 마우스 커서 갖다댈시 확장 -->
							<li><a href="1st_been.jsp">원두종류</a></li>
							<li><a href="1st_country.jsp">나라별원두</a></li>
						</div>
					</ul></li>

				<li><a href="#">회사 정보</a>
					<ul id="sub_1">
						<div>
							<!-- 하위메뉴 마우스 커서 갖다댈시 확장 -->
							<li><a href="map.jsp">위치</a></li>
							<li><a href="info.jsp">회사소개</a></li>
						</div>
					</ul></li>

				<li><a href="#">커뮤니티</a>
					<ul id="sub_2">
						<div>

							<li><a href="solution.jsp">질문게시판</a></li>
							<li><a href="smart_car.jsp">자유게시판</a></li>
						</div>
					</ul></li>

				<li><a href="#">Shop</a>
					<ul id="sub_3">
						<div>

							<li><a href="feature.jsp">상품목록보기</a></li>
						</div>
					</ul></li>
				<li><a href="#">     </a>
					<ul id="sub_4">

					</ul></li>

			</ul>
		</div>
			</div>
		</nav>


		<section class="page-section" align="center"">
			<div class="full-wrapper relative clearfix">

				<div>
					<div>
						<div>
							<h2 align="center">회원가입</h2>

							<TABLE align="center" border='0' width='600' cellpadding='0' cellspacing='0'>
								<TR>
									<TD><hr size='1' noshade></TD>
								</TR>
							</TABLE>

							<FORM Name='Member_Input' Method='post' Action='joinPro.jsp'>

								<TABLE border='0' cellSpacing=0 cellPadding=5 align=center>
									<TR>
										<TD><font size='2'>아 이 디</font></TD>
										<TD><input type='text' maxLength='20' size='15' name='id'</TD>
                                                                                <TD><input type='button' value='ID중복확인' onclick="return checkID();"><TD>
									</TR>
									<TR>
										<TD><font size='2'>비 밀 번 호</font></TD>
										<TD><input type='password' maxLength='20' size='15'
											name='password'></TD>
									</TR>
									<TR>
										<TD><font size='2'>비 밀 번 호 확 인</font></TD>
										<TD><input type='password' maxLength='20' size='15'
											name='password1'></TD>
									</TR>
									<TR>
										<TD><font size='2'>이 름</font></TD>
										<TD><input type='text' maxLength='10' size='15'
											name='name'></TD>
									</TR>

									<TR>
										<TD><font size='2'>E - M a i l</font></TD>
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

                                                                        <TR>
										<TD><font size='2'>성 별</font>&nbsp;&nbsp;
										<TD>
                                                                                <input type="radio" name="gender" value="male">남&nbsp;&nbsp;&nbsp;
										<input type="radio" name="gender" value="female">여</br></TD>
                                                                        </TR>

                                                                        <TR>
										<TD><font size='2'>좋아하는 커피 종류</font>&nbsp;&nbsp;
										<TD><input type="checkbox" name="hobby" value="h1">아메리카노&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="hobby" value="h2">바닐라라떼&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="hobby" value="h3">카페모카&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="hobby" value="h4">헤이즐넛&nbsp;&nbsp;&nbsp;
										<input type="checkbox" name="hobby" value="h5">에스프레소<br></TD>
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
											value='회원가입' onclick="return sendForm()"> <input
											type="reset" value="다시입력"></TD>
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

	<script>
		function dd() {$("#ee").val($('#emailSelect').val());}
		$("#emailSelect").change(dd);
	</script>
	

<SCRIPT>
   function checkID()
    {
         if (Member_Input.id.value == "")
         {
            alert("가입할 ID를 입력한 후 다시 확인하세요.");
         }
         else
         {
            window.open("idcheck.jsp?id=" + Member_Input.id.value, "ID중복확인", "left=600, top=200, width=500, height=400, scrollbar=yes");
         } 
    }

    function ID_Check2()
    {
         window.opener.document.all.gaibform.id.value = checkform.id.value; 
         window.close();  
    }

    function 필드값채우기()
    {
         checkform.id.value = window.opener.document.all.gaibform.id.value; 
    }


   function sendForm()
   {
      if (Member_Input.id.value.length < 3 || Member_Input.id.value.length > 10)
      {
          alert("ID는 3글자이상 10글자 이하여야 합니다.");
          return false;
      } 


      else if (Member_Input.password.value != Member_Input.password1.value)
      {
          alert("비밀번호를 다시 확인하세요.");
          return false;
      }

      if (Member_Input.password.value.length < 1)
      {
          alert("비밀번호를 입력하세요.");
          return false;
      }

      else if (Member_Input.name.value.length < 1 )
      {
          alert("이름을 입력하세요.");
          return false;
      }

      else if (Member_Input.email1.value.length < 1 )
      {
          alert("이메일을 입력하세요.");
          return false;
      }

      else if (Member_Input.email2.value.length < 1 )
      {
          alert("이메일 뒷부분을 입력하세요.");
          return false;
      }

      else
          return true;
      }

</SCRIPT>
</body>
</html>