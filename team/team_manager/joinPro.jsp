<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>



<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" + email2;
        String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");            
        
	Timestamp register = new Timestamp(System.currentTimeMillis());

	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcUrl = "jdbc:mysql://localhost:3306/forumdb";
	String dbId = "root";
	String dbPass = "1234";



	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);


		String sql = "insert into member values (?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, email1);
                pstmt.setString(5, email2);
		pstmt.setString(6, gender);
		pstmt.setString(7, hobby);
		pstmt.setTimestamp(8, register);
                pstmt.executeUpdate();


/*
       stmt = conn.createStatement();

       strSql = "insert into member (id, password, name, email1,email2,gender,hobby,regdate) values ("; 
       strSql = strSql + "'" + strId + "',";
       strSql = strSql + "'" + strPassword + "',"; 
       strSql = strSql + "'" + strName + "',";
       strSql = strSql + "'" + strEmail1 + "',";
       strSql = strSql + "'" + strEmail2 + "',";
       strSql = strSql + "'" + strGender + "',";
       strSql = strSql + "'" + strHobby + "',";
       strSql = strSql + "'" + strRegdate + "',";)";
       out.println(strSql + "<br>");
*/

%>
		<script>
	alert("회원가입되었습니다.");
	location.href="loginForm.jsp";
</script>


<!DOCTYPE html>
<head>
<title>회원가입 결과</title>
</head>
<body>

</body>
</html>
