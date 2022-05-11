# jquery

## jquery 환경설정

### 01. Download
```
  compressed(압축): comment와 enter가 없음
  uncompressed(비압축):comment와 enter가 있음
```

### 02. CDN(Content Delivery Network)
```
  버전
  `1.x` 
  2.x
  3.x
  
  CDN
  <script src="https://code.jquery.com/jquery-1.12.4.js"
  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script>
```

/studyhtml/WebContent/jq/j01.html
```html
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- 스타일 시트-->
<style type = "text/css">

</style>
<title>Insert title here</title>
<!-- local server에서 접근 -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>

<!-- jquery CDN -->
<!-- minified -->
<!-- <script
  src="https://code.jquery.com/jquery-1.12.4.min.js"
  integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
  crossorigin="anonymous"></script> -->
  
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
  crossorigin="anonymous"></script> -->

<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
		console.log('document');
	});
</script>
</head>
<body>
	<h2></h2>
	<hr/>
	
</body>
</html>
```

## 템플릿

```
<link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/board_20220422.css">
<!-- local server에서 접근 -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>

<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
		console.log('PCWK document');
	});
</script>

```

```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="${encoding}">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- reset 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/board_20220422.css">
<!-- 스타일 시트-->
<style type = "text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$$(document).ready(function(){
		console.log('PCWK document');
	});
</script>
</head>
<body>
	<h2>${cursor}</h2>
	<hr/>
	
</body>
</html>
```

# `jqeury 선택자`

jQuery 선택자의 형식

$ = jquery

$('선택자')

$('#id선택자')

$('태그')

$('.class선택자')

|선택자|설명|
|---|:---:|
|태그 선택자|$('p'): html의 p 요소 선택|
|`id 선택자`|`$('#gnb'): html의 요소 id 가 gnb인 요소 선택`|
|`class 선택자`|`$('.logo'): style이 logo인 요소`|
|`자식 선택자`|`$('#gnb>ul>li'): html요소에 id가 gnb인 요소 자식 ul 자식 li`|
|하위 선택자|$('#gnb ul'): html요소에 id가 gnb인 요소의 모든 ul요소 선택|
|종속 선택자|$('div.util'): html div요소에 style util 요소 선택|

/studyhtml/jq/jq01/jq01.html
```html
		$('.left, .right, #banner').css('border','4px solid gray'); // 그룹 선택자
	});
</script>
</head>
<body>
	<h2>기본 선택자</h2>
	<hr/>
	
	<header id="header">
	   <div class="logo">로고</div>
	   <div class="util">회원가입</div>
	   
	   <nav id="gnb">
	       <ul>
	           <li>메뉴1
	               <ul>메뉴 1-1</ul>
	           </li>
	       </ul>
	   </nav>
	   
	   <div id="visual">
	       <p>비주얼</p>
	   </div>
	   
	   <div id="content">
	       <div class="left">왼쪽</div>
	       <div class="right">
	           <div class="util">오른쪽</div>
	       </div>
	   </div>
	   
	   <div id="banner">배너</div>
	   <footer id="footer">footer</footer>
	</header>
	
</body>
</html>
```
<hr/>

# `jquery_code_assist`

## tern

jquery 코드 완성 지원 plug-in

[download url] https://dcom20220127.slack.com/archives/C030THU1ANM/p1652146306624289

[jquery API] https://api.jquery.com/


<hr/>

# `속성 선택자`

![9](https://user-images.githubusercontent.com/104181668/167530588-46fa491d-bc71-4378-b5d8-3ea222d40fa7.png)

/studyhtml/WebContent/jq/j02.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- reset 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css">
<!-- 스타일 시트-->
<style type = "text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
		console.log('PCWK document');
		
		$('.list1 > li[class= "list_1"]').css('border','2px solid red');
		$('.list1 > li[class!= "list_1"]').css('border','2px solid orange');
		$('.list2 > li[class*= "list"]').css('border','2px solid green');
		$('.list2 > li[class$= "bg"]').css('background','yellow');
	});
