<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style type="text/css">
  
  </style>
</head>
<body>
<%--1. 단순 submit--%>
<%--2. ajax --%>
<h3>
    <a href="/">
        <img src="../image/applelogo.png" width="50" height="50"/>
    </a>목록
</h3>

<table id="imageListTable" border="1"  celllspacing = 0 cellpadding = 0 >

    <tr>
        <th width="150">번호</th>
        <th width="150">이미지</th>
        <th width="150">상품명</th>
    </tr>

	
</table>




<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){


        $.ajax({
        	type: 'post',
        	url : '/user/uploadList',
            dataType : "json",
        	success : function(data) {
        		console.log(data);
        	                                                                                                                                
        		$.each(data.list, function(index, items){
        			var $tr = $("<tr>", {});
        			var $td_seq = $("<td>", {align : 'center', text : items.seq	});
        			var $td_img = $("<td>", {align : 'center'});
        			var $img = $("<img>", {src : '../storage/' + items.image1,  width: '30', height:'30'});
        			var $td_imgName = $("<td>", {align : 'center',text : items.imageName});
        			
        			
        			$tr.append($td_seq);
        			$td_img.append($img);
        			$tr.append($td_img);
        			$tr.append($td_imgName);
        			
        			$('#imageListTable').append($tr);
        			
				});
				

        	},
        	error : function(err) {
        		console.log(err);
        	}
        });



});

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