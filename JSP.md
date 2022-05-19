# `JSP(Java Server Page)`

JSP,ASP,PHP

jsp Java Server Page의 머리글자로써 썬에서 만든 자바 `서블릿` 기반 서버

스크립트 언어

```
최초 서블릿으로 컴파일된 후에 메모리에서 처리 된다.
자바의 모든 기능을 사용할 수 있다.
jsp 또는 다른 서블릿간 데이터 공유가 쉽다.
사용자 정의 태그를 만들어 사용할 수 있다.(JSTL)
```

## `jsp 주석`


/studyhtml/jsp/j01/h01_comment.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>comment</h2>
    <hr/>
    
    <!-- html 주석 -->
    <p>Html Comment</p>
    
    <%-- jsp 주석: html 소스보기에도 보이지 않는다. --%>
    <p>jsp Comment</p>
    
    
</body>
</html>
```

<hr/>

# `지시어(Directives)`

jsp페이지에 속성을 기술하는 곳으로 jsp 컨테이너에게 해당 페이지를 어떨게 처리해야 하는지 전달하기 위한 내용을 담고 있다.

```jsp
<%@ page 속성='값' 속성='값 ... %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
language: 페이지에서 사용하는 언어
contentType: jsp MIME
pageEncoding: UTF-8, ecu-kr, ISO-8859-1
import: java import와 동일
```

|속성|설명|
|:---:|:---:|
|session|세션 사용 여부를 지정.|
|buffer|출력 버퍼의 크기를 지정.|
|autoFlush|출력 버퍼가 모두 채워졌을 때 자동으로 비울지를 결정|
|trimDirectiveWhite|html출력 상단 2줄 공백 제거|
|errorPage|해당 페이지에서 에러가 발생 했을 때 에러 발생 여부를 보여줄 페이지 지정|
|isErrorPage|해당 페이지가 에러를 처리할지 여부를 지정|

/studyhtml/jsp/j01/h02_page.jsp
```jsp
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %><%-- html 출력 상단 공백 제거 --%>
<%
	Date d = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>page속성</h2>
    <hr/>
    
    <div>
        <%-- 날짜 데이터 출력 --%>
       날짜: <%=d %><br/>
       
       <%
        // java code
        for(int i=1; i<=10; i++){
        	out.print("<p>"+i+"</p>");
        }
       %>
    </div>
</body>
</html>
```

## contentType

/studyhtml/jsp/j01/h03_page_content.jsp
```jsp
<%@ page language="java" contentType="application/msexcel"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>contentType: 현재 jsp 내용에 대한 유형을 결정(원하는 MIME을 기록)</h2>
	<hr/>
	
</body>
</html>
```

## errorPage
/studyhtml/jsp/j01/h04_error.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    errorPage="error.jsp"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Error 테스트</h2>
	<hr/>
	<%= 5/0 %>
</body>
</html>
```

## errorPage 지정

```jsp
<%@ page errorPage='error.jsp' %>

error를 처리하기 위한 페이지가 되기 위한 조건
<%@ page isErrorPage = 'true' %>
```

/studyhtml/jsp/j01/error.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    isErrorPage="true"
    pageEncoding="UTF-8"%>
<h2>처리중 문제가 발생 했습니다.</h2>
<hr/>
<table>
    <tr width='100%' bgcolor="pink">
       <td>관리자에게 문의해 주세요<br/>
            빠른 시간에 복구 하겠습니다.
        <hr/>
        <%=exception.toString() %>
       </td>
    </tr>
</table>
```
<hr/>

# `jsp의 스크립트 요소`
```jsp
1. 스크립트릿(Scriptlet): <% %> 자바코드
2. 표현식(Expression): <%= %>  자바코드이지만 ;이 오면 안됨
3. 선언부(Declaration): <%! %> 자바에 함수,변수 만들기(가급적 쓰지 않는 것을 권장!)
```

/studyhtml/jsp/j01/h05_scriptlet.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
jsp 스크립트 요소
1. 스크립트릿(Scriptlet): <% %> 자바코드
2. 표현식(Expression): <%= %>  자바코드이지만 ;이 오면 안됨
3. 선언부(Declaration): <%! %> 자바에 함수,변수 만들기(가급적 쓰지 않는 것을 권장!)
 --%>
<%
int sum = 0;
for(int i=1; i<=100; i++){
	sum+=i;
}
%>

<%!
// servlet에 전역변수가 된다.
String[] str = {"jsp가","재미","있다"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jsp 스크립트 요소</h2>
	<hr/>
	<div>
	   <p>1~100까지의 합계는: <%=sum %></p>
	</div>
	
	<div>
	   <%
	    for(int i=0; i<str.length; i++){
	    	out.println("<p>"+ str[i] +"</p>");
	    }
	   %>
	</div>
	
</body>
</html>
```

