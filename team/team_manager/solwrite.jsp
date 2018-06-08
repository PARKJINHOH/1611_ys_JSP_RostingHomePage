<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.lang.*" %>
<% request.setCharacterEncoding("utf-8");%>

<%
    String strSql;
    Connection conn = null; 
    Statement stmt = null;
    ResultSet rs = null;
    int intResult;
    Integer intId;

    // login을 하지 않은 사용자가 게시물을 읽을 수 없기 때문에
    // 글내용 보기를 시도하는 순간 강제로 login 창을 표시해 줌 
    String strLoginok = (String)session.getAttribute("loginok");

    if (strLoginok == null || !strLoginok.equals("yes")) {
       response.sendRedirect("../loginform2.jsp");
    }

    String strTitle = request.getParameter("title");
    String strBody = request.getParameter("body");
    Timestamp dtNow = new Timestamp(System.currentTimeMillis());

    try { 
       Class.forName("com.mysql.jdbc.Driver"); 
       String strConnect = "jdbc:mysql://localhost:3306/forumdb"; 
       conn = DriverManager.getConnection(strConnect,"root", "1234"); 
       //out.println(strConnect + "<br>");

       if (conn == null) {
          out.println("data source에 연결이 되지 않음 : " + strConnect);
       }

       stmt = conn.createStatement();

    // 게시물 번호 읽어오기 
       stmt = conn.createStatement();
       strSql = "select max(id) seqno from qaboard ";
       //out.println(strSql + "<br>");
       rs = stmt.executeQuery(strSql); 
       if (rs != null && rs.next()) {
          intId = (Integer)rs.getInt("seqno");
          intId = intId + 1;
       } else {
          intId = 1;
       }

       strSql = "insert into qaboard (id, userid, title, body, regdate, hit) values (";
       strSql = strSql + intId.toString() + ",";	
       strSql = strSql + "'" + session.getAttribute("id") + "',";	
       strSql = strSql + "'" + strTitle + "',";	
       strSql = strSql + "'" + strBody + "',"; 
       strSql = strSql + "'" + dtNow + "',";
       strSql = strSql + "0)";

       intResult = stmt.executeUpdate(strSql);           //insert한 내용(value값을) 결과를 보여줌.

       // 게시판으로 돌아가기
       response.sendRedirect("solution.jsp");

     } catch (Exception e) {

       out.println(e.getMessage() + "err <br>");
       if (e.getMessage().indexOf("Duplicate") >= 0)
       {
           out.println("<script>");
           out.println("alert('글 등록하는 중 예기치 않은 오류가 발생하였습니다');");
           out.println("history.back();");
           out.println("</script>");
       } 

    } finally { 
       //out.println("finally <br>");
       if (conn != null)  
          conn.close();
    }
%>
