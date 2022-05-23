<%@page import="com.pcwk.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 설정</h2>
	<hr/>
    <%
      // session 굽기
      session.setAttribute("userId", "a few good man");     // userId라는 이름으로 세션 값을 'a few good man'
      session.setAttribute("userName", "홍길동");             // userName이라는 이름으로 세션 값을 '홍길동'
      
      BoardVO board01 = new BoardVO(900016, "제목_900016", "내용_900016", 0, "", "pcwk", "", "pcwk");
      
      session.setAttribute("board", board01);
    
    %>
    	
</body>
</html>