<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>


<!%

   //pagelist.jsp에서만 영향이있음

   int intPageSize = 6;  // 한페이지(각각의 번호붙은 페이지)의 테이블에 몇개의 행을 만들수있는지 표시할까 정의함(사이즈를 정함.)
   int intCurPage;       //현재 페이지 번호
   int intLastPage;      // 마지막 페이지 번호
   int intNoRows;         // 게시물 수
   int intPageListSize;     // 페이지 목록 크기
%>


<%
    String strSql;
    Connection conn = null; 
    Statement stmt = null;
    ResultSet rs = null;

    try { 
       Class.forName("com.mysql.jdbc.Driver"); 
       String strConnect = "jdbc:mysql://localhost:3306/forumdb"; 
       conn = DriverManager.getConnection(strConnect,"jspdb", "jspdb123"); 

       //out.println(strConnect + "<br>");

       if (conn == null) {
          out.println("data source에 연결이 되지 않음 : " + strConnect);
       }

       stmt = conn.createStatement();
       strSql = "select * from board order by id desc ";
       //out.println(strSql + "<br>");
       rs = stmt.executeQuery(strSql);                     // rs : 조건에맞는 행들의 집합임
       if (rs != null) {
%>

<table border=1 cellSpacing=2>

    <tr bgcolor=#ffd891>
        <th width=50 height=20>No</th>
        <th width=400>제&nbsp;&nbsp;목</th>
        <th width=150>글쓴이</th>
        <th width=200>글쓴날</th>
        <th width=70>조회수</th>
    </tr>
<%	
         while (rs.next()) {
%>
            <tr class=list bordercolor=#f3f3f3
               onmouseover="style.background = '#b7b7e9'"
               onmouseout="style.background = '#f3f3f3'">

               <td width=30 align=right> <%= rs.getInt("id")%>&nbsp;</td>

               <td width=340>
                   <A href="show.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title")%></a>
               </td>
    
               <td width=120 align=center><%=rs.getString("userid")%></td>
               <td width=120 align=center><%=rs.getTimestamp("regdate")%></td>
               <td width=40 align=center><%=rs.getInt("hit")%></td>

            </tr>
<%
         } // end of while
       } // end of if
     } catch (Exception e) {

       out.println(e.getMessage());

    } finally { 

       //out.println("finally <br>");
       if (conn != null)  
          conn.close();

    }
%>

</table>
[<A href="writeform.jsp">게시판에 글쓰기</A>]
[<A href="../default.jsp">초기화면으로 가기</A>]

