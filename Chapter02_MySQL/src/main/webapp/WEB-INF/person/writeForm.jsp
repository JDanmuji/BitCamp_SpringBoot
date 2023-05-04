<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#writeForm div {
	color :red;
	font-size: 10px;
	font-style: bold;
}
</style>
</head>
<body>
<h3><a href="/"><img src="../image/applelogo.png" width="50" height="50"/></a>
회원가입</h3>
<form id="writeForm">
	   <table border="2">
        <tr>
            <td>이름 :</td>
            <td><input type="text" id="name" name="name">
            <div id="nameDiv"></div>
            </td>
        </tr>
        <tr>
            <td>나이 :</td>
            <td><input type="text" id="age" name="age" >
            <div id="ageDiv"></div>
            </td>
        </tr>
		<tr>
			<td colspan="2"> 
			
				<!-- 업로드 이미지 보여줌 -->
				<img id="showImg" width="300" height="300">
				
				<img id="camera" src="../image/camera-black.png" alt="카메라">
				<input type="file" name="img[]" multiple="multiple" id="img" style="visibility:hidden;">
			</td>
		</tr>
        <tr >
        	<td colspan="2" align="center">
				<input type="button" value="등록" id="writeBtn">
				<input type="reset" value="취소">
        	</td>
        </tr>
    </table>


</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../js/upload.js"></script>
<script type="text/javascript">




$('#camera').click(function() {
	//강제 이벤트 발생
	$('#img').trigger('click');
});

$('#img').change(function() {
	readURL(this);
	
});

function readURL(input) {
	var reader = new FileReader();
	
	reader.onload = function(e) {
		
		$('#showImg').attr('src', e.target.result); //e.target - 이벤트가 발생하는 요소를 반환
	}
	
	reader.readAsDataURL(input.files[0]);
}

$('#writeBtn').click(function() {

	var formData = new FormData($('#writeForm')[0]);
	
	
	$.ajax({
		type : 'post',		
		url : '/person/write',
		enctype : 'multipart/form-data',
		processData : false,
		contentType : false,
		data : formData,
		
		success : function(data) {
			alert("회원가입완료");
			location.href="/";
			
		},
		error : function() {
		}
		
	});
	
}); 




</script>


</body>
</html>