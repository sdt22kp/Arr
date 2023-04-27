<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	width: 380px;
	margin:auto;
	text-align: center;
}
</style>
<script type="text/javascript">
function changePW(chk){
	if(chk.checked){
		document.getElementById("dspPWChange").style.display="block";
	}else{
		document.getElementById("dspPWChange").style.display="none";
	}
}

function modifyFormSubmit(f){
	if(f.user_pwch.checked){
		if(f.user_pw.value != f.user_pwchk.value){
			alert("비밀번호가 일치하지 않습니다.");
			f.user_pw.value="";
			f.user_pwchk.value="";
			f.user_focus();
			return false;
		}
	}
	f.submit();
}
</script>
</head>
<body>
<section id="userInfoArea">
<form action="userModifyAction.u" method="post" name="modiform">
	<input type="hidden" name="id" id="id" value="${user.id }" >
	<table>
		<tr>
			<td>아이디 : <td><td>${user.id }</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="checkbox" name="user_pwch" id="user_pwch" onclick="changePW(this)">비밀번호변경
			</td>
		</tr>
		<tr>
			<td colspan="2" align="left">
				<div id="dspPWChange" style="display:none">
				<table>
					<tr>
						<td>비밀번호 : </td><td><input type="password" name="user_pass" id="user_pass"></td>
					</tr>
					<tr>
						<td>비밀번호확인 : </td><td><input type="password" name="user_pwch" id="user_pwch"></td>
					</tr>
				</table>
				</div>
			</td>
		</tr>
		<tr>
			<td>이름 : </td><td><input type="text" name="user_name" id="user_name" value="${user.user_name }"></td>
		</tr>
		<tr>
			<td>우편번호 : </td><td><input type="text" name="user_zipcode" id="user_zipcode" value="${user.user_zipcode }"></td>
			<td><input type="button" name="zipSearch" value="주소검색"  id="zipSearch" /></td>
		</tr>
		<tr>
			<td>주소 : </td><td><input type="text" name="user_addr" id="user_addr" value="${user.user_addr }"></td>
		</tr>
		<tr>
			<td>상세주소 : </td><td><input type="text" name="user_addr2" id="user_addr2" value="${user.user_addr2 }"></td>
		</tr>
		<tr>
			<td>전화번호 : </td><td><input type="text" name="user_phone" id="user_phone" value="${user.user_phone }"></td>
		</tr>
		<tr>
		  <td colspan="2">
		    <div class="button-container">
		      <a href="userListAction.u" class="modify-button" onclick="modifyFormSubmit(modiform)">정보수정</a>
		      <a href="userListAction.u" class="list-button">리스트로 돌아가기</a>
		    </div>
		  </td>
		</tr>
	</table>
</form>
</section>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("zipSearch").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
            	document.getElementById("user_zipcode").value = data.zonecode;
                document.getElementById("user_addr").value = data.address; // 주소 넣기
                document.querySelector("input[name=user_addr2]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>
</html>