</script>
</head>
<body>
	<h2>속성 선택자</h2>
	<hr/>
	
	<ul class="list1">
	   <li class="list_1">내용1_1</li>
	   <li class="list_2">내용1_2</li>
	   <li class="list_3">내용1_3</li>
	</ul>
	
	<ul class="list2">
       <li class="list_bg">내용2_1</li>
       <li class="list_2">내용2_2</li>
       <li class="list_3">내용2_3</li>
    </ul>
	
	
</body>
</html>
```

<hr/>

# `필터 선택자`

선택자에 `:` 이 붙는 선택자

![10](https://user-images.githubusercontent.com/104181668/167534661-0d9362bd-b472-4fa0-8916-0ec6762e319d.png)

/studyhtml/WebContent/jq/j03.html
```html
  <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- reset 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css">
<!-- 스타일 시트-->
<style type = "text/css">
    table{
        width: 100%;
    }
    
    td{
        border: 1px solid #555;
    }
    
    
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
		console.log('PCWK document');
		$('tr:even').css('background','red');
		$('tr:odd').css('background','orange');
		
		// td 첫번째 요소만 선택
		$('td:first').css('background','yellow');
		
		// td 마지막 요소 선택
		$('td:last').css('background','green');
		
		// index는 0부터 시작
		$('li:eq(0)').css('background','navy');
		
		// h1~h6: header
		$(':header').css('background','blue');
		
		// li:gt(0): 0보다 큰
		$('li:gt(0)').css('background','purple');
		
		// li:lt(0): 0보다 작은
	});
</script>
</head>
<body>
	<h2>필터 선택자:':' 사용하는 선택자</h2>
	<hr/>
	
	<h1>제목1</h1>
	<h1>제목2</h1>
	
	
	<table>
	   <caption>필터 선택자</caption>
	       <tr>
               <td>No1</td>
               <td>No2</td>
               <td>No3</td>
           </tr>
	   <tbody>
	       <tr>
	           <td>1</td>
	           <td>2</td>
	           <td>3</td>
	       </tr>
	       <tr>
               <td>4</td>
               <td>5</td>
               <td>6</td>
           </tr>
           <tr>
               <td>7</td>
               <td>8</td>
               <td>9</td>
           </tr>
           <tr>
               <td>10</td>
               <td>11</td>
               <td>12</td>
           </tr>
	   </tbody>
	</table>
	<ul>
	   <li class="bg">내용1</li>
	   <li class="bg">내용2</li>
	   <li class="bg">내용3</li>
	   <li>내용4</li>
	</ul>
</body>
</html>
```

결과

<img width="719" alt="11" src="https://user-images.githubusercontent.com/104181668/167537694-10e6a433-e34f-4cb0-8b28-59fea84c298a.png">

<hr/>

# `자식 필터`

`child, of-type`

```
- child가 붙은 선택자는 요소가 순차적으로 나열되어 있을 때 사용.	
	ex) nth-child(): $('span:nth_child(2)'): span의 2번째 요소 선택
	
