<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    request내장 객체: 웹브라우저 요청에 대한 처리
    - 클라이언트와 관련된 정보 읽기
    - 서버와 관련된 정보
    - 클라이언트가 요청한 전송 정보
    - 클라이언트가 전송한 쿠키
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request내장 객체</title>
</head>
<body>
	<h2>request내장 객체</h2>
	<hr/>
	
	서버 포트: <%=request.getServerPort() %><br/>
	서버 이름: <%=request.getServerName() %><br/>
	client ip: <%=request.getRemoteAddr() %><br/>
	요청 protocol: <%=request.getProtocol() %><br/>
	요청 context: <%=request.getContextPath() %><br/>
	서버 URI: <%=request.getRequestURI() %>
	<%--
	request내장 객체
	서버 포트: 8080
	서버 이름: localhost
	client ip: 0:0:0:0:0:0:0:1
	요청 protocol: HTTP/1.1
	요청 context: /studyhtml
    서버 URI: /studyhtml/jsp/j01/h06_request.jsp
	 --%>
</body>
</html>