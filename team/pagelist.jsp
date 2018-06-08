<b>페이지이동</b>

<%  
    int i;

    // 페이지 리스트 개수 지정
    intPageListSize = 6;
    
    // ---- 시작 페이지 번호 구하기
    int intStartPage = ((intCurPage - 1) / intPageListSize) * intPageListSize + 1;
    
    // ----  [이전] 링크 추가
    if (intStartPage > 1) {  %>
        &nbsp;&nbsp;[<a href="list.jsp?page=<%=intStartPage - 1%>">이전</a>]&nbsp;&nbsp;
<%  }

    // ----  페이지 번호 나열
    for (i = intStartPage; i < intStartPage + intPageListSize && i <= intLastPage; i++) {
        if (i == intCurPage)
            out.println("&nbsp;&nbsp;" + i + "&nbsp;&nbsp;");
        else {   %>
            &nbsp;&nbsp;<a href="list.jsp?page=<%=i%>"> <%=i%> </a>&nbsp;&nbsp;
<%      }       

//        if (i >= intLastPage)  // 페이지 범위를 벗어나는 경우
//            java.lang.System.exit(0);
    }

    // ---- [다음] 링크 추가
    if (intStartPage + intPageListSize <= intLastPage) { %>
       &nbsp;&nbsp;[<a href="list.jsp?page=<%=intStartPage + intPageListSize%>">다음</a>]&nbsp;&nbsp;
<%  } %>

