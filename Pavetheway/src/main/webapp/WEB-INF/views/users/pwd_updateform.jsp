<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/pwd_updateform.jsp</title>
<style>
/* style.css */
* { padding: 0; margin: 0; }
a { text-decoration: none; color: #000; }
/* body를 가운데 정렬하기 위해 html에 flex를 줌 */
html { width: 100%; height: 100%; display: flex; 
    align-items: center; }
body { width: 100%; margin: 0 auto; text-align: center;
    background: linear-gradient(to left, #505050, #282828);
    font-family: sans-serif; }
/*하얀 테두리*/
.wrap { width: 500px; height: 650px; margin: 0 auto;
    background-color: #fff; border-radius: 5px; display: flex; 
    justify-content: center; align-items: center; }
/* form 하고 밑 사이 여백*/
h1 { margin-bottom: 30px; }
/* submit을 제외한 나머지 input 태그에 적용 */
.wrap .form input:not(input[type='submit'], input[type='checkbox']) {
    border: 1px solid #d9d9d9; width: 400px; height: 50px;
    margin: 5px; padding-left: 10px; border-radius: 5px;
    box-sizing: border-box; font-size: 18px; }
/* change 효과 주기*/    
.change { width: 400px; height: 50px;
    margin: 10px; border-radius: 5px; border: 0;
    background: linear-gradient(to left, #FF6E6E, #FF4646);
    color: #fff; font-weight: bold; font-size: 18px;
    cursor: pointer; }   
/*빨간 글씨 효과주기*/    
.join  { color: red; }    
</style>
</head>
<body>
	<div class="wrap">
		<div>
		<h1>Change Password Form</h1>
				<form action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id="#myForm" class="form" onsubmit="return sendit()">	
					<p><input type="password" name="pwd" id="pwd" placeholder="기존 비밀번호"></p>
		            <p><input type="password" name="newPwd" id="newPwd" placeholder="새 비밀번호"></p>
		            <p><input type="password" name="newPwd2" id="newPwd2" placeholder="새 비밀번호 확인"></p>
					<button class="change" type="submit">Change Password</button>
					<p>로그인 하러 가기 <a class="join" href="${pageContext.request.contextPath}/users/loginform.do">Login</a></p>
				</form>
		</div>
	</div>
<script>
	//폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
	document.querySelector("#myForm").addEventListener("submit", function(e){
		let pwd1=document.querySelector("#newPwd").value;
		let pwd2=document.querySelector("#newPwd2").value;
		//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
		if(pwd1 != pwd2){
			alert("비밀번호를 확인 하세요!");
			e.preventDefault();//폼 전송 막기 
		}
	});
</script>
</body>
</html>