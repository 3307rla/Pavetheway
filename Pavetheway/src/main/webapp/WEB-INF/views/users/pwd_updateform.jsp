<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>users/loginform.jsp</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />   
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
body {
	height: 100px;
	font-family: sans-serif;
	text-align: center;
}
.card-body{
	background-color: white;
}
.card-custom{
	border: none;
}
.card-header {
	background-color: white;
	border-bottom: none;
}
.change {
	width: 200px;
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
.input {
	border: 1px solid #d9d9d9;
	width: 400px;
	height: 50px;
	margin: 5px;
	padding-left: 10px;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 18px;
}
h1 {
	text-align: center;
	margin: 15px;
	padding: 15px;
	text-weight : bolder;
}
.join { color: red;}
</style>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="#!">Pave the way!</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="${pageContext.request.contextPath }/home.do">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#!">Shop</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath }/inquiry/answer_list.do">Q&A</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<img src="../resources/images/logo1.png" width="220" height="120" />
			</div>
		</div>
	</header>

	<div class=" bg-dark py-5">
		<div class="row justify-content-center m-0">
			<div class="col-lg-7">
				<form action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id="myForm">
					<div class="card card-custom">
						<div class="card-header">
							<h1>Change Password</h1>
						</div>
					</div>
							<div class="card-body">
							<div>
								<input class="input" type="password" name="pwd" id="pwd" placeholder="기존 비밀번호">
							<div>
								<input  class="input" type="password" name="newPwd" id="newPwd" placeholder="새 비밀번호">
							</div>
							<div>
								<input  class="input" type="password" name="newPwd2" id="newPwd2" placeholder="새 비밀번호 확인">
							</div>
							<div>
								<button class="change" type="submit">Change Password</button>
							</div>
							<div>로그인 하러 가기 <a class="join" href="${pageContext.request.contextPath}/users/loginform.do">Login</a></div>					    
						</div>
					</div>
				</form>
			</div>
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

	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Pave the way 2022</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>
</html>





