<%@page import="com.pcwk.cmn.StringUtil"%>
<%@page import="com.pcwk.board.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.pcwk.cmn.SearchVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!-- JSTL core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/com/common.jsp"%>

<%
	//param
	SearchVO param = (SearchVO) request.getAttribute("searchVO");
	// out.println("param:" + param);
	
	
	// null 처리
	int totalCnt = request.getAttribute("totalCnt")==null? 0 : (Integer)request.getAttribute("totalCnt");
	LOG.debug("totalCnt: " + totalCnt);
	
	
	// 현재 페이지
	int currPageNo = 1;
	
	// 페이지당 보여줄 글수
	int rowPerPage = 10;
	
	// 1 2 3 4 5 6 7 8 9 10
	int bottomCount = 10;
	
	// 호출 URL
	String goPageURL = contPath + "/board/board.do";
	
	// 호출 javaScript
    String scriptName = "doSearchPage";
	
	if(null != param){
		currPageNo = param.getPageNum();
		rowPerPage = param.getPageSize();
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="<%=contPath %>/favicon.ico">

<!--reset 스타일 시트-->
<link rel="stylesheet" type="text/css" href="<%=contPath %>/asset/css/reset.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- jquery -->
<link rel="stylesheet"  type="text/css" href="<%=contPath %>/asset/css/jquery-ui.css">
<!-- 스타일 시트-->
<style type = "text/css">
</style>
<title>Insert title here</title>

<!-- jquery -->
<script type="text/javascript" src="<%=contPath %>/asset/js/jquery-1.12.4.js"></script>
<!-- jQuery Ui -->
<script type="text/javascript" src="<%=contPath %>/asset/js/jquery-ui.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=contPath %>/asset/js/common.js"></script>

<title>Insert title here</title>
</head>

<body>
    <!-- div container -->
    <div class="container">
       <!-- 제목 -->
       <div class="page-header">
           <h2>게시 목록</h2>
       </div>
       <!-- // 제목  ----------------------------------------------------------->
       <!-- 검색 -->
       <div class="row">
           <form class="form-inline col-sm-12 col-md-12 col-lg-12 text-right"
                action="<%=contPath%>/board/board.do" name="boardListFrm" method="get" id="boardListFrm">
           <input type="hidden" name="work_div" id="work_div">
	       <input type="hidden" name="seq" id="seq">             <!-- EL not null : not empty searchVO -->
	       <input type="hidden" name="pageNum" id="pageNum" value='<c:if test="${not empty searchVO}">${searchVO.pageNum}</c:if>' />     
               <div class="form-group">
                    <select name="searchDiv" id="searchDiv">
			           <option value="">전체</option>     <!-- not empty and && -->
			           <option value="10" <c:if test="${not empty searchVO && searchVO.searchDiv == '10' }">selected</c:if> >순번</option>
			           <option value="20" <c:if test="${not empty searchVO && searchVO.searchDiv == '20' }">selected</c:if> >제목</option>
			           <option value="30" <c:if test="${not empty searchVO && searchVO.searchDiv == '30' }">selected</c:if> >내용</option>
			           <option value="40" <c:if test="${not empty searchVO && searchVO.searchDiv == '40' }">selected</c:if> >제목+내용</option>
			        </select>
			        <input type="text" name="searchWord" id="searchWord" class="form-control input-sm" placeholder="검색어" size="15" value='<c:if test="${not empty searchVO}">${searchVO.searchWord}</c:if>' >
                    <select class="form-control input-sm"  name="pageSize" id="pageSize">
                       <option value="10" <c:if test="${not empty searchVO && searchVO.pageSize == 10 }">selected</c:if> >10</option>
			           <option value="20" <c:if test="${not empty searchVO && searchVO.pageSize == 20 }">selected</c:if> >20</option>
			           <option value="50" <c:if test="${not empty searchVO && searchVO.pageSize == 50 }">selected</c:if> >50</option>
			           <option value="100" <c:if test="${not empty searchVO && searchVO.pageSize == 100 }">selected</c:if> >100</option>
			        </select>
                   <input type="button" class="btn btn-primary btn-sm" value="목록" onclick="doRetrieve('1');" />
                   <input type="button" class="btn btn-primary btn-sm" value="등록" id="moveToReg"/>
               </div>
           </form>
       </div>
       <!-- // 검색  ----------------------------------------------------------->
       <!-- table -->
           <table class="table table-striped table-bordered table-hover table-condensed" id="listTable">
               <thead class="bg-primary">
                   <tr>
                       <th class="text-center col-sm-1 col-md-1 col-lg-1">No.</th>
                       <th class="text-center col-sm-6 col-md-6 col-lg-8">제목</th>
                       <th class="text-center col-sm-2 col-md-2 col-lg-1">조회수</th>
                       <th class="text-center col-sm-2 col-md-2 col-lg-1">등록자</th>
                       <th class="text-center col-sm-1 col-md-1 col-lg-1">등록일</th>
                       <th style="display: none;">SEQ</th>
                   </tr>
               </thead>
               <tbody>
                    <c:choose>
			            <c:when test="${list.size() > 0 }"> <!-- data가 있으면 -->
			                <!--forEach -->
			                <c:forEach var="vo" items="${list}">
				                   <tr>
				                       <td class="text-center col-sm-1 col-md-1 col-lg-1"><c:out value="${vo.no }"/></td>
				                       <td class="text-left col-sm-6 col-md-6 col-lg-8"><c:out value="${vo.title }"/></td>
				                       <td class="text-right col-sm-2 col-md-2 col-lg-1"><c:out value="${vo.readCnt }"/></td>
				                       <td class="text-center col-sm-2 col-md-2 col-lg-1"><c:out value="${vo.modId }"/></td>
				                       <td class="text-center col-sm-1 col-md-1 col-lg-1"><c:out value="${vo.modDt }"/></td>
				                       <td style="display: none;"><c:out value="${vo.seq }"/></td>
				                   </tr>
			               </c:forEach>
			               <!--//forEach -->
				           </c:when> 
				            
				           <c:otherwise> <!-- data가 없으면 -->
				                <tr>
				                    <td class="text-center" colspan="99">No data found</td>
				                </tr>
				           </c:otherwise> 
			        </c:choose>    
               </tbody>
           </table>
       <!-- // table  ----------------------------------------------------------->

      
      <!-- paging -->
      <div class="text-center">
        <%=StringUtil.renderPaging(totalCnt, currPageNo, rowPerPage, bottomCount, goPageURL, scriptName) %>
      </div>
      <!-- // paging -->
    </div>
    <!--// div container ------------------------------------------------------>
<script type="text/javascript">


	function doSearchPage(url, num){
		console.log('url: ' + url);
		console.log('num: ' + num);
		
		let frm = document.getElementById("boardListFrm");
        frm.work_div.value = 'doRetrieve';
        frm.pageNum.value = num;
        
        console.log('frm.work_div.value:'+frm.work_div.value);
        console.log('frm.searchDiv.value:'+frm.searchDiv.value);
        console.log('frm.pageSize.value:'+frm.pageSize.value);
        
        frm.action = url;
        //form submit()
        frm.submit();
	}


  // event 감지
  $('#listTable tbody').on('click', 'tr', function(){
	  console.log('#listTable tbody');
	  console.log('$(this)' + $(this));
	  let pTr = $(this);
	  let tdArray = pTr.children();
// 	  let seq = tdArray.eq(5).text();
      let seq = tdArray.last().text();
	  console.log('seq: ' + seq);
	  let frm = document.getElementById('boardListFrm');
	  frm.seq.value = seq; // 게시판 pk
	  frm.work_div.value = 'doSelectOne';
	  
	  console.log('frm.seq.value: ' + frm.seq.value);
	  console.log('frm.work_div.value: ' + frm.work_div.value);
	  
	  // 서버전송
	  frm.submit();
	  
  });
  
  
  
  $('#searchWord').on('keydown',function(event){
// 	 alert(event.type + ":" event.which); 
	    if(13 == event.which){
	    	doRetrieve('1');
	    }
  });
   
  function doRetrieve(num){
    //alert('doRetrieve()');
    //javascript form submit()
    //document.boardListFrm
    let frm = document.getElementById("boardListFrm");
    frm.work_div.value = 'doRetrieve';
    frm.pageNum.value = num;
    console.log('frm.work_div.value:'+frm.work_div.value);
    console.log('frm.searchDiv.value:'+frm.searchDiv.value);
    console.log('frm.pageSize.value:'+frm.pageSize.value);
    console.log('frm.pageNum.value:'+frm.pageNum.value);
    
    //form submit()
    frm.submit();
  }
  
  $('#moveToReg').on('click', function(){
	  console.log('moveToReg');
	  let frm = document.boardListFrm;
	  frm.work_div.value = 'moveToReg';
	  console.log('frm.work_div.value: ' + frm.work_div.value);
	  frm.submit();
  });
</script>

</body>
</html>