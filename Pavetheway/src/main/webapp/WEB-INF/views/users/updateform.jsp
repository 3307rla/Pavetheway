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
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
body {
	height: 100px;
	font-family: sans-serif;
}
.card-body{
	background-color: white;
}
.card-custom{
	border: none;
	background-color: white;
}
.card-header {
	background-color: white;
	border-bottom: none;
}
.btnPostCode {
    width: 160px;
	height: 40px;
	margin: 10px;
	border-radius: 5px;
	border: 0;
	background: linear-gradient(to left, #28288C, #2828CD);
	color: #fff;
	font-weight: bold;
	font-size: 10px;
	cursor: pointer;
}
.update {
	width: 300px;
	height: 50px;
	margin: 5px;
	padding-left: 0px;
	border-radius: 5px;
	border: 0;
	background: linear-gradient(to left, #FF6E6E, #FF4646);
	color: #fff;
	font-weight: bold;
	font-size: 18px;
	cursor: pointer;
	font-family: sans-serif; 
	align-items: center;
}

h1 {
	text-align: center;
	margin: 15px;
	padding: 15px;
	text-weight : bolder;
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

	<div class=" bg-dark py-5">
		<div class="row justify-content-center m-0">
			<div class="col-lg-7">
				<form action="${pageContext.request.contextPath}/users/update.do" method="post">
					<div class="card card-custom">
						<div class="card-header">
							<h1>Update Info</h1>
						</div>
					</div>
						<div class="card-body">
							<div class="col mb-2">
								<label class="control-label" for="id">아이디</label>
								<input class="form-control" type="text" id="id" value="${id }" disabled/>
							<div class="col mb-2">
								<label class="control-label" for="email">이메일</label>
								<input class="form-control" type="text" name="email" id="email" value="${dto.email }"/>
							</div>
					    	<div class="row">
					    		<label class="control-label" for="addr">주소</label> 
								<div class="col mb-2">
									<input type="text" class="form-control" id="postcode" name="postcode" value="${dto.postcode }" disabled>	
								</div>
								<div class="col mb-2">
									<button type="button" class="btn btn-primary w-100" id="btnPostCode" >우편번호 찾기</button>
								</div>
							</div>
							<div class="row">
								<div class="col mb-2">
									<input type="text" class="form-control" id="roadAddr" name="roadAddr" value="${dto.roadAddr }" disabled>
								</div>
							</div>
							<div class="row">
								<div class="col mb-2">
									<input type="text" class="form-control" id="detailAddr" name="detailAddr" value="${dto.detailAddr }">
								</div>
								<div class="col mb-2">
									<input type="text" class="form-control" id="extraAddr" name="extraAddr" value="${dto.extraAddr }" disabled>
								</div>
							</div>
							<div class="d-flex justify-content-center">
								<button class="update" type="submit">update</button>
							</div>					    
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	// 다음 우편번호 api
	$("#btnPostCode").on("click",function() {
		new daum.Postcode({
			oncomplete : function(data) {
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				if (data.bname !== ''
						&& /[동|로|가]$/g
								.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다
				if (data.buildingName !== ''
						&& data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName
							: data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' ('
							+ extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("#postcode").val(data.zonecode);
				$("#roadAddr").val(roadAddr);

				// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				if (roadAddr !== '') {
					$("#extraAddr").val(
							extraRoadAddr);
				} else {
					$("#extraAddr").val("");
				}
			}
		}).open();
	})
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





