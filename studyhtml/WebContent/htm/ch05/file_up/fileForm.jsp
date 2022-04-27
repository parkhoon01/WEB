<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
    <h2>파일업로드</h2>
    <hr/>
    <form name="fileForm" action="fileUpload.jsp" method="post" enctype="multipart/form-data">
        <table>
	        <tr>
	           <td><label for="user">작성자</label></td>
		       <td width="200px"><input type="text" name="user" id="user" size="20" /></td>
		    </tr>
		    <tr>
               <td><label for="title">제목</label></td>
               <td><input type="text" name="title" id="title" size="20" /></td>
            </tr>
            <tr>
               <td><label for="uploadFile">파일</label></td>
               <td><input type="file" name="uploadFile" id="uploadFile"/></td>  <!-- cos.jar는 multiple속성을 받을 수 없음! -->
            </tr>                                                                <!--  Apache commons lib를 사용하면 됨 -->  
            <tr>
               <td><label for="uploadFile2">파일</label></td>
               <td><input type="file" name="uploadFile2" id="uploadFile2"/></td>
            </tr>
            <tr>
               <td colspan="2"><input type="submit" value="파일전송"></td>
            </tr>
        </table>
    </form>
</body>
</html>