- of-type이 붙은 선택자는 요소가 순차적으로 나열되어 있지 않아도 동일 요소면 선택 가능.
```

<hr/>

# `폼 필터 선택자`

```
폼 요소와 관련된 속성을 선택하는 방법
```

![12](https://user-images.githubusercontent.com/104181668/167538331-d2a6d979-fd5f-4e98-b0ec-3ba4066d442f.png)

/studyhtml/WebContent/jq/j04.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- reset 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css">
<!-- 스타일 시트-->
<style type = "text/css">
    #vis{
        display: none;
    }
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
		console.log('PCWK document');
		// input:text
		$('input:text').css('background','red');
		$('input:password').css('background','orange');
		$('button').css('background','yellow');
		// 인접 선택자 +
		$('input:checked + label').css('background','green');
		$('option:selected').css('background','blue');
		$('textarea:disabled').css('background','pink');
		
		/*
		  가시성 필터:
			  :hidden    ex) div:hidden      div요소중 hidden인 요소
			  :visible   ex) div:visible     div요소중 visible인 요소
		*/
		
		// 내용1 숨기기
		alert($('div:hidden').text());
		
	});
</script>
</head>
<body>
	<h2>폼 필터: 폼에 요소를 필터링 할 수 있음</h2>
	<hr/>
	<div id="vis">내용1</div>
	<div>내용2</div>
	
	<form action="" method="get" name="frm">
	   <div>
	       <input type="text" id="user_id" name="user_id">
	   </div>
	   
	   <div>
	       <input type="password" id="pass" name="pass">
	   </div>
	   
	   <div>
	       <input type="checkbox" id="check01" name="check01" checked><label for="check01">jquery</label>
	   </div>
	   
	   <div>
	       <button id="save">확인</button>
	   </div>
	   
	   <div>
	       <select name="subject" id="subject">
	           <option value="">전체</option>
	           <option value="10">JAVA</option>
	           <option value="20">ORACLE</option>
	           <option value="30">HTML</option>
	           <option value="40">CSS</option>
	           <option value="50">JavaScript</option>
	           <option value="60" selected="selected">JQuery</option>
	       </select>
	   </div>
	   
	   <div>
	       <textarea rows="5" cols="20" name="contents" id="contents" disabled>jQuery</textarea>
	   </div>
	</form>
	
</body>
</html>
```

<hr/>

# jQuery 주요 메서드

```
1. 배열 관련 메서드
   $.each() 메서드
	$.each(배열명,function(index,value){
	
	});	
```

/studyhtml/WebContent/jq/j05.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- reset 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css">
<!-- 스타일 시트-->
<style type = "text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
		console.log('PCWK document');
		
		let city = ['청와대','한강','부산','집','속초'];
		
		$.each(city, function(index, value) {
			console.log(`index: ${index}, value: ${value}`);
		});
		
		// ** 중요함!!
		let subjectInfo = {
				  subject: "html",
				  grade: 1,
				  days: 20
		};
		
		$.each(subjectInfo, function(key,value){
			console.log(`key: ${key}, value: ${value}`);
		});
		
		
	});
</script>
</head>
<body>
	<h2>배열 관련 메서드 : $.each()</h2>
	<hr/>
	
</body>
</html>
```

결과
```
PCWK document
index: 0, value: 청와대
index: 1, value: 한강
index: 2, value: 부산
index: 3, value: 집
index: 4, value: 속초
key: subject, value: html
key: grade, value: 1
key: days, value: 20
```

```
2. $(selector).each()메서드

요소에 개별적으로 접근하여 for문과 같은 반복적인 명령 처리가 가능
```

/studyhtml/WebContent/jq/j06.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- reset 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css">
<!-- 스타일 시트-->
<style type = "text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
// 		console.log('PCWK document');
		
		$('div').each(function(index, element) {
// 			console.log(`index: ${index}, element: ${element}`);
// 		    console.log($(this).attr('class'));
		    // $(this) :  div:eq(0), div:eq(1), div:eq(2)
		});
	});
</script>
</head>
<body>
	<h2></h2>
	<hr/>
	
	<div class="m1">속초</div>
	<div class="m2">서핑</div>
	<div class="m3">낚시</div>
	
</body>
</html>
```

```
3. $.map()메서드
	$.each()와 동일한 기능
	return을 받을 수 있어 배열 copy 가능
	
	$.map(배열명,function(value,index){
	
	});
	
```

/studyhtml/WebContent/jq/j07.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- reset 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css">
<!-- 스타일 시트-->
<style type = "text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
// 		console.log('PCWK document');
		let city = ['한강','부산','집','속초','제주도'];
		
		// copy해서 새로운 배열 생성
		let newCity = $.map(city, function(value, i){
			if(i<2){
				return value;
			}
		});
		
		console.log(`newCity: ${newCity.toString()}`);
	});
</script>
</head>
<body>
	<h2></h2>
	<hr/>
	
