<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");   // 요청에 대한 인코딩
   
   String id = (String)request.getParameter("id"); 
   out.print("id=" + id +"<br>");
    
   String passwd = (String)request.getParameter("passwd");
   out.print("password=" + passwd);
   
%>
