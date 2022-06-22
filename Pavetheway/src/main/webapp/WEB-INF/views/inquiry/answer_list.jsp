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
        
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
                    		<button class="btn btn-outline-dark"><a href="${pageContext.request.contextPath }/users/loginform.do">Login</a></button>
                    		<button class="btn btn-outline-dark" style="margin-left:3px"><a href="${pageContext.request.contextPath }/users/signup_form.do">SignUp</a></button>
                    	</c:when>
                    	<c:otherwise>
                    		<form class="d-flex">
                        		<button class="btn btn-outline-dark" type="submit">
                            		<i class="bi-cart-fill me-1"></i>
                           				Cart
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
                    <img src="../resources/images/logo1.png" width="220" height="120"/>
                </div>
            </div>
        </header>
        
        <!-- Section-->
        <section class="py-5">
        	<div class="row">
        		<div class="col-2">
        			<div class="b-example-divider"></div>
					  	<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
						    <a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
						      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
						      <span class="fs-5 fw-semibold">MENU</span>
						    </a>
					    <ul class="list-unstyled ps-0">
					      	<li class="mb-1">
						        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
						        	문의 및 답변
						        </button>
					        	<div class="collapse show" id="home-collapse">
							        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							        	<li><a href="${pageContext.request.contextPath }/inquiry/list.do" class="link-dark rounded">문의 게시판</a></li>
							        	<li><a href="${pageContext.request.contextPath }/inquiry/answer_list.do" class="link-dark rounded">Q&A</a></li>
							    	</ul>
					        	</div>
					      	</li>
					      	<li class="mb-1">
						        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
						          Shop
						        </button>
					        	<div class="collapse" id="orders-collapse">
						          	<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							            <li><a href="#" class="link-dark rounded">Clothes</a></li>
							            <li><a href="#" class="link-dark rounded">ACC</a></li>

						          	</ul>
					        	</div>
					      	</li>
					    </ul>
					</div>
        		</div>
			<div class="col-9">
				<div class="container">
					<h2>
						<center>
							<svg xmlns="http://www.w3.org/2000/svg" width="3rem" height="3rem" fill="currentColor" class="bi bi-question-square" viewBox="0 0 16 16">
							  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
							  <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
							</svg>
							Q & A
							<svg xmlns="http://www.w3.org/2000/svg" width="3rem" height="3rem" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
							  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
							  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
							</svg>
						</center>
					</h2>
				
					<br />
					<div class="accordion" id="accordionExample">
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingOne">
					      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
							회원 가입은 어떻게 할 수 있나요?
					      </button>
					    </h2>
					    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>메인 페이지에서 회원 가입 버튼을 누르시고 회원 가입을 진행해주세요.</strong>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					      	고객센터에 문의는 어떻게 할 수 있나요?
					      </button>
					    </h2>
					    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>이메일 문의 및 전화 상담 모두 가능합니다.</strong>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingThree">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					    	상품 배송 진행 상황은 어떻게 확인할 수 있나요?
					      </button>
					    </h2>
					    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>회원 정보 페이지에서 확인하실 수 있습니다.</strong>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFour">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					   		상품 교환 및 반품은 어떻게 진행할 수 있나요?
					      </button>
					    </h2>
					    <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>고객센터로 문의해주시면 상품 교환 및 반품 진행 도와드리겠습니다.</strong>
					      </div>
					    </div>
					  </div>
					  <div class="accordion-item">
					    <h2 class="accordion-header" id="headingFive">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
					    	membership 혜택은 어떻게 확인할 수 있나요?
					      </button>
					    </h2>
					    <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionExample">
					      <div class="accordion-body">
					        <strong>회원 정보 페이지에서 확인하실 수 있습니다.</strong>
					      </div>
					    </div>
					  </div>
					</div>
	        	</div>
	        </div>
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