</body>
</html>
```
 <hr/>
 
# `요소 관련 메서드`

text(),html() : 취득, 생성, 변경, 가공도 가능

|실행|형식|
|---|:---:|
|취득|$('div').text()|
|생성,변경|$('div').text('생성 및 변경')|
```
콜백 함수
$('div').text(function(index,text){
		div요소의 index는 인덱스
		div요소의 내용
		return 텍스트;
});
```

/studyhtml/WebContent/jq/j08.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<!-- reset 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css">
<!-- 스타일 시트-->
<style type = "text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
// 		console.log('PCWK document');
        // id가 m1인 텍스트 추출
	    console.log('id가 m1 텍스트: ' + $('#m1').text());
        
        // 값 변경
        $('#m1').text('빨리 집에 가고 싶다.');
        
        // m2 아래 있는 div 모두 선택
        $('#m2 > div').text(function(index, t){
        	console.log(`index: ${index}, t: ${t}`);
        	
        	return `index: ${index}, t: ${t}`;
        });
	});
</script>
</head>
<body>
	<h2>text()</h2>
	<hr/>
	<div id="m1">jQuery</div>
	<div id="m2">
	   <div>html</div>
	   <div>css</div>
	   <div>javascript</div>
	</div>
	
</body>
</html>
```

<hr/>

# `html 캐시 컨트롤`
html head에 메타 태그 이용

```html
<meta http-equiv="Expires" content="Mon, 01 Jan 2020 00:00:01 GMT"> 
<!--위의 명시된 날짜 이후가 되면 페이지가 캐싱되지 않는다.(2020년 이후 쭉 ) --> 
<meta http-equiv="Expires" content="-1"> 
<!--캐시된 페이지가 만료되어 삭제되는 시간을 정의하나 특별한 경우가 아니면 -1로 설정--> 
<meta http-equiv="Pragma" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.0)-->  
<meta http-equiv="Cache-Control" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.1)--> 
```

# `jsp 캐시 컨트롤`
jsp 모든 페이지에 include가능, 소스는 한쪽에서만 관리

```jsp
<% response.setHeader("Pragma","no-cache"); 
   response.setDateHeader("Expires",0); 
   response.setHeader("Cache-Control", "no-cache"); 
%>
```
<hr/>

# `html 메서드`

선택한 요소의 html을 취득, 생성, 변경 가능

실행|형식|
|---|:---:|
|취득|$('div').html()|
|생성,변경|$('div').html('생성 및 변경')|

```
콜백 함수
$('div').html(function(index,h){
		div요소의 index는 인덱스
		div요소의 내용
		return html;
});
```

/studyhtml/jq/jq02/jq01.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<meta http-equiv="Expires" content="Mon, 01 Jan 2020 00:00:01 GMT"> 
<!--위의 명시된 날짜 이후가 되면 페이지가 캐싱되지 않는다.(2020년 이후 쭉 ) --> 
<meta http-equiv="Expires" content="-1"> 
<!--캐시된 페이지가 만료되어 삭제되는 시간을 정의하나 특별한 경우가 아니면 -1로 설정--> 
<meta http-equiv="Pragma" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.0)-->  
<meta http-equiv="Cache-Control" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.1)--> 
<!-- reset 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css">
<!-- 스타일 시트-->
<style type = "text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>

</head>
<body>
	<h2>html() 메서드</h2>
	<hr/>
	<div id="m1"><strong>jQuery</strong></div>
	<div id="m2">
	   <div><em>html</em></div>
	   <div><em>css</em></div>
	   <div><em>javascript</em></div>
	</div>
	
	
	<!-- 자바스크립트 코드 -->
	<script type="text/javascript">
	    $(document).ready(function(){
// 	        console.log('PCWK *** document');

            // html 취득
	        console.log($('#m1').html());  // <strong>jQuery</strong>
	        console.log($('#m1').text());  // jQuery
	        
	        // html 생성, 변경
	        console.log($('#m1').html('<h3>html</h3>'));
	        
	        $('#m2 > div').html(function(index,h){
	        	console.log(`index: ${index}, h: ${h}`);
	        	return `<strong>index: ${index}, h:${h}</strong>`;
	        });
	    });
	</script>
