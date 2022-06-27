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
        <link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
    
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
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/shop/list.do?category=outer">Shop</a></li>
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
                    		<button class="btn btn-outline-dark" style="margin-left:3px" onclick="location.href='${pageContext.request.contextPath }/users/info.do'">MyInfo</button>
                    		<button class="btn btn-outline-dark" style="margin-left:3px" onclick="location.href='${pageContext.request.contextPath }/users/logout.do'">Logout</button>
                    	</c:otherwise>
                    </c:choose>
                    
                </div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-1">
                <div class="text-center text-white">
                    <img src="${pageContext.request.contextPath }/resources/images/logo1.png" width="220" height="100"/>
                </div>
            </div>
        </header>
        
        <!-- Section-->
        <section class="py-5">
        	<div class="row">
        		<div class="col-1">
        			
					  	
        		</div>
        		
        		<div class="col-10">
        		<cneter>
        			<div>
						<center><h1>장바구니</h1></center>
						
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
												₩<fmt:formatNumber  value="${tmp.price }" pattern="#,###"/>
											</td>
											<td>
												<input type="number" style="" name="amount" value="${tmp.amount }">
												<input type="hidden" name="code" value="${tmp.code }">							
											</td>
											<td>
												₩<fmt:formatNumber  value="${tmp.money }" pattern="#,###"/>						
											</td>
											<td>
												<a href="${pageContext.request.contextPath}/cart/delete.do?num=${tmp.num}">
													<svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
												  		<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
												  		<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
													</svg>												
												</a>
											</td>
										</tr>
									</c:forEach>
									</tbody>
									<tr>
										<td>
											장바구니 금액 합계 : ₩<fmt:formatNumber  value="${map.sumMoney }" pattern="#,###"/><br>
											배송료 : ₩<fmt:formatNumber  value="${map.fee }" pattern="#,###"/><br>
											전체 주문 금액 : ₩<fmt:formatNumber  value="${map.sum }" pattern="#,###"/><br> 
										</td>
									</tr>
								</table>
								<input type="hidden" name="count" value="${map.count }">
								<div class="col">
									<a class="w-55 btn btn-outline-dark" href="${pageContext.request.contextPath }/shop/list.do?category=outer">상품목록</a>
									<a class="w-55 btn btn-outline-dark" href="${pageContext.request.contextPath }/cart/deleteAll.do">장바구니 비우기</a>
									<a class="w-55 btn btn-outline-dark" href="${pageContext.request.contextPath }/order/insertAll.do">결제하기</a>
			        				
								</div>
								
							</form>
							</c:otherwise>
						</c:choose>
						
						
				
				</div>
				</cneter>
				
        		<div class="col-1">
        			
					  	
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