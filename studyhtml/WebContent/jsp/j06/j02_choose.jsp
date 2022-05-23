<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jstl:choose</h2>
	<hr/>
	
	<c:choose>
<!-- 	http://localhost:8080/studyhtml/jsp/j06/j02_choose.jsp?name=jsp -->
	   <c:when test="${param.name == 'html' }">
	       당신의 이름은 ${param.name}입니다.(html)
	   </c:when>
<!-- 	   http://localhost:8080/studyhtml/jsp/j06/j02_choose.jsp?name=jsp -->
	   <c:when test="${param.name == 'jsp' }">
	       당신의 이름은 ${param.name}입니다.(jsp)
	   </c:when>
<!-- 	   http://localhost:8080/studyhtml/jsp/j06/j02_choose.jsp -->
	   <c:otherwise>
	       당신의 이름은 없습니다.(otherwise)
	   </c:otherwise>
	</c:choose>
	
</body>
</html>