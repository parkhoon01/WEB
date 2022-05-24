<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>timezone</h2>
	<hr/>
	<c:set var="now" value="<%=new Date() %>" />
	서울:<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" /><br/>
	홍콩:<fmt:timeZone value="Hongkong">
	      <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" /><br/>
	    </fmt:timeZone>
</body>
</html>