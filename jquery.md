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
