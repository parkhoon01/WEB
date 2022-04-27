<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%  
    String realFolder = "";             // 웹 어플리케이션 상의 절대경로
    
    String saveFolder = "/fileSave";    // 파일 upload 저장 폴더
    
    String encType    = "utf-8";        // encoding
    
    int maxSize       = 5 * 1024 * 1024;// 쵀대 업로드될 파일 크기
    
    ServletContext context = getServletContext();

    realFolder = context.getRealPath(saveFolder);
    
    /* System.out.println("realFolder: " + realFolder); */
    out.println("realFolder: " + realFolder + "<br/>");
    
    try{
    	MultipartRequest multi = null;
    	
    	multi = new MultipartRequest(request,
    			realFolder,
    			maxSize,
    			encType,
    			new DefaultFileRenamePolicy());
    	
    	// fileForm에서 전송한 parameters
    	Enumeration params = multi.getParameterNames();
    	
    	while(params.hasMoreElements()){
    		String name = (String)params.nextElement(); // 변수 이름
    		
    		String value = multi.getParameter(name);
    		out.println(name + ": "+ value + "<br/>");
    	}
    	
    	// file : 파일 정보 가져오기
        Enumeration<?> files = multi.getFileNames();
    	while(files.hasMoreElements()){
    		String name = (String)files.nextElement();
    		// 서버에 저장된 파일 이름
    		String fileName = multi.getFilesystemName(name);
    		
    		// 전송 원본 파일명
    		String orgFileName = multi.getOriginalFileName(name);
    		
    		// 전송된 파일 타입
    		String type = multi.getContentType(name);
    		
    		// 전송된 파일 정보
    		File file = multi.getFile(name);
    		
    		out.print("파라메터 명: " + name +"<br>");
    		out.print("원본 파일명: " + orgFileName +"<br>");
    		out.print("저장 파일명: " + fileName +"<br>");
    		out.print("파일 타입: " + type +"<br>");
    		
    		if(null != file){
    			out.print("파일크기: " + file.length() + "<br>");
    		}
    		
    		
    	}
    	
    }catch(IOException e){
    	System.out.println("IOException: " + e.getMessage());
    	e.getStackTrace();
    }catch(Exception e){
    	System.out.println("Exception: " + e.getMessage());
    	e.getStackTrace();
    }
    
%>