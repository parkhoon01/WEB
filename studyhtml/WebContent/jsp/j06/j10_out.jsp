<%@page import="java.io.IOException"%>
<%@page import="java.io.FileReader"%>
<%@page import="org.apache.log4j.Logger"%>
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
	<h2>JSTL:out</h2>
	<hr/>
<%
    // /studyhtml/jsp/j06/j02_choose.jsp
	Logger LOG = Logger.getLogger(this.getClass());
    LOG.debug("JSTL:out");
    
    FileReader reader = null;
    
    try{
    	// http://localhost:8080/studyhtml/jsp/j06/j10_out.jsp?path=//jsp/j06/j02_choose.jsp
    	// path를 param으로 전달(get)
    	String path = request.getParameter("path");
    	LOG.debug("path: " + path);
    	
    	// path의 절대경로 : /Users/parkhoon/Desktop/DCOM_20220127/03_WEB/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/studyhtml/jsp/j06/j02_choose.jsp

    	LOG.debug("절대경로: " + getServletContext().getRealPath(path));
    	
    	reader = new FileReader(getServletContext().getRealPath(path));
%>
    <pre>
        <c:out value="<%=reader %>" escapeXml="true" /> <!-- reader -->
    </pre>
<%    	
    }catch(IOException e){
    	LOG.debug("------------------------------");
    	LOG.debug("IOException=" + e.getMessage());
    	LOG.debug("------------------------------");
    }finally{
    	if(null != reader){
    		try{
    			reader.close();    			
    		}catch(IOException e){
    			
    		}
    	}
    }
%>	
</body>
</html>