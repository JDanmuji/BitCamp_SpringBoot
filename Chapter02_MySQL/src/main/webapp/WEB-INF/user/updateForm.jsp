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

<h3>
	<a href="/">
		<img src="../image/applelogo.png" width="50" height="50"/>
	</a>회원정보수정
</h3>

<p>
	수정할 아이디 입력 : <input type="text" id="searchId" placeholder="아이디를 입력하세요">
	<input type="button" id="searchIdBtn" value="검색">
</p>

<div id="resultDiv"></div>
<br>
<div id="updateDiv">
	<form id="updateForm">
		   <table board="1">
	        <tr>
	            <td>이름 :</td>
	            <td><input type="text" id="name" name="name">
	            <div id="nameDiv"></div>
	            </td>
	        </tr>
	        <tr>
	            <td>아이디 :</td>
	            <td><input type="text" id="id" name="id" readonly="readonly">
	            </td>
	        </tr>
	        <tr>
	            <td>비밀번호 :</td>
	            <td><input type="text" id="pwd" name="pwd">
	            <div id="pwdDiv"></div>
	            </td>
	        </tr>
	        <tr >
	        	<td colspan="2" align="center">
					<input type="button" value="수정" id="updateBtn">
					<input type="reset" value="취소" id="resetBtn">
	        	</td>
	        </tr>
	    </table>
	</form>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../js/update.js" ></script>

</body>
</html>