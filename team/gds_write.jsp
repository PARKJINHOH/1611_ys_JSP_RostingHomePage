<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.lang.*" %>

<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<% request.setCharacterEncoding("utf-8");%>

<%
    String strSql;
    Connection conn = null; 
    Statement stmt = null;
    ResultSet rs = null;
    int intResult;
    Integer intId;

    String realFolder = "";//웹 어플리케이션상의 절대 경로

    //파일이 업로드되는 폴더를 지정한다.
    String saveFolder = "goodsimage";
    String encType = "utf-8"; //엔코딩타입
    int maxSize = 5*1024*1024;  //최대 업로될 파일크기 5Mb

    ServletContext context = getServletContext();
    //현재 jsp페이지의 웹 어플리케이션상의 절대 경로를 구한다
    realFolder = context.getRealPath(saveFolder);  

    // login을 하지 않은 사용자가 게시물을 읽을 수 없기 때문에
    // 글내용 보기를 시도하는 순간 강제로 login 창을 표시해 줌 
    String strLoginok = (String)session.getAttribute("loginok");

    if (strLoginok == null || !strLoginok.equals("yes")) {
       response.sendRedirect("./loginForm.jsp");
    }

//    String strTitle = request.getParameter("goods");
//    String strBody = request.getParameter("body");
    Timestamp dtNow = new Timestamp(System.currentTimeMillis());

    MultipartRequest multi = null;
   
    //전송을 담당할 콤포넌트를 생성하고 파일을 전송한다.
    //전송할 파일명을 가지고 있는 객체, 서버상의 절대경로,최대 업로드될 파일크기, 문자코드, 기본 보안 적용
    multi = new MultipartRequest(request,realFolder,
	 	   maxSize,encType,new DefaultFileRenamePolicy());

    String strNo = multi.getParameter("goods_no");
    String strNam = multi.getParameter("goods_name");
    String strPri = multi.getParameter("goods_price");
   
    //서버에 저장된 파일 이름
    String strFnam = multi.getFilesystemName("upfile");
   
    //전송전 원래의 파일 이름
    String original = multi.getOriginalFileName("upfile");
   
    //전송된 파일의 내용 타입
    String type = multi.getContentType("upfile");
      
    //전송된 파일 속성이 file인 태그의 name 속성값을 이용해 파일 객체 생성
    File file = multi.getFile("upfile");

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
       // strSql = "select max(id) seqno from goods ";
       //out.println(strSql + "<br>");
       //rs = stmt.executeQuery(strSql); 
       //if (rs != null && rs.next()) {
       //  intId = (Integer)rs.getInt("seqno");
       //   intId = intId + 1;
       //} else {
       //   intId = 1;
       //}

       strSql = "insert into goods (goods_no,goods_name,goods_price,goods_fname) values (";
       //strSql = strSql + intId.toString() + ",";
       //strSql = strSql + "'" + session.getAttribute("userid") + "',";	
       //strSql = strSql + "'123',"; 	
       strSql = strSql +  strNo + ",";	
       strSql = strSql + "'" + strNam + "',"; 
       strSql = strSql + strPri + ",";
       strSql = strSql + "'" + strFnam + "')";


//out.println(strSql);
       intResult = stmt.executeUpdate(strSql);

       // 게시판으로 돌아가기
      response.sendRedirect("feature.jsp");

     } catch (Exception e) {

      // out.println(e.getMessage() + "err <br>");
      // if (e.getMessage().indexOf("Duplicate") >= 0)
      // {
      //     out.println("<script>");
      //     out.println("alert('글 등록하는 중 예기치 않은 오류가 발생하였습니다');");
      //    out.println("history.back();");
      //     out.println("</script>");
      // }
       out.println(e.getMessage() + "err <br>");

    } finally { 
       //out.println("finally <br>");
       if (conn != null)  
          conn.close();
    }
%>
