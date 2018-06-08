<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

ID 중복 확인 창입니다.<br>
<br>
<br><br><br>
점검중인 ID는 

<%
    String strId, strSql;
  
    strId = (String)request.getParameter("id");   
    out.println(strId + "입니다");
    
    Connection conn = null; 
    Statement stmt = null;
    ResultSet rs = null;
    String strDbPass;

    try { 
       Class.forName("com.mysql.jdbc.Driver"); 
       String strConnect = "jdbc:mysql://localhost:3306/forumdb"; 
       conn = DriverManager.getConnection(strConnect,"root", "1234"); 

       //out.println(strConnect + "<br>");

       if (conn == null) {
          out.println("data source에 연결이 되지 않음 : " + strConnect);
       }

       stmt = conn.createStatement();
       strSql = "select * from member "; 
       strSql = strSql + " where id = '" + strId + "' ";
       //out.println(strSql + "<br>");
       rs = stmt.executeQuery(strSql); 
       if (rs != null && rs.next()) {
          out.println("<script>");
          out.println("alert('ID가 이미 존재합니다.');");
          //out.println("document.write('ID가 이미 존재합니다.');");
          //out.println ("document.write('<a href=loginForm.jsp>로그인하기</a>');");
          out.println("window.close();");
          out.println("</script>");
       }
       else
       {
          out.println("<script>");
          out.println("alert('사용가능한 ID입니다.');");
          out.println("window.close();");
          out.println("</script>");
       }
     } catch (Exception e) {

       out.println(e.getMessage());

    } finally { 

       //out.println("finally <br>");
       if (conn != null)  
          conn.close();

    }
%>

