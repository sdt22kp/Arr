<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container{
	text-align: center;
}
.table{
	text-align: center;
}
</style>
</head>
<body>
<div class="containor">
	<div class="table">
		<div class="row">
			<div class="열1">아이디 : </div><div class="열1">${user.id }</div>
			<div class="열1">비밀번호 : </div><div class="열1">${user.user_pass }</div>
			<div class="열1">이름 : </div><div class="열1">${user.user_name }</div>
			<div class="열1">우편번호 : </div><div class="열1">${user.user_zipcode }</div>
			<div class="열1">주소 : </div><div class="열1">${user.user_addr }</div>
			<div class="열1">상세주소 : </div><div class="열1">${user.user_addr2 }</div>
			<div class="열1">전화번호 : </div><div class="열1">${user.user_phone }</div>
			<div class="열1">탈퇴여부 : </div><div class="열1">${user.user_bye }</div>
			
		</div>
	</div>
</div>
</body>
</html>