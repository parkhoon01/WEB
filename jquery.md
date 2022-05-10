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
