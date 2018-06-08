<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>


<% request.setCharacterEncoding("utf-8");%>

<%
   String id = request.getParameter("id");
   String password= request.getParameter("password");
   
   
   Connection conn=null;
   PreparedStatement pstmt=null;
   ResultSet rs = null;
   String str="";
   try {

                Class.forName("com.mysql.jdbc.Driver");
		String jdbcUrl = "jdbc:mysql://localhost:3306/forumdb"; 
		String dbId = "root";
		String dbPass = "1234";

		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql = "select id, password, name from member where id= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			String rId = rs.getString("id");
			String rPassword = rs.getString("password");
			String name = rs.getString("name");
			
			if (id.equals(rId) && password.equals(rPassword)) {
				str= name+"님 로그인되었습니다.";                               
				out.println(str); %><br> 
				<a href="mainsample2.jsp">메인페이지</a>
				<%
				session.setAttribute("name", name);
                                session.setAttribute("loginok", "yes");
                                session.setAttribute("id", id);

			}
			else {
				str = "아이디와 비밀번호를 다시한번 확인해주세요.";
				out.println(str);
			}
			
		}else {
			str = "아이디와 비밀번호를 다시한번 확인해주세요.";
			out.println(str);
		}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>



<body>
	<script>
	alert("로그인 되었습니다.");
	location.href="mainsample2.jsp";
        </script>
</body>


<% 
   }catch(Exception e){ 
 		e.printStackTrace();
 		str="로그인 실패하였습니다.";
 	}finally{
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}
 %>

</html>