</body>
</html>
```
<hr/>

# `클래스 관련 메서드`

addClass()메서드 : 요소에 클래스 추가

|실행|형식|
|---|:---:|
|추가|$('div').addClass('클래스명')|

```
콜백 함수
$('div').addClass(function(index,className()){
		div요소의 index는 인덱스
		div요소의 내용
		return class속성;
});
```

/studyhtml/jq/jq02/jq02.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<meta http-equiv="Expires" content="Mon, 01 Jan 2020 00:00:01 GMT"> 
<!--위의 명시된 날짜 이후가 되면 페이지가 캐싱되지 않는다.(2020년 이후 쭉 ) --> 
<meta http-equiv="Expires" content="-1"> 
<!--캐시된 페이지가 만료되어 삭제되는 시간을 정의하나 특별한 경우가 아니면 -1로 설정--> 
<meta http-equiv="Pragma" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.0)-->  
<meta http-equiv="Cache-Control" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.1)--> 
<!-- reset 스타일 시트 -->
<!-- <link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css"> -->
<!-- 스타일 시트-->
<style type = "text/css">
    #m2 {
        text-align: center;
    }
    
    .box{
        border-bottom: 2px solid #ccc;
        text-align: center;
        padding: 20px;
        margin-bottom: 10px;
    }
    
    .circle0,
    .circle1,
    .circle2
    {
        border: 4px solid #ff7700;
        width: 100px;
        height: 100px;
        line-height: 100px;
        border-radius: 100px;
        display: inline-block;
    }
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
</head>
<body>
	<h2>addClass()</h2>
	<hr/>
	
	<div id="m1">jQuery</div>
	
    <div id="m2">
       <div>html</div>
       <div>css</div>
       <div>javascript</div>
    </div>
	
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
// 		console.log('PCWK *** document');
	    $('#m1').addClass('box');
	    $('#m2 div').addClass(function(i){
	    	console.log(`i: ${i}`);
	    	return 'circle'+i;
	    });
	});
</script>
</body>
</html>
```
<hr/>

# `removeClass()메서드`
요소의 class속성 제거

|실행|형식|
|---|:---:|
|삭제|$('div').removeClass('클래스명')|

```
콜백 함수
$('div').removeClass(function(index,className()){
		div요소의 index는 인덱스
		div요소의 내용
		return class속성;
});
```

/studyhtml/jq/jq02/jq03.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<meta http-equiv="Expires" content="Mon, 01 Jan 2020 00:00:01 GMT"> 
<!--위의 명시된 날짜 이후가 되면 페이지가 캐싱되지 않는다.(2020년 이후 쭉 ) --> 
<meta http-equiv="Expires" content="-1"> 
<!--캐시된 페이지가 만료되어 삭제되는 시간을 정의하나 특별한 경우가 아니면 -1로 설정--> 
<meta http-equiv="Pragma" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.0)-->  
<meta http-equiv="Cache-Control" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.1)--> 
<!-- reset 스타일 시트 -->
<!-- <link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css"> -->
<!-- 스타일 시트-->
<style type = "text/css">
    #m2 {
        text-align: center;
    }
    
    .box{
        border-bottom: 2px solid #ccc;
        text-align: center;
        padding: 20px;
        margin-bottom: 10px;
    }
    
    .circle0,
    .circle1,
    .circle2
    {
        border: 4px solid #ff7700;
        width: 100px;
        height: 100px;
        line-height: 100px;
        border-radius: 100px;
        display: inline-block;
    }
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
</head>
<body>
	<h2>addClass()</h2>
	<hr/>
	
	<div id="m1" class="box">jQuery</div>
	
    <div id="m2">
       <div class="circle0">html</div>
       <div class="circle0">css</div>
       <div class="circle0">javascript</div>
    </div>
	
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
// 		console.log('PCWK *** document');
        $('#m1').removeClass('box');
    
	    $('#m2 div').removeClass(function(i){
	    	console.log(`i: ${i}`);
	    	return 'circle0';
	    });
	});
