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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>아이디 찾기</title>
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
	height: 793px;
	font-family: sans-serif;
	font-size: 20px;
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
.form-control {
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
#content{
	height: 62%;
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

	<div id="content"  class=" bg-dark py-5">
		<div class="row justify-content-center m-0">
			<div class="col-lg-5">
				<form action="${pageContext.request.contextPath}/users/find_id.do" method="post" class="form" onsubmit="return sendit()">      		
					<div class="card card-custom">
						<div class="card-header">
							<h1>Find Id</h1>
						</div>
					</div>
							<div class="card-body">
								<div>
									<label>Email</label>
									<input class="w3-input" type="text" id="email" name="email" required>
								</div>
								<div>
									<button type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
									<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
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





