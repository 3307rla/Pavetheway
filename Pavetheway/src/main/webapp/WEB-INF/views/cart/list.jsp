<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
        <link href="../resources/css/styles.css" rel="stylesheet" />
    
    <script>

    </script>    
    
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
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/shop/list.do">Shop</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/inquiry/answer_list.do">Q&A</a></li>
                    </ul>
                    <c:choose>
                    	<c:when test="${ empty sessionScope.id}">
                    		<button class="btn btn-outline-dark">Login</button>
                    		<button class="btn btn-outline-dark" style="margin-left:3px">SignUp</button>
                    	</c:when>
                    	<c:otherwise>
                    		<form class="d-flex">
                        		<button class="btn btn-outline-dark" type="submit">
                            		<i class="bi-cart-fill me-1"></i>
                           				Cart
                        		</button>
                    		</form>
                    		<button class="btn btn-outline-dark"><a href="${pageContext.request.contextPath }/users/info.do">MyInfo</button>
                    		<button class="btn btn-outline-dark"><a href="${pageContext.request.contextPath }/users/logout.do">Logout</button>
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
        		
        		<div class="col-10">			
	        		<div class="container">
						<center><h1>장바구니 확인</h1></center>
						
						<c:choose>
							<c:when test="${map.count == 0 }">
								장바구니가 비었습니다.
							</c:when>
							<c:otherwise>
							<form name="form1" id="form1" method="post" action="${pageContext.request.contextPath }/cart/update.do">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col">상품명</th>
											<th scope="col">단가</th>
											<th scope="col">수량</th>
											<th scope="col">금액</th>
											<th scope="col">취소</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="tmp" items="${map.list }">
										<tr>
											<td>${tmp.name }</td>
											
											<td>
												<fmt:formatNumber  value="${tmp.price }" type="currency"/>
											</td>
											<td>
												<input type="number" style="" name="amount" value="${tmp.amount }">
												<input type="hidden" name="code" value="${tmp.code }">							
											</td>
											<td>
												<fmt:formatNumber  value="${tmp.money }" type="currency"/>						
											</td>
											<td>
												<a href="${pageContext.request.contextPath}/cart/delete.do?num=${tmp.num}">삭제</a>
											</td>
										</tr>
									</c:forEach>
									</tbody>
									<tr>
										<td>
											장바구니 금액 합계 : <fmt:formatNumber  value="${map.sumMoney }" type="currency"/><br>
											배송료 : <fmt:formatNumber  value="${map.fee }" type="currency"/><br>
											전체 주문 금액 : <fmt:formatNumber  value="${map.sum }" type="currency"/><br> 
										</td>
									</tr>
								</table>
								<input type="hidden" name="count" value="${map.count }">
								<button type="submit" id="btnUpdate">수정</button>
								<button type="button" id="btnDelete"><a href="${pageContext.request.contextPath }/cart/deleteAll.do">장바구니 비우기</a></button>
							</form>
							</c:otherwise>
						</c:choose>
						<button type="button" id="btnList"><a href="${pageContext.request.contextPath }/shop/list.do?category=outer">상품목록</a></button>
				
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