</script>
</body>
</html>
```
<hr/>

# `toggleClass() 메서드` 
ex) 메뉴 펼침 닫음
요소의 class속성이 없으면 addClass()가 적용, class속성이 있으면 removeClass()가 적용

|실행|형식|
|---|:---:|
|추가,제거|$('div').toggleClass('클래스명')|

# `hasClass()메서드`
if문의 조건식에 사용, 선택한 요소에 클래스가 있으면 true, 없으면 false
```
ex)
	if($('#box').hasClass('m')){
		
	}
	else{
	
	}
	
	<div id="box" class="m">내용</div>
```
<hr/>

# `속성관령 메서드`
attr()메서드
선택한 요소의 attribute(속성)을 선택, 생성, 변경할 수 있다.

|실행|형식|
|:---:|:---:|
|취득|$('a').attr('href')|
|생성,변경|$('a').attr('href','http://daum.net').attr('target','_blank');|

```
콜백함수
	$('a').attr('href',function(index,h){
		// h: href의 속성
		return attribute(속성);
	}
```

/studyhtml/jq/jq02/jq04.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<meta http-equiv="Expires" content="Mon, 01 Jan 2020 00:00:01 GMT"> 
<!--위의 명시된 날짜 이후가 되면 페이지가 캐싱되지 않는다.(2020년 이후 쭉 ) --> 
<meta http-equiv="Expires" content="-1"> 
<!--캐시된 페이지가 만료되어 삭제되는 시간을 정의하나 특별한 경우가 아니면 -1로 설정--> 
<meta http-equiv="Pragma" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.0)-->  
<meta http-equiv="Cache-Control" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.1)--> 
<!-- reset 스타일 시트 -->
<!-- <link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css"> -->
<!-- 스타일 시트-->
<style type = "text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
</head>
<body>
	<h2>attr()</h2>
	<hr/>
	<div id="site">
	   <!-- target: _blank(새창) -->
	   <a href="https://cafe.daum.net/pcwk" target="_blank">다음 카페</a>
	   <a href="https://www.naver.com" target="_blank">네이버</a>
	   <a href="https://www.nate.com" target="_blank">네이트</a>
	</div>
	
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
// 		console.log('PCWK *** document');
	    console.log($('#site > a:eq(0)').attr('href'));    // https://cafe.daum.net/pcwk
	    
	    // https://m.naver.com/ 변경
	    console.log($('#site > a:eq(1)').attr('href','https://m.naver.com/'));
	    
	    // callback
	    
	    $('#site > a').attr('title',function(i,value){
	    	console.log(`i: ${i}, value: ${value}`);
	    	return '비둘기';
	    });
	});
</script>
</body>
</html>
```
<hr/>

# `prop() 메서드`
자바스크립트의 property에 관련된 메서드
prop()메서드는 요소의 속성을 true, false로 제어

/studyhtml/jq/jq02/jq05.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<meta http-equiv="Expires" content="Mon, 01 Jan 2020 00:00:01 GMT"> 
<!--위의 명시된 날짜 이후가 되면 페이지가 캐싱되지 않는다.(2020년 이후 쭉 ) --> 
<meta http-equiv="Expires" content="-1"> 
<!--캐시된 페이지가 만료되어 삭제되는 시간을 정의하나 특별한 경우가 아니면 -1로 설정--> 
<meta http-equiv="Pragma" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.0)-->  
<meta http-equiv="Cache-Control" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.1)--> 
<!-- reset 스타일 시트 -->
<!-- <link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css"> -->
<!-- 스타일 시트-->
<style type = "text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
</head>
<body>
	<h2>prop() 메서드</h2>
	<hr/>
	<input type="checkbox" id="html" name="html"><label for="html">html</label>
	<input type="checkbox" id="css" name="csss"><label for="css">css</label>
	
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
// 		console.log('PCWK *** document');
	    console.log($('input:checkbox').eq(0).attr('checked'));
	    console.log($('input:checkbox').eq(0).prop('checked'));
	    
	    $('input:checkbox').eq(0).attr('checked','checked');
	    $('input:checkbox').eq(1).prop('checked','true');
	    // = $('html')
	});
