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

```
<%@ page 속성='값' 속성='값 ... %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
language : 페이지에서 사용하는 언어
```
