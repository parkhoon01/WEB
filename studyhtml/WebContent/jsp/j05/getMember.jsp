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
	<h2>세션 읽기</h2>
	<hr/>
	<%
	   String userId = (String)session.getAttribute("userId");
	   out.print("userId: " + userId + "<br/>");
	   
	   String userName = (String)session.getAttribute("userName");
       out.print("userName: " + userId + "<br/>");
       
       BoardVO board = (BoardVO)session.getAttribute("board");
       out.print("board: " + board.toString());
	%>
</body>
</html>