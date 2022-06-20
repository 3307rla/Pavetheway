<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/loginform.jsp</title>
<style>
/* style.css */
* {
	padding: 0;
	margin: 0;
}

/* body를 가운데 정렬하기 위해 html에 flex를 줌 */
html {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
}

body {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	background: linear-gradient(to left, #505050, #282828);
	font-family: sans-serif;
}
/*하얀 테두리*/
.wrap {
	width: 500px;
	height: 650px;
	margin: 0 auto;
	background-color: #fff;
	border-radius: 5px;
	display: flex;
	justify-content: center;
	align-items: center;
}
/* form 사이 거리*/
h1 {
	margin-bottom: 30px;
}
/* submit을 제외한 나머지 input 태그에 적용 */
.wrap .form input:not(input[type='submit'], input[type='checkbox']) {
	border: 1px solid #d9d9d9;
	width: 400px;
	height: 50px;
	margin: 5px;
	padding-left: 10px;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 18px;
}
/*로그인 효과주기*/
.login {
	width: 400px;
	height: 50px;
	margin: 10px;
	border-radius: 5px;
	border: 0;
	background: linear-gradient(to left, #FF6E6E, #FF4646);
	color: #fff;
	font-weight: bold;
	font-size: 18px;
	cursor: pointer;
}
/*빨간 글씨 효과주기*/
.signupform a {
	color: red;
}
</style>
</head>
<body>
	<div class="wrap">
	    <div>
	        <h1>Login Form</h1>
	        <form action="${pageContext.request.contextPath}/users/login.do" method="post" name="loginform" id="loginform" class="form" onsubmit="return sendit()">
        		<c:choose>
					<c:when test="${ empty param.url }">
						<input type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="url" value="${param.url }"/>
					</c:otherwise>
				</c:choose>
            <p><input type="text" name="id" id="id" placeholder="아이디"></p>
            <p><input type="password" name="pwd" id="pwd" placeholder="비밀번호"></p>
            <button class="login" type="submit">로그인</button>
	        </form>
	        <p class="signupform">계정이 없나요? <a href="${pageContext.request.contextPath }/users/signup_form.do">Sign Up</a></p>
	    </div>
	</div>
</body>
</html>