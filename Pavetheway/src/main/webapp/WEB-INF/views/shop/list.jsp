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
		<%-- bootstrap 읽어오기 --%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
		<style>
		   /* card 이미지 부모요소의 높이 지정 */
		   .img-wrapper{
		      height: 250px;
		      /* transform 을 적용할대 0.3s 동안 순차적으로 적용하기 */
		      transition: transform 0.3s ease-out;
		   }
		   /* .img-wrapper 에 마우스가 hover 되었을때 적용할 css */
		   .img-wrapper:hover{
		      /* 원본 크기의 1.1 배로 확대 시키기*/
		      transform: scale(1.1);
		   }
		   
		   .card .card-text{
		      /* 한줄만 text 가 나오고  한줄 넘는 길이에 대해서는 ... 처리 하는 css */
		      display:block;
		      white-space : nowrap;
		      text-overflow: ellipsis;
		      overflow: hidden;
		   }
		   	.img-wrapper img{
			   	width: 100%;
			   	height: 100%;
			   	/* fill | contain | cover | scale-down | none(default) */
			   	/*	
			   		cover - 부모의 크기에 맞게 키운 후, 자른다. 비율은 일정하게 증가한다. 
			   		contain - 안잘린다. 대신 빈 공간이 남을 수 있다.
			   		fill - 부모의 크기에 딱 맞게, 비율 관계 없이 맞춘다.(이미지가 일그러질 수 있다.)
			   		scale-down - 가로, 세로 중에 큰 것을 부모의 크기에 맞춘 상태까지만 커지거나 작아지고, 비율은 일정하다.
			   	*/
				object-fit: contain;	
		   	}
		
		</style>
        </head>
		<body>
		<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
            <a class="navbar-brand" style="font-weight:bold;">PAVE the WAY!</a>
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
        <header class="bg-dark py-2">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <img src="${pageContext.request.contextPath }/resources/images/logo1.png" width="130" height="30"/>
                </div>
            </div>
        </header>
		<!-- Section-->
        <section class="py-3">
        	<div class="row">
        		<div class="col-2">
        			  	<div class="flex-shrink-0 p-3 bg-white" style="width: 70px;">
						    <ul class="list-unstyled ps-0">
					      	<li class="mb-1 container-fluid">
						        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true"
						         style="font-size:17px; font-weight:bold;" href="${pageContext.request.contextPath}/shop/list.do">
						         Shop
						        </button>
					        	<div class="collapse show" id="home-collapse">
							        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
							        	<li><a href="${pageContext.request.contextPath }/shop/list.do?category=outer" class="link-dark rounded">Outer</a></li>
							            <li><a href="${pageContext.request.contextPath }/shop/list.do?category=top" class="link-dark rounded">Top</a></li>
							            <li><a href="${pageContext.request.contextPath }/shop/list.do?category=bottom" class="link-dark rounded">Bottom</a></li>
							            <li><a href="${pageContext.request.contextPath }/shop/list.do?category=etc" class="link-dark rounded">Etc</a></li>
							    	</ul>
					        	</div>
					      	</li>
					    </ul>
					</div>
        		</div>
        		<div class="col-9">
		    <div class="container">

		   	<h3>${dto.category}</h3>

		   	<div class="row">
				<c:forEach var="tmp" items="${list }">
					<div class="col-6 col-md-4 col-lg-3">
		         		<div class="card mb-3">
		            		<a href="${pageContext.request.contextPath}/shop/detail.do?num=${tmp.num}">
			               		<div class="img-wrapper">
			                  		<img class="card-img-top" src="${pageContext.request.contextPath }${tmp.imagePath}" />
			               		</div>
		            		</a>
		            		<div class="card-body">
		               			<p class="card-text"><strong>${tmp.name}</strong></p>
		               			<p><small>${tmp.price}</small>원</p>
		               			<p><small>수량 : ${tmp.remainCount}</small>개</p>
		            		</div>
		         		</div>
		      		</div>
				</c:forEach>
		   	</div>
		   	<nav>
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${startPageNum ne 1 }">
						<li class="page-item">
		               		<a class="page-link" href="${pageContext.request.contextPath}/shop/list.do?pageNum=${startPageNum - 1}">Prev</a>
		            	</li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled">
		               		<a class="page-link" href="javascript:">Prev</a>
		            	</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
					<c:choose>
						<c:when test="${i eq pageNum }">
							<li class="page-item active">
		                  		<a class="page-link" href="${pageContext.request.contextPath}/shop/list.do?pageNum=${i}">${i }</a>
		               		</li>
						</c:when>
						<c:otherwise>
							<li class="page-item">
		                  		<a class="page-link" href="${pageContext.request.contextPath}/shop/list.do?pageNum=${i}">${i}</a>
		               		</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${endPageNum lt totalPageCount }">
						<li class="page-item">
		               		<a class="page-link" href="${pageContext.request.contextPath}/shop/list.do?pageNum=${endPageNum + 1}">Next</a>
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