<hr/>

# `jsp 내장객체`

jsp내에서 선언하지 않고 사용하는 객체

![20](https://user-images.githubusercontent.com/104181668/168200304-bede22ff-e9a5-436f-8f20-ace23e499bea.png)

## `request 메서드`

사용자가 form에 입력한 param을 얻어낼 수 있는 기능

|메서드|설명|
|:---:|:---:|
|String getParameter(name)|param name에 저장된 값을 추출, 없으면 null return|
|String[] getParameterValues(name)|param name이 같은 변수들에 값들이 배열로 들어 온다.|
|EnumerationgetParameterNames()|param으로 넘어오는 변수 name을 모두 추출 가능|
|String getRemoteAddr()|client ip|


/studyhtml/jsp/j01/h06_request.jsp
```jsp
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
```

<hr/>

# `h07_form.jsp -> h07_form_request.jsp`

/studyhtml/jsp/j01/h07_form_request.jsp
```jsp
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request 처리</h2>
	<hr/>
	<%
	   String userNm = request.getParameter("userNm");
	   String userCell = request.getParameter("userCell");
	   String lang = request.getParameter("lang");
	   
	%>
	
	이름: <%=userNm %><br/>
	전화번호: <%=userCell %><br/>
	<!--  다건 전송중 1건만 옴 -->
    좋아하는 프로그램: <%=lang %><br/>
	
	<%
	String[] langArray = request.getParameterValues("lang");
	for(int i=0; i<langArray.length; i++){
		out.println(langArray[i] + "<br/>");
	}
	%>
	
	변수 이름들 추출<br/>
	<%
	   Enumeration<String> names = request.getParameterNames();
	   while(names.hasMoreElements()){
		   String name = names.nextElement();
		   out.println(name + ":" + request.getParameter(name) + "<br/>");
	   }
	%>
</body>
</html>
```

/studyhtml/jsp/j01/h07_form.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>form 요청</h2>
	<hr/>
	
	<!-- http://localhost:8080/studyhtml/jsp/j01/h07_form_request.jsp?userNm=&userCell=&lang=10&lang=20 -->
	<form action="/studyhtml/jsp/j01/h07_form_request.jsp" method="get">
	   이름:<input type="text" name="userNm" size="10" /><br/>
	   전화번호:<input type="text" name="userCell" size="10" /><br/>
	   좋아하는 프로그램<br/>
	   <input type="checkbox" name="lang" value="10" />java<br/>
	   <input type="checkbox" name="lang" value="20" />oracle<br/>
	   <input type="checkbox" name="lang" value="30" />jsp<br/>
	   <input type="checkbox" name="lang" value="40" />jquery<br/>
	   <input type="submit" value="전송" />
	</form>
	
</body>
</html>
```

## `response 메서드`

사용자 요청에 대한 응답을 처리하기 위한 객체

```
getHeaderNames() 요청과 관련된 모든 해더의 이름을 구한다.													
getHeader(name) 이름이 name인 해더의 값을 String으로 구한다.												
getHeader(name) 이름이 name인 모든 헤더의 값을 String[]으로 구한다.										
getIntHeader(name) 이름이 name인 헤더의 값을 int형으로 구한다.												
getDateHeader(name) 이름이 name인 헤더의 값을 long형으로 구한다.	
getCookies() 요청과 관련된 모든 쿠키를 구한다.
getMethod() 요청 방식이 GET인지 POST인지 구한다.		
```

/studyhtml/jsp/j01/h08_request_header.jsp
```jsp
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>request header정보</h2>
	<hr/>
	
	<%
	   Enumeration<String> names = request.getHeaderNames();
	   while(names.hasMoreElements()){
		   String headerName = names.nextElement();
// 		   System.out.println("headerName: " + headerName);
		    out.println(headerName + ":" + request.getHeader(headerName) + "<br/>");
	   }
	   out.println("<hr/>");
	   String userAgent = request.getHeader("user-agent");
	   String host = request.getHeader("host");
	   out.println("userAgent: " + userAgent + "<br/>");
	   out.println("host: " + host + "<br/>");
	%>
	
</body>
</html>
```

# `response 내장 객체`

request 기본 객체와 반대의 기능을 수행

웹 브라우저에 전송할 내용을 담을 수 있다.

- 헤더입력: cache control
```
웹 캐시(영어: web cache) 또는 HTTP 캐시(HTTP cache)는 서버 지연을 줄이기 위해 웹 페이지, 
이미지, 기타 유형의 웹 멀티미디어 등의 웹 문서들을 임시 저장하기 위한 정보기술이다.
```

/studyhtml/jsp/j01/h09_response_cache.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
웹 캐시(영어: web cache) 또는 HTTP 캐시(HTTP cache)는 서버 지연을 줄이기 위해 웹 페이지, 
이미지, 기타 유형의 웹 멀티미디어 등의 웹 문서들을 임시 저장하기 위한 정보기술이다.
모든 jsp에 포함 가능: <jsp:include='' />
<%@ include file = '' %>
--%>

<%
	// Http 1.1에서 지원하는 헤더: 웹브라우저가 응답 결과를 캐시하지 않음
    response.setHeader("Cache-Control", "no-cache");

    // 웹 브라우저가 응답결과를 캐시하지 않음(앞/뒤로 가기 no-cache)
    response.setHeader("Cache-Control", "no-store");
    
    // Http 1.0에서 지원하는 헤더: 웹브라우저가 응답 결과를 캐시하지 않음
    response.setHeader("Pragma", "no-cache");
 
     // Http 1.0에서 현재시간 이전으로 캐시하지 않음
    response.setHeader("Expires", "1L");
         
     
%>
```

# `include 지시어`

현재 jsp 파일에 다른 html이나 jsp문서를 포함하기 위한 기능을 제공한다.

```
h10_1_footer.jsp를 h10_include.jsp에 포함
```

/studyhtml/jsp/j01/h10_1_footer.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    Copyright &copy; 2022 PCWK ALL rights reserved.	
</body>
</html>
```

/studyhtml/jsp/j01/h10_include.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="h09_response_cache.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>include 지시어 테스트</h2>
	<hr/>
	<%@ include file="h10_1_footer.jsp" %>
</body>
</html>
```

# `response를 이용한 페이지 이동`
response에 리다이렉트

리다이렉트는 웹서버가 웹브라우저에게 다른 페이지로 이동하라고 응답하는 기능.

```
ex) response.sendRedirect("이동할 url");
```

```
h11_response_redirect.jsp -> index.jsp 로그인 성공하면 index.jsp로 이동
```

/studyhtml/jsp/j01/h11_response_redirect.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//http://localhost:8080/studyhtml/jsp/j01/h11_response_redirect.jsp?userId=pcwk
	String userId = request.getParameter("userId");
	System.out.println("userId: " + userId);
	
	if(null != userId && userId.equals("pcwk")){
		response.sendRedirect("index.jsp");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>response.sendRedirect</h2>
	<hr/>
	
	<div>잘못된 아이디입니다.</div>
</body>
</html>
```

/studyhtml/jsp/j01/index.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>response.sendRedirect: 성공</h2>
	<hr/>
	
</body>
</html>
```

# `Servlet(서블릿)`

클라이언트의 요청을 처리하고, 그 결과를 반환하는 Servlet 클래스의 구현 규칙을 지킨 자바 웹 프로그래밍 기술	

![21](https://user-images.githubusercontent.com/104181668/168223445-03ec1458-7fcc-463b-9847-767ea52ade86.png)


# `Servlet Life Cycle` 

[Log4J] : https://mvnrepository.com/artifact/org.apache.logging.log4j/log4j-core/2.17.1

<img width="285" alt="22" src="https://user-images.githubusercontent.com/104181668/168501140-b92b2d8f-7014-436a-8c33-79e89d9df921.png">

## Servlet과 jsp의 역사

1. Servlet
2. jsp: Servlet의 단점인 view표현에 노력이 과다하게 들어간다.
3. jsp의 단점: html, java, css, javascript 혼재되어 스파게티 코드 발생
4. MVC(Model View Controller): Servlet Controller의 역활을 하게 된다. 


url: /board/board.do![23](https://user-images.githubusercontent.com/104181668/168512860-fadd3cfe-1083-436f-97c1-6173a72c4000.png)
```
BoardController.java(Servlet)

work_div	doSave
		doRetrive
		doSelectOne
		doUpdate
		doDelete
```

처리 방식
```
testForm.jsp(전송) -> Tomcat(WAS)
		 -> BoardController.java	-> BoardDao.java	-> Oracle DB
		 -> BoardController()		-> BoardDao()
		 -> service()			-> doSave(BoardVO):1/0
		 -> workDiv(doSave)
		 -> doSave(HttpServletRequest)
```


# `application 내장객체`

application 기본 객체는 웹 어플리케이션 전반에 걸쳐서 사용되는 정보를 담고 있다.
```
ex) 서버정보, 서버초기화 정보 등
```

/studyhtml/jsp/j02/h01_application.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 서버 정보 읽기
  

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>서버 정보 읽기</h2>
	<hr/>
	서블릿 정보: <%=application.getServerInfo() %><br/>
	서블릿 규약 메이저 버전: <%=application.getMajorVersion() %><br/>
    서블릿 규약 마이너 버전: <%=application.getMinorVersion() %><br/>
	
</body>
</html>
```

web.xml
```xml
<context-param>
    <description>파라메터 설명</description>
    <param-name>파라메터 이름</param-name>
    <param-value>파라메터 값</param-value>
  </context-param>
```

/studyhtml/jsp/j02/h02_application.jsp
```jsp
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>application param</h2>
	<hr/>
	
<%
// init param 변수이름 추출   
    Enumeration<String> initParamNames = application.getInitParameterNames();
    while(initParamNames.hasMoreElements()){
    	String paramName = initParamNames.nextElement();
    	String paramValue = application.getInitParameter(paramName);   // 초기화 파라메터의 값을 추출
    	out.println("paramName: " + paramName + "=" + paramValue + "<br/>");
    }

%>
</body>
</html>
```

web.xml
```xml
<context-param>
    <description>파라메터 설명</description>
    <param-name>pcwk</param-name>
    <param-value>a few good man</param-value>
  </context-param>
  
  <context-param>
    <description>파라메터 설명</description>
    <param-name>class</param-name>
    <param-value>cClass</param-value>
  </context-param>
```

<img width="285" alt="24" src="https://user-images.githubusercontent.com/104181668/168703763-fb7bd6be-3703-40c7-bf59-329e8578baf9.png">


# `웹상태 코드`

https://ko.wikipedia.org/wiki/HTTP_%EC%83%81%ED%83%9C_%EC%BD%94%EB%93%9C



# `include` 

jsp에는 현재의 jsp파일에다 다른 파일(jsp, html)을 포함시켜 사용할 수 있다.

header, footer, menu등을 나타날 때 사용

```
include 방식
- 지시어 방식(include directive) : <%@ include file="/cmn/header.jsp" %>
- 액션(include action) : <jsp:include page="/cmn/header.jsp" >  param을 전달 가능  <jsp:include page="/cmn/header.jsp" \>
                                                                                   <jsp:param name="email" value="qkrgns0514@naver.com"/>
									       </jsp:include>
공통점은 동일하게 파일을 포함시킨다.
차이점은 지시어는 해당 소스를 포함 시킨후 컴파일
액션은 실행 시점에 해당 파일을 수행하여 결과를 포함 시킨다.
```

jsp/j03/top.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<a href="#">홈</a>
<a href="#">정보</a>

```

jsp/j03/left.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
좌측 메뉴 : 

```

jsp/j03/bottom.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
하단 메뉴 :
소개|도움말|약관|사이트맵
```

jsp/j03/layout.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include: layout</title>
</head>
<body>
	<h2>include layout</h2>
	<hr/>
	
	<table width="400" border="1" cellpadding="0" cellspacin="0">
	   <tr>
	       <td colspan="2"><jsp:include page="/jsp/j03/top.jsp"></jsp:include></td>
	   </tr>
	   
	   <tr>
           <td width="100"><jsp:include page="/jsp/j03/left.jsp"></jsp:include></td>
           <td width="300">contents<br/><br/><br/></td>
       </tr>
       
       <tr>
           <td colspan="2"><jsp:include page="/jsp/j03/bottom.jsp"></jsp:include></td>
       </tr>
	
	</table>
	
</body>
</html>
```


```
<jsp:include page="/cmn/header.jsp" \>
        <jsp:param name="email" value="qkrgns0514@naver.com"/>
</jsp:include>

info.jsp (부르기)=> infoSub.jsp
```

jsp/j03/j03_01/infoSub.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String type = request.getParameter("type");
if(null == type){
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>type: <%=type %></h2>
	<hr/>
	
</body>
</html>
```

jsp/j03/j03_01/info.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2></h2>
	<hr/>
	<jsp:include page="/jsp/j03/j03_01/infoSub.jsp">
	   <jsp:param value="rain day!" name="type"/>
	</jsp:include>
</body>
</html>
```

```
request.setAttribute("변수","값"):

<jsp:forward page = "대상.jsp" />

makeTime.jsp
viewTime.jsp
```

jsp/j03/j03_02/makeTime.jsp
```jsp
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Calendar cal = Calendar.getInstance();
request.setAttribute("time", cal);
%>

<jsp:forward page="viewTime.jsp"></jsp:forward>
```

jsp/j03/j03_02/viewTime.jsp
```jsp
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Calendar cal= (Calendar)request.getAttribute("time");
out.print("현재시간: " + cal.get(Calendar.HOUR)
                    + ": " + cal.get(Calendar.MINUTE)
                    + ": " + cal.get(Calendar.SECOND)
		);

%>
```


# `자바빈`

속성(데이터), 변경 이벤트, 객체직렬화를 위한 표준

jsp에서는 속성을 표현하기 위한 용도로 사용된다.

자바의 VO객체와 비슷

```
MemeberInfo.java
memberSignFrom.jsp
processJoining.jsp
```

jsp/j04/memberSignForm.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입 입력 폼</h2>
	<hr/>
	<form action="processJoining.jsp" method="post">
		아이디:<input type="text" name="id"><br/>
		이름:<input type="text" name="name"><br/>
		이메일:<input type="text" name="email"><br/>
		<input type="submit" value="회원가입">
	</form>
	
</body>
</html>
```

jsp/j04/processJoining.jsp
```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!-- MemberInfo memberInfo=new MemberInfo() -->
<jsp:useBean id="memberInfo" class="com.pcwk.j04.MemberInfo"/>
<!-- MemberInfo set에 값을 매핑 -->
<jsp:setProperty name="memberInfo" property="*"/>
<!-- 비번 -->
<jsp:setProperty name="memberInfo" property="password" value="<%=memberInfo.getId() %>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입 정보</h2>
	<hr/>
    아이디:<%=memberInfo.getId() %><br/>
    이름:<%=memberInfo.getName() %><br/>
    이메일:<%=memberInfo.getEmail() %><br/>
    비번:<jsp:getProperty property="password" name="memberInfo"/>
	
</body>
</html>
```

j04/MemberInfo.java
```java
package com.pcwk.j04;

public class MemberInfo {
	
	private String id;				// 회원 ID
	private String password;		// 회원 비번
	private String name;			// 이름
	private String registerDate;	// 가입일
	private String email;			// 이메일
	
	public MemberInfo() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", password=" + password + ", name=" + name + ", registerDate=" + registerDate
				+ ", email=" + email + "]";
	}
	
	
	
	
}

```

# `시퀀스 다이어그램`

기능 수행을 위해 시스템 내의 객체들이 다른 객체들과 어떻게 교류하는지를 보여주는 다이어그램이다. 시간의 흐름에 따른 객체 간의 상호 작용을 명세화하여 나타낸 다이어 그램으로 객체와 생명선, 객체의 실행, 객체 사이의 메시지 등으로 구성된다

![25](https://user-images.githubusercontent.com/104181668/169180883-239d0f70-b736-4c67-a7f9-f3a340af77e3.png)



# `유스케이스 다이어크램`

시스템과 사용자의 상호작용을 다이어그램으로 표현한 것으로 사용자의 관점에서 시스템의 서비스 혹은 기능 및
그와 관련한 외부 요소를 보여주는 것이다.
사용자가 시스템 내부에 있는 기능 중에 어떤 기능을 사용 할 수 있는지 나타내며 유스케이스 다이어그램을
사용함으로써 고객과 개발자가 요구사항에 대한 의견을 조율 할 수 있다.
