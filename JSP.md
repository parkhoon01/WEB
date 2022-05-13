# `JSP(Java Server Page)`

JSP,ASP,PHP

jsp Java Server Page에 머리글자로써 썬에서 만든 자바 `서블릿` 기반 서버

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

