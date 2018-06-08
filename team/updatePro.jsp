<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.lang.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String new_password = request.getParameter("new_password");
	String name = request.getParameter("name");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String email = email1 + "@" +email2;
      
        Statement stmt = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/forumdb";
		String dbId = "root";
		String dbPass = "1234";


		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

                stmt = conn.createStatement();
		String sql = "select id, password from member where id= '" + id + "'";
                rs = stmt.executeQuery(sql); 

		//pstmt = conn.prepareStatement(sql);
		//pstmt.setString(1, id);
		//rs = pstmt.executeQuery();


		if (rs.next()) {
			//String rId = rs.getString("id");
			String rPassword = rs.getString("password");
			if (password.equals(rPassword)) {
				sql = "update member set name = ? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, id);
				pstmt.executeUpdate();

				sql = "update member set password = ? where id =  ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, new_password);
				pstmt.setString(2, id);
				pstmt.executeUpdate();

				sql = "update member set email1 = ?, email2 = ? where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, email1);
				pstmt.setString(2, email2);
				pstmt.setString(3, id);
				pstmt.executeUpdate();
                                out.println("정보가 정상적으로 수정되었습니다.");
                                out.println("<a href='mainsample2.jsp'>메인페이지</a>");
                	} else {
                        
                           out.println("<script>alert('기존 패스워드가 틀렸습니다.');</script>");
                        }
               } else {
                   out.println("<script>alert('아이디가 틀렸습니다.');</script>");
               }
        } catch (Exception e) {
		e.printStackTrace();
	} finally {

	}

%>