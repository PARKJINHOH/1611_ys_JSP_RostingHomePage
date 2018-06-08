<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("utf-8");%>

<%
    // login을 하지 않은 사용자가 게시물을 읽을 수 없기 때문에
    // 글내용 보기를 시도하는 순간 강제로 login 창을 표시해 줌 
    String strLoginok = (String)session.getAttribute("loginok");

    if (strLoginok == null || !strLoginok.equals("yes")) {
       response.sendRedirect("./loginForm.jsp");
    }
%>

<FORM action="gds_write.jsp" method="post" enctype="multipart/form-data">
    <table border=0 cellspacing=4 cellpadding=2>
    <tr>	
        <td align=right>글쓴이</td>
        <td><%= session.getAttribute("id") %></td></tr>
    <tr>	
        <td align=right>상품번호</td>
        <td><input name="goods_no" type="text" size="60"></td></tr>
    <tr>	
    <tr>	
        <td align=right>상품명</td>
        <td><input name="goods_name" type="text" size="60"></td></tr>
    <tr>	
        <td align=right>가격</td>
        <td><input name="goods_price" rows=12 cols=60></td></tr>
    <tr>	
        <td align=right>상품이미지</td>
        <td><input type=file name="upfile"></td></tr>
    <tr>
        <td align=center colspan=2>
        <input type="submit" value="글 올리기">&nbsp;&nbsp;
        <input type="reset" value="다시 쓰기">
        </td></tr>
    </table>
</FORM>

[<a href="list.jsp">게시판으로 돌아가기</A>]
