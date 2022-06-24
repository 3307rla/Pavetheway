<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>users/signup_form.jsp</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<style>
body {
	height: 100px;
	font-family: sans-serif;
	text-pont: 20px;
}
.card-body{
	background-color: white;
}
.card-custom{
	border: none;
	background-color: white;
}
#addr, #id, #email {
	background-color: white;
}
.card-header {
	background-color: white;
	border-bottom: none;
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
	text-decoration:none;
}
.update{
	color: blue;
	text-decoration:none;
}
</style>
</head>
<body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#!">Pave the way!</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/home.do">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/shop/list.do?category=outer">Shop</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/inquiry/answer_list.do">Q&A</a></li>

                </ul>
                <c:choose>
                	<c:when test="${ empty sessionScope.id}">
                		<button class="btn btn-outline-dark"><a href="${pageContext.request.contextPath }/users/loginform.do">Login</a></button>
                		<button class="btn btn-outline-dark" style="margin-left:3px"><a href="${pageContext.request.contextPath }/users/signup_form.do">SignUp</a></button>
                	</c:when>
                	<c:otherwise>
                		<form class="d-flex">
                    		<button class="btn btn-outline-dark" type="submit">
                        		<i class="bi-cart-fill me-1"></i>
                       				<a href="${pageContext.request.contextPath }/cart/list.do">Cart</a>
                    		</button>
                		</form>
                		<button class="btn btn-outline-dark"><a href="${pageContext.request.contextPath }/users/info.do">MyInfo</a></button>
                		<button class="btn btn-outline-dark"><a href="${pageContext.request.contextPath }/users/logout.do">Logout</a></button>
                	</c:otherwise>
                </c:choose>
                
            </div>
        </div>
    </nav>
    
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<img src="../resources/images/logo1.png" width="220" height="80" />
			</div>
		</div>
	</header>

	<div class=" bg-dark py-5">
		<div class="row justify-content-center m-0">
			<div class="col-lg-5">
				<form action="${pageContext.request.contextPath}/users/update.do"  method="post" id="myForm" class="form" onsubmit="return sendit()">
					<div class="card card-custom">
						<div class="card-header">
							<h1>My Page</h1>
						</div>
					</div>
						<div class="card-body">
							<div class="col mb-2">
								<label class="control-label" for="id">아이디</label>
								<input class="form-control" type="text" id="id" value="${id }" readonly/>
							</div>
							<div class="col mb-2">
								<label class="control-label" for="fwd">비밀번호</label>
								<a class="change" href="${pageContext.request.contextPath}/users/pwd_updateform.do">Change Password</a>
							</div>	
							<div class="col mb-2">
								<label class="control-label" for="email">이메일</label> 
								<input class="form-control" type="text" name="email" id="email" value="${dto.email }"readonly/>
							</div>
					    	<div class="row">
					    		<label class="control-label" for="addr">주소</label> 
								<div class="col mb-2">
									<input type="text" class="form-control" id="addr" name="addr" value="${dto.postcode }, ${dto.roadAddr } ${dto.detailAddr } ${dto.extraAddr }" readonly>	
								</div>
							</div>
							<div class="row">
							<div class="col d-flex justify-content-end">
								<a class="update" href="${pageContext.request.contextPath}/users/updateform.do">개인정보 수정</a>
							</div>
							<div class="col d-flex justify-content-start">	
								<a class="delete" href="${pageContext.request.contextPath}/users/delete.do">탈퇴</a>			    
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

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





