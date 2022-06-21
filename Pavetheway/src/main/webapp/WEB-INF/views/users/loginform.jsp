<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
body{
	height : 800px;
	font-family: sans-serif;
	text-align: center;
	}
.body-content{
	height : 70%;
	text-align: center;
	align-items: center;
	position:relative;
	top: 100px; 
	}	
.body-content .form input:not(input[type='submit']) {
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
	margin-bottom: 30px;
	padding: 15px;	
	}
.login {
	width: 300px;
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
.signupform a { color: red;}
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
                   <li class="nav-item"><a class="nav-link" href="#!">Shop</a></li>
                   <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/inquiry/answer_list.do">Q&A</a></li>
               </ul>
               <c:choose>
               	<c:when test="${ empty sessionScope.id}">
               		<button class="btn btn-outline-dark">Login</button>
               		<button class="btn btn-outline-dark" style="margin-left:3px">signUp</button>
               	</c:when>
               	<c:otherwise>
               		<form class="d-flex">
                   		<button class="btn btn-outline-dark" type="submit">
                       		<i class="bi-cart-fill me-1"></i>
                      				Cart
                   		</button>
               		</form>
               		<button class="btn btn-outline-dark">MyInfo</button>
               		<button class="btn btn-outline-dark">Logout</button>
               	</c:otherwise>
               </c:choose>                   
           </div>
       </div>
   </nav>
   <!-- Header-->
   <header class="bg-dark py-5">
       <div class="container px-4 px-lg-5 my-5">
           <div class="text-center text-white">
               <img src="../resources/images/logo1.png" width="220" height="120"/>
           </div>
       </div>
   </header>

   <div class="body-content">
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

   <!-- Footer-->
   <footer class="py-5 bg-dark">
       <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Pave the way 2022</p></div>
   </footer>
   <!-- Bootstrap core JS-->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->
   <script src="resources/js/scripts.js"></script>
</body>
</html>

