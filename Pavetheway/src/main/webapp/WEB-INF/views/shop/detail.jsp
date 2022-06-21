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
        <title>Pave the way</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
		<%-- bootstrap --%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
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
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/shop/list.do">Shop</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/inquiry/answer_list.do">Q&A</a></li>
                    </ul>
                    <c:choose>
                    	<c:when test="${ empty sessionScope.id}">
                    		<button class="btn btn-outline-dark" href="${pageContext.request.contextPath}/users/loginform.do">Login</button>
                    		<button class="btn btn-outline-dark" style="margin-left:3px" href="${pageContext.request.contextPath}/users/signup_form.do">SignUp</button>
                    	</c:when>
                    	<c:otherwise>
                    		<form class="d-flex">
                        		<button class="btn btn-outline-dark" type="submit">
                            		<i class="bi-cart-fill me-1"></i>
                           				Cart
                        		</button>
                    		</form>
                    		<button class="btn btn-outline-dark">MyInfo</button>
                    		<button class="btn btn-outline-dark" href="${pageContext.request.contextPath}/users/logout.do">Logout</button>
                    	</c:otherwise>
                    </c:choose>
                    
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <img src="resources/images/logo1.png" width="220" height="120"/>
                </div>
            </div>
        </header>
		<!-- Section-->
        <section class="py-5">
        	<div class="row">
        		<div class="col-2">
        			<div class="b-example-divider"></div>
					  	<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
						    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
						      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
						      <span class="fs-5 fw-semibold">Menu</span>
						    </a>
					    <ul class="list-unstyled ps-0">
					      	<li class="mb-1">
						        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true"
						         href="${pageContext.request.contextPath}/shop/list.do">
						         Shop
						        </button>
					        	<div class="collapse show" id="home-collapse">
							        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							        	<li><a href="${pageContext.request.contextPath}/shop/outer.do" class="link-dark rounded">Outer</a></li>
							            <li><a href="${pageContext.request.contextPath}/shop/top.do" class="link-dark rounded">Top</a></li>
							            <li><a href="${pageContext.request.contextPath}/shop/bottom.do" class="link-dark rounded">Bottom</a></li>
							            <li><a href="${pageContext.request.contextPath}/shop/etc.do" class="link-dark rounded">Etc</a></li>
							    	</ul>
					        	</div>
					      	</li>
					    </ul>
					</div>
        		</div>
		<div class="container">
		   <div class="card mb-3">
		      <img class="card-img-top" src="${pageContext.request.contextPath}${dto.imagePath}"/>
		      <div class="card-body">
		         <p class="card-text">by <strong>${dto.name}</strong></p>
		         <p><small>${dto.price}</small></p>
		         <p class="card-text">${dto.infoImagePath}</p>
		      </div>
		   </div>
		   <div>
    		   <a href="${pageContext.request.contextPath}/shop/buy.do">주문하기</a><br/>
 	           <a href="${pageContext.request.contextPath}/cart/cart.do">장바구니</a><br/>
		   </div>
		   <nav>
		      <ul class="pagination justify-content-center">
		         <c:choose>
		         	<c:when test="${dto.prevNum ne 0 }">
		         		<li class="page-item mr-3">
		               		<a class="page-link" href="${pageContext.request.contextPath}/shop/detail.do?num=${dto.prevNum}">&larr; Prev</a>
		            	</li>
		         	</c:when>
		         	<c:otherwise>
		         		<li class="page-item disabled mr-3">
		               		<a class="page-link" href="javascript:">Prev</a>
		            	</li>
		         	</c:otherwise>
		         </c:choose>
		         <c:choose>
		         	<c:when test="${dto.nextNum ne 0 }">
		         		<li class="page-item">
		               		<a class="page-link" href="${pageContext.request.contextPath}/shop/detail.do?num=${dto.nextNum}">Next &rarr;</a>
		            	</li>
		         	</c:when>
		         	<c:otherwise>
		         		<li class="page-item disabled">
		               		<a class="page-link" href="javascript:">Next</a>
		            	</li>
		         	</c:otherwise>
		         </c:choose>         
		      </ul>
		   </nav>      
		</div>
		<%-- <script>
		   // card 이미지의 부모 요소를 선택해서 imgLiquid  동작(jquery plugin 동작) 하기 
		   $(".img-wrapper").imgLiquid();
		</script> --%>
		</section>
        
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