</script>
</body>
</html>
```
<hr/>

# `스타일 관련 메서드`
css()

실행|형식|
|---|:---:|
|취득|$('a').css('width')|
|생성,변경|$('a').css('background','red').css('padding','10px');|

```
콜백 함수
$('a').css('width',function(index,w){
		return css속성;
});
```

/studyhtml/jq/jq02/jq07.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<meta http-equiv="Expires" content="Mon, 01 Jan 2020 00:00:01 GMT"> 
<!--위의 명시된 날짜 이후가 되면 페이지가 캐싱되지 않는다.(2020년 이후 쭉 ) --> 
<meta http-equiv="Expires" content="-1"> 
<!--캐시된 페이지가 만료되어 삭제되는 시간을 정의하나 특별한 경우가 아니면 -1로 설정--> 
<meta http-equiv="Pragma" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.0)-->  
<meta http-equiv="Cache-Control" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.1)--> 
<!-- reset 스타일 시트 -->
<!-- <link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css"> -->
<!-- 스타일 시트-->
<style type = "text/css">
    div:nth-child(1) {
	   background: red;
    }
    
    div:nth-child(2) {
        background: green;	
    }
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
</head>
<body>
	<h2>css()</h2>
	<hr/>
	<div>
		<div>내용1</div>
		<div>내용2</div>
		<div>내용3</div>
	</div>
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
		console.log('PCWK *** document');
		$('div:nth-child(1)').css({padding:10, "text-align": "center"});
// 		$('div:nth-child(1)').css('padding','10').css('text-align','center');

// 	    $('div').css('width', function(index){
// 	    	console.log(`index: ${index}, ${index*100+100});
// 	    	return index * 100 + 100;
// 	    });
	});
</script>
</body>
</html>
```

# `jQuery이벤트`
jQuery이벤트는 javascript이벤트와 유사

마우스 이벤트
|이벤트|설명|
|---|:---:|
|click()|마우스 클릭 이벤트|
|dbclick()|마우스 더블 클릭 이벤트|
|mouseenter()|마우스가 포인터 안에 들어 왔을 때|
|mouseleave()|마우스가 포인터 밖을 나갔을 때|

/studyhtml/jq/jq02/jq07.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<meta http-equiv="Expires" content="Mon, 01 Jan 2020 00:00:01 GMT"> 
<!--위의 명시된 날짜 이후가 되면 페이지가 캐싱되지 않는다.(2020년 이후 쭉 ) --> 
<meta http-equiv="Expires" content="-1"> 
<!--캐시된 페이지가 만료되어 삭제되는 시간을 정의하나 특별한 경우가 아니면 -1로 설정--> 
<meta http-equiv="Pragma" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.0)-->  
<meta http-equiv="Cache-Control" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.1)--> 
<!-- reset 스타일 시트 -->
<!-- <link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css"> -->
<!-- 스타일 시트-->
<style type = "text/css">
    .bg{
        padding: 40px;
        margin-bottom: 40px;
        background: #ccc;
    }
    
    .inner{
        padding: 20px;
        background: #999;
    }
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
</head>
<body>
	<h2>마우스 이벤트</h2>
	<hr/>
	
	<div class="wrap1 bg">
	   <div class="inner">마우스 오버</div>
	</div>
	
	<div class="wrap2 bg">
       <div class="inner">마우스 enter</div>
    </div>
    
    <div class="display"></div>
	
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
// 		console.log('PCWK *** document');
        // mouseover()
	    $('.wrap1').mouseover(function(){
// 	    	console.log('wrap1 mouseover');
	        $('.display').append('<strong>마우스오버</strong>');
	    });
        
        // mouseenter()
        $('.wrap2').mouseenter(function(){
        	$('.display').append('<em>mouseenter</em>')
        });
	});
</script>
</body>
</html>
```

<hr/>

# `폼 관련 이벤트`

