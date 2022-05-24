<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/com/common.jsp" %>
<!-- JSTL core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    LOG.debug("contPath:" + contPath);
%>
<!--Html comment-->
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="<%=contPath %>/favicon.ico">
<!--reset 스타일 시트 -->
<link rel="stylesheet" type="text/css" href="<%=contPath %>/asset/css/reset.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet"  type="text/css" href="<%=contPath %>/asset/css/jquery-ui.css">
<!--스타일 시트 -->
<style type="text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="<%=contPath %>/asset/js/jquery-1.12.4.js"></script>
<!-- jQuery UI -->
<script type="text/javascript" src="<%=contPath %>/asset/js/jquery-ui.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=contPath %>/asset/js/common.js"></script>
</head>
<body>
    <!-- div container -->
    <div class="container">
        <!-- 제목 -->
       <div class="page-header">
           <h2>게시 등록</h2>
       </div>
       <!-- // 제목  ----------------------------------------------------------->
       <!-- 버튼 -->
       <div class="row text-right">
           <label class="col-sm-3 col-md-2 col-lg-2"></label>
           <div class="col-sm-12 col-md-10 col-md-10">
               <input type="button" class="btn btn-primary btn-sm" value="목록" onclick="goList();" />
               <input type="button" class="btn btn-primary btn-sm" value="등록" onclick="doSave();" />
           </div>
       </div>
       <!-- // 버튼 ------------------------------------------------------------>
       
       <!-- form -->
		<form action="<%=contPath %>/board/board.do" name="boardFrm" id="boardFrm" class="form-horizontal">
		   <input type="hidden" name="work_div" id="work_div" value="doSave"><br/>
		   <div class="form-group">
                <label for="seq" class="col-sm-3 col-md-2 col-lg-2">순번</label>
                <div class="col-sm-9 col-md-10 col-md-10">
                  <input type="text" maxlength="100" name="seq" id="seq" placeholder="순번" class="form-control"/>
               </div>
           </div>
           <div class="form-group">
                <label for="title" class="col-sm-3 col-md-2 col-lg-2">제목</label>
                <div class="col-sm-9 col-md-10 col-md-10">
                  <input type="text" maxlength="200" name="title" id="title" placeholder="제목" class="form-control"/>
               </div>
           </div>
           <div class="form-group">
                <label for="reg_id" class="col-sm-3 col-md-2 col-lg-2">등록자</label>
                <div class="col-sm-9 col-md-10 col-md-10">
                  <input type="text" maxlength="20" name="reg_id" id="reg_id" placeholder="등록자" class="form-control"/>
               </div>
           </div>
           <!-- 내용 -->
           <div class="form-group">
                <label for="contents" class="col-sm-3 col-md-2 col-lg-2">내용</label>
                <div class="col-sm-9 col-md-10 col-md-10">
                    <textarea rows="5" cols="50" name="contents" id="contents" class="form-control"></textarea>
               </div>
           </div>
           <!-- // 내용 -------------------------------------------------------->
		</form>
		<!-- // form ----------------------------------------------------------->
	</div>
    <!--// div container ------------------------------------------------------>
<script type="text/javascript">
	function goList(){
	    const listURL = "/studyhtml/board/board.do?work_div=doRetrieve";
	    window.location.href = listURL;
	}
	
	$(document).ready(function(){
		console.log('document ready');
	});
	
	function moveToList(){
		
	}
    
    $(document).ready(function() {
        console.log(`document ready`);
    });
    
    function doSave(){
        console.log(`doSave()`);
        // document.boardFrm
        let frm = document.getElementById("boardFrm");
        
        // SEQ
        let seq = $('#seq').val();
        console.log('seq: ' + seq);
        
        if(null == seq || seq.trim().length==0){
            $('#seq').focus();
            alert('순번을 입력하세요.');
            return false;
        }
        
        // 제목
        let title = $('#title').val();      // jquery
//         let title = frm.title.value;    // 자바스크립트
        console.log('title: ' + title);
        
        
        if(null == title || title.trim().length==0){
        	$('#title').focus();
        	alert('제목을 입력하세요.');
        	return false;
        }
        
        // reg_id
        let regId = $('#reg_id').val();
        console.log('reg_id: ' + reg_id);
        
        if(null == regId || regId.trim().length == 0){
        	$('#reg_id').focus();
        	alert('등록자를 입력하세요.');
        	return;
        }
        
        // 내용
        let contents = $('#contents').val();
        console.log('contents: ' + contents);
        
        if(null == contents || contents.trim().length == 0){
            $('#contents').focus();
            alert('내용을 입력하세요.');
            return;
        }
        
        // confirm
        if(false == confirm('저장 하시겠습니까?'))return;
        
        // ajax
        
        $.ajax({
            type: "POST",
            url:"/studyhtml/board/board.do",
            asyn:"true",
            dataType:"html",
            data:{
            	//  변수 : 값
                work_div : $('#work_div').val(),
                seq : seq,
                title : title,
                reg_id : regId,
                contents : contents
            },
            success:function(data){//통신 성공
//                 console.log("success data:"+data);
                // 문자열 -> json 변환
                const jsonObj = JSON.parse(data);
                console.log("jasonObj: " + jsonObj.messageId);
                console.log("msgContents: " + jsonObj.msgContents);
                const listURLTest = "<%=contPath%>/board/board_list.jsp";
                console.log('listURLTest: ' + listURLTest);
                
                if(null != jsonObj && jsonObj.messageId == '1'){    // 등록 성공
                	alert(jsonObj.msgContents);
                	// board_list.jsp 이동
                	const listURL = "/studyhtml/board/board.do?work_div=doRetrieve";
                	window.location.href = listURL;
                }
                else{   // 등록 실패
                	alert(jsonObj.msgContents);
                }
            },
            error:function(data){//실패시 처리
                console.log("error:"+data);
            }
        });
        
        
    }
</script>
</body>
</html>