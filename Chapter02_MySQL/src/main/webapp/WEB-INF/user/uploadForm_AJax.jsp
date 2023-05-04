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
<form id="uploadForm">
	<table border="1">
		<tr>
			<td>상품명</td>
			<td><input type="text" name="imageName"></td>
		</tr>
		
		<tr>
			<td colspan="2">
				<textarea name="imageContent" rows="15" cols="50"></textarea>
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
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" id="uploadBtn" value="이미지등록">
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

$('#img').change(function(url) {
	readURL(url);
	
});

function readURL(input) {
	var reader = new FileReader();
	
	reader.onload = function(e) {
		
		console.log(e.target.result);
		$('#showImg').attr('src', e.target.result); //e.target - 이벤트가 발생하는 요소를 반환
	}
	
	reader.readAsDataURL(input.file[0]);
}


</script>

</body>
</html>


<!-- 
FileReader 란?
FileReader는 type이 file인 input 태그 또는 API 요청과 같은 인터페이스를 통해 
File 또는 Blob 객체를 편리하게 처리할수있는 방법을 제공하는 객체이며
abort, load, error와 같은 이벤트에서 발생한 프로세스를 처리하는데 주로 사용되며,
File 또는 Blob 객체를 읽어서 result 속성에 저장한다.

FileReader도 비동기로 동작한다.

FileReader.onload()
load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료되었을 때마다 발생한다.
 -->