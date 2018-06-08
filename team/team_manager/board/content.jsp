<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="ch13.board.BoardDBBean"%>
<%@ page import="ch13.board.BoardDataBean"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="color.jspf"%>
<%
	String check = (String) session.getAttribute("name");
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		try {
			BoardDBBean dbPro = BoardDBBean.getInstance();
			BoardDataBean article = dbPro.getArticle(num);

			int ref = article.getRef();
			int re_step = article.getRe_step();
			int re_level = article.getRe_level();
	%>

	<p>글내용 보기</p>

	<form>
		<table align="center">
			<tr height="50">
				<td align="center" width="125" bgcolor="<%=value_c%>">글번호</td>
				<td align="center" width="125" align="center" style="word-wrap:break-word;word-break:break-all;"><%=article.getNum()%></td>
				<td align="center" width="125" bgcolor="<%=value_c%>">조회수</td>
				<td align="center" width="125" align="center" style="word-wrap:break-word;word-break:break-all;"><%=article.getReadcount()%></td>
			</tr>
			<tr height="50">
				<td align="center" width="125" bgcolor="<%=value_c%>">작성자</td>
				<td align="center" width="125" align="center" style="word-wrap:break-word;word-break:break-all;"><%=article.getWriter()%></td>
				<td align="center" width="125" bgcolor="<%=value_c%>">작성일</td>
				<td align="center" width="125" align="center" style="word-wrap:break-word;word-break:break-all;"><%=sdf.format(article.getReg_date())%></td>
			</tr>
			<tr height="50">
				<td align="center" width="125" bgcolor="<%=value_c%>">글제목</td>
				<td align="center" width="375" align="center" colspan="3" style="word-wrap:break-word;word-break:break-all;"><%=article.getSubject()%></td>
			</tr>
			<tr>
				<td align="center" width="125" bgcolor="<%=value_c%>">글내용</td>
				<td align="left" width="375" colspan="3" style="word-wrap:break-word;word-break:break-all;"><pre><%=article.getContent()%></pre></td>
			</tr>
			<tr height="50">
				<td colspan="4" bgcolor="<%=value_c%>" align="right">
					<%
						if (check == null) {
					%> <b>글을 작성하시려면 <a href="../loginForm.jsp">로그인</a>을 해주세요
				</b> <%
 	} else {
 %><input type="button" value="글수정"
					onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글삭제"
					onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
					&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="답글쓰기"
					onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
					&nbsp;&nbsp;&nbsp;&nbsp; <%
 	}
 %> <input type="button" value="글목록"
					onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
		<%
			} catch (Exception e) {
			}
		%>
	</form>
</body>
</html>