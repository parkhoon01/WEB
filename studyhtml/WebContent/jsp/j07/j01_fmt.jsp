<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en" /> <!-- locale -->
<fmt:bundle basename="resource.message"> <!--  참조할 properties경로 지정 --> 
<fmt:message key="TITLE" var="title" />  <!-- title변수에 TITLE 저장 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
</head>
<body>
	<h2>${title }</h2>
	<hr/>
	<!-- http://localhost:8090/studyhtml/jsp/j07/j01_fmt.jsp?id=goodman -->
	<fmt:message key="GREETING"/><br/>
	<c:if test="${not empty param.id }">
	   <fmt:message key="VISITOR"> <!-- VISITOR값에 param전달해 출력! -->
	       <!-- VISITOR = your ID is {0} -->
	       <fmt:param value="${param.id }" />
	   </fmt:message>
	</c:if>
	
</body>
</html>
</fmt:bundle>