![13](https://user-images.githubusercontent.com/104181668/167764300-90290652-b8b0-4b3f-b5ae-9c7dbe36cc13.png)

![14](https://user-images.githubusercontent.com/104181668/167764319-d5f71053-95ad-4111-99ce-bd9b80bdadd0.png)

/studyhtml/jq/jq02/jq08.html
```html
 <!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="kewords" content="html, css, javascript, jsp" />
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/studyhtml/favicon.ico">
<meta http-equiv="Expires" content="Mon, 01 Jan 2020 00:00:01 GMT"> 
<!--위의 명시된 날짜 이후가 되면 페이지가 캐싱되지 않는다.(2020년 이후 쭉 ) --> 
<meta http-equiv="Expires" content="-1"> 
<!--캐시된 페이지가 만료되어 삭제되는 시간을 정의하나 특별한 경우가 아니면 -1로 설정--> 
<meta http-equiv="Pragma" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.0)-->  
<meta http-equiv="Cache-Control" content="no-cache"> 
<!--페이지 로드시마다 페이지를 캐싱하지 않는다.(HTTP 1.1)--> 
<!-- reset 스타일 시트 -->
<!-- <link rel="stylesheet" type="text/css" href="/studyhtml/asset/css/reset.css"> -->
<!-- 스타일 시트-->
<style type = "text/css">
    *{
        margin: 5px;
    }
    
    input[type=text].on{
        background: #ff7700;
        color: #ffffff;
    }
    
    p{
        color: #ff0000;
        display: none;
    }
    
    
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="/studyhtml/asset/js/jquery-1.12.4.js"></script>
</head>
<body>
	<div id="m1">
        <input type="text" id="m1Input" name="m1Input" placeholder="값을 입력하세요.">	
	</div>
	
	<div id="m2">
        <input type="text" placeholder="값을 입력하세요."> 
    </div>
	
	<div id="m3">
	    <span>값을 수정한 후 다음 입력 요소로 이동하세요</span>
        <input type="text" placeholder="값을 하세요." value="10"> 
    </div>
	
	<div id="m4">
        <input type="text" placeholder="텍스트를 드래그 하세요."> 
    </div>
    
    <form action="#" class="frm">
        <fieldset>
            <legend>로그인</legend>
            <div>
                <label for="id">아이디</label><input type="text" id="id" name="id" />
            </div>
            <p class="msg1">아이디를 입력하세요!</p>
            <div>
                <label for="pw">비밀번호</label><input type="password" id="pw" name="pw" />
            </div>
            <p class="msg2">비밀번호를 입력하세요!</p>
            <button id="send">전송</button>
        </fieldset>
    </form>
	
<!-- 자바스크립트 코드 -->
<script type="text/javascript">
	$(document).ready(function(){
// 		console.log('PCWK *** document');
		// 이벤트 감지 및 처리
// 		$('#m1Input').focus(function(){
		$('#m1 input').focus(function(){
// 			console.log('#m1 input');
		    $(this).addClass('on');   // class 추가
		}).blur(function(){   
			$(this).removeClass('on');    // class 삭제
		});
		
		$('#m2').focusin(function(){
			$(this).children().addClass('on');
		}).focusout(function(){
			$(this).children().removeClass('on');			
		});
		
		// change(): 선택된 요소의 값이 변경 되었을 때 이벤트가 발생
		$('#m3 input').change(function(){
// 			  console.log('#m3 input change()');
			  let msg = confirm('값을 변경 하시겠습니까?')
			  console.log('msg: '+msg);
			  if(!msg){
				  $(this).val(10);
			  }
		});
		
		// select:
		$('#m4 input').select(function(){
			  let v = $(this).val();
			  let size = v.length;
			  
			  console.log('v:'+v);
			  alert(v+"총 " + size + '문자를 선택하셨습니다.');
		});
		
		$('.frm').submit(function() {
// 			console.log('frm');
            // 아이디
		    if(!$('#id').val()){
// 		        alert('아이디를 입력 하세요.');		    
                $('.msg1').css('display','block');
		        $('#id').focus();
		        return false;
		    }
		    else{
		    	$('.msg1').css('display','none');
		    }
            
		    // 비번
		    if(!$('#pw').val()){
		    	$('.msg2').css('display','block');
		    	$('$pw').focus();
		    	return false;
		    }
		    else{
		    	$('.msg2').css('display','none');
		    }
		});
	});
</script>
</body>
</html>
```

