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
.join { 
	color: red;
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
                		<button class="btn btn-outline-dark" onclick="location.href='${pageContext.request.contextPath }/users/loginform.do">Login</button>
                		<button class="btn btn-outline-dark" style="margin-left:3px" onclick="location.href='${pageContext.request.contextPath }/users/signup_form.do">SignUp</button>
                	</c:when>
                	<c:otherwise>
                		<form class="d-flex">
                    		<button class="btn btn-outline-dark" type="submit">
                        		<i class="bi-cart-fill me-1"></i>
                       				<a href="${pageContext.request.contextPath }/cart/list.do">Cart</a>
                    		</button>
               		    </form>
                   		<button class="btn btn-outline-dark" onclick="location.href='${pageContext.request.contextPath }/users/info.do'">MyInfo</button>
                   		<button class="btn btn-outline-dark" onclick="location.href='${pageContext.request.contextPath }/users/logout.do'">Logout</button>
                   	</c:otherwise>
                </c:choose>
                
            </div>
        </div>
    </nav>
        
	<!-- Header-->
	<header class="bg-dark py-5">
		<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
				<img src="../resources/images/logo1.png" width="220" height="100" />
			</div>
		</div>
	</header>

	<div class=" bg-dark py-5">
		<div class="row justify-content-center m-0">
			<div class="col-lg-5">
				<form action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id="myForm">
					<div class="card card-custom">
						<div class="card-header">
							<h1>Change Password</h1>
						</div>
					</div>
							<div class="card-body">
							<div class="col mb-2">
								<label class="control-label" for="pwd">기존 비밀번호</label> 
								<input class="form-control" type="password" name="pwd" id="pwd" required/>
							</div>
							<div class="col mb-2">
								<label class="control-label" for="newPwd">새 비밀번호</label> 
								<input class="form-control" type="password" name="newPwd" id="newPwd" required/> 
								<small class="form-text text-muted">6~12자 영문 대 소문자, 숫자, 특수문자를 사용하세요.</small>
								<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
							</div>
							<div class="col mb-2">
								<label class="control-label" for="newPwd2">새 비밀번호 확인</label> 
								<input class="form-control" type="password" name="newPwd2" id="newPwd2" required/>
							</div>
							<div class="d-flex justify-content-center">
								<button class="change" type="submit">Change Password</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	let isNewFwdValid=false;
	
	//비밀 번호를 확인 하는 함수 
	function checkPwd(){
		document.querySelector("#newPwd").classList.remove("is-valid");
		document.querySelector("#newPwd").classList.remove("is-invalid");
		
		const pwd=document.querySelector("#newPwd").value;
		const pwd2=document.querySelector("#newPwd2").value;
		
		// 최소 6글자 최대 12글자 , 하나 이상의 대소문자 및 하나의 숫자, 하나의 특수문자
		const reg_pwd=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,12}$/;
		if(!reg_pwd.test(pwd)){
			isNewFwdValid=false;
			document.querySelector("#newPwd").classList.add("is-invalid");
			return; //함수를 여기서 종료
		}
		
		if(pwd != pwd2){//비밀번호와 비밀번호 확인란이 다르면
			//비밀번호를 잘못 입력한것이다.
			isNewFwdValid=false;
			document.querySelector("#newPwd").classList.add("is-invalid");
		}else{
			isNewFwdValid=true;
			document.querySelector("#newPwd").classList.add("is-valid");
		}
	}
	
	//비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
	document.querySelector("#newPwd").addEventListener("input", checkPwd);
	document.querySelector("#newPwd2").addEventListener("input", checkPwd);
	
	
	//폼에 submit 이벤트가 발생했을때 실행할 함수 등록
	document.querySelector("#myForm").addEventListener("submit", function(e){
		//폼 전체의 유효성 여부 알아내기 
		let isFormValid = isNewFwdValid;
		if(!isFormValid){//폼이 유효하지 않으면
			//폼 전송 막기 
			e.preventDefault();
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





