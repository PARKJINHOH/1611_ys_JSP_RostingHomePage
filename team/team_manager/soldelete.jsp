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

    // login을 하지 않은 사용자가 게시물을 읽을 수 없기 때문에
    // 글내용 보기를 시도하는 순간 강제로 login 창을 표시해 줌 
    String strLoginok = (String)session.getAttribute("loginok");

    if (strLoginok == null || !strLoginok.equals("yes")) {
       response.sendRedirect("../loginform2.jsp");
    }

    String strId = request.getParameter("id");

    try { 
       Class.forName("com.mysql.jdbc.Driver"); 
       String strConnect = "jdbc:mysql://localhost:3306/forumdb"; 
       conn = DriverManager.getConnection(strConnect,"root", "1234"); 
       //out.println(strConnect + "<br>");

       if (conn == null) {
          out.println("data source에 연결이 되지 않음 : " + strConnect);
       }

       stmt = conn.createStatement();

    // 삭제 문장 작성
       strSql = "delete from qaboard where id = " + strId; 
       intResult = stmt.executeUpdate(strSql);

%>

게시 번호 <%=strId%> 번 글이 삭제되었습니다. <br>
[<a href="solution.jsp">게시판으로 돌아가기</A>]
<hr>

<%
     } catch (Exception e) {

       out.println(e.getMessage());

    } finally { 

       //out.println("finally <br>");
       if (conn != null)  
          conn.close();

    }
%>

</body>
</html>
