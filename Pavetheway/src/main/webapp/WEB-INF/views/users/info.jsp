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

.card-custom{
	border: none;
}
.card-header {
	background-color: white;
	border-bottom: none;
		margin: 15px;
}
h1 {
	text-align: center;
	margin: 15px;
	padding: 15px;
	text-weight : bolder;
}
/*글씨 효과주기*/
.delete, .change {
	color: red;
}
/*글씨 효과주기*/
.update {
	color: blue;
}
.info {
	border: 1px solid #d9d9d9;
	width:580px; 
	height: 300px;
	padding-left: 5px;
	border-radius: 5px;
	box-sizing: border-box;
	font-size: 18px;
	border: none;	
}
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

	<div class="bg-dark py-5">
		<div class="row justify-content-center m-0">
			<div class="col-lg-7">
				<div class="card card-custom">
						<div class="card-header">
							<h1>My Page</h1>
						</div>
							<div class="card-body">
								<table class="info">
									<tr>
										<th>아이디</th>
										<td>${id }</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><a class="change" href="${pageContext.request.contextPath}/users/pwd_updateform.do">Change Password</a></td>
									</tr>				
									<tr>
										<th>이메일</th>
										<td>${dto.email }</td>
									</tr>	
									<tr>
										<th>주소</th>
										<td>${dto.postcode }, ${dto.roadAddr } ${dto.detailAddr } ${dto.extraAddr }</td>
									</tr>	
									<tr>
										<th>가입일</th>
										<td>${dto.regdate }</td>
									</tr>
								</table>
								<a class="update" href="${pageContext.request.contextPath}/users/updateform.do">개인정보 수정</a>
								<a class="delete" href="${pageContext.request.contextPath}/users/delete.do">탈퇴</a>
						</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Pave the
				way 2022</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>
</html>





