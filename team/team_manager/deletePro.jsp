<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>


<% request.setCharacterEncoding("utf-8");%>

<%
  String id= request.getParameter("id");
  String password= request.getParameter("password");

  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;

  try{
	String jdbcUrl="jdbc:mysql://localhost:3306/forumdb";
    String dbId="root";
    String dbPass="1234";
	 
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	
	String sql= "select id, password from member where id= ?";
	pstmt=conn.prepareStatement(sql);
        pstmt.setString(1,id);
	rs=pstmt.executeQuery();
    
	if(rs.next()){ 
//out.println("ID="+id);
	  String rPassword=rs.getString("password");
//out.println("ID="+id+"pass="+rPassword+"pass2="+password);
         if(password.equals(rPassword)){
//out.println("ID="+id);
	    sql= "delete from member where id= ? ";
	    pstmt=conn.prepareStatement(sql);
	    pstmt.setString(1,id);
	    pstmt.executeUpdate();
%>
<html>
<head>
<title>레코드 삭제</title>
</head>
<body>
  <script>
	alert("회원탈퇴되었습니다.");
	location.href="loginForm.jsp";
</script>
</body>
</html>
<%
	  }else
		out.println("패스워드가 틀렸습니다.");
	}else
		 out.println("아이디가 틀렸습니다.");

  }catch(Exception e){ 
	 e.printStackTrace();

  }finally{
	 if(rs != null) 
		 try{rs.close();}catch(SQLException sqle){}
	 if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	 if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>