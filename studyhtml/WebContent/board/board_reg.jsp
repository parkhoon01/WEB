<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/com/common.jsp" %>
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
<!-- link rel="stylesheet" type="text/css" href="<%=contPath %>5/asset/css/reset.css" -->
<link rel="stylesheet"  type="text/css" href="<%=contPath %>/asset/css/jquery-ui.css">
<!--스타일 시트 -->
<style type="text/css">
</style>
<title>Insert title here</title>
<!-- jquery -->
<script type="text/javascript" src="<%=contPath %>/asset/js/jquery-1.12.4.js"></script>
<!-- jQuery UI -->
<script type="text/javascript" src="<%=contPath %>/asset/js/jquery-ui.js"></script>

</head>
<body>
	<h2>View  -> Conrtroller call</h2>
	<hr/>
	<div>
	   <input type="button" value="전송" onclick="doSave();"/>
	</div>
	<form action="<%=contPath %>/board/board.do" name="boardFrm" id="boardFrm">
	   <input type="hidden" name="work_div" id="work_div" value="doSave"><br/>
	   SEQ:<input type="text" name="seq" id="seq"><br/>
	   제목:<input type="text" name="title" id="title" maxlength="200"><br/>
	   등록자:<input type="text" name="reg_id" id="reg_id" maxlength="20"><br/>
	   내용:<textarea rows="5" cols="50" name="contents" id="contents"></textarea><br/>
	</form>
<script type="text/javascript">
    
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