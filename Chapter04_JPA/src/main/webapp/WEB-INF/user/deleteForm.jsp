<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보수정</title>
<style>
/* General styles */
body {
  font-family: Arial, sans-serif;
  font-size: 16px;
  line-height: 1.5;
  color: #333;
  background-color: #f0f0f0;
}

h3 {
  margin: 20px 0;
  font-size: 24px;
}

img {
  vertical-align: middle;
}

/* Form styles */
form {
  margin: 20px 0;
  padding: 20px;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

form label {
  display: block;
  margin-bottom: 10px;
  font-weight: bold;
}

form input[type="text"] {

  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

form input[type="text"][readonly] {
  background-color: #f0f0f0;
}

form input[type="button"],
form input[type="reset"] {
  display: inline-block;
  padding: 10px 20px;
  margin-right: 10px;
  font-size: 16px;
  font-weight: bold;
  color: #fff;
  background-color: #333;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

form input[type="button"]:hover,
form input[type="reset"]:hover {
  background-color: #444;
}

form input[type="reset"] {
  background-color: #ccc;
  color: #333;
}

/* Validation styles */
.error {
  color: red;
  font-size: 12px;
}

.success {
  color: green;
  font-size: 12px;
}
</style>
</head>
<body>
	<header>
		<a href="/">
			<img src="../image/logo.png" width="50" height="50" alt="logo">
		</a>
		<h1>회원정보수정</h1>
	</header>
	<main>
		<form id="searchForm">
			<label for="searchId">삭제할 아이디 입력:</label>
			<input type="text" id="searchId" name="searchId">
			<input type="button" id="searchIdBtn" value="검색">
		</form>
		<div id="resultDiv"></div>
		<div id="deleteDiv">
			<form id="deleteForm">
				<table>
					<tr>
						<td><label for="name">이름:</label></td>
						<td>
							<input type="text" id="name" name="name">
							<div id="nameDiv"></div>
						</td>
					</tr>
					<tr>
						<td><label for="id">아이디:</label></td>
						<td><input type="text" id="id" name="id" readonly="readonly"></td>
					</tr>
					<tr>
						<td><label for="pwd">비밀번호:</label></td>
						<td>
							<input type="text" id="pwd" name="pwd">
							<div id="pwdDiv"></div>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="삭제" id="deleteBtn">
							<!-- <input type="reset" value="취소" id="resetBtn"> -->
						</td>
					</tr>
				</table>
			</form>
		</div>
	</main>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="../js/delete.js"></script>
</body>
</html>