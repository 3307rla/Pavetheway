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
                <a class="navbar-brand" style="font-weight:bold;">PAVE the WAY!</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="${pageContext.request.contextPath }/home.do">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/shop/list.do?category=outer">Shop</a></li>
                        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath }/inquiry/answer_list.do">Q&A</a></li>
                    </ul>
                    <c:choose>
                    	<c:when test="${ empty sessionScope.id}">
                    		<button class="btn btn-outline-dark" onclick="location.href='${pageContext.request.contextPath }/users/loginform.do'">Login</button>
                    		<button class="btn btn-outline-dark" style="margin-left:3px" onclick="location.href='${pageContext.request.contextPath }/users/signup_form.do'">SignUp</a></button>
                    	</c:when>
                    	<c:otherwise>
                    		<form class="d-flex">
                        		<button class="btn btn-outline-dark" type="submit" onclick="location.href='${pageContext.request.contextPath }/cart/list.do'">
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
        		<div class="col-2">
        			<div class="b-example-divider"></div>
					  	<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
						    <a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
						      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
						      <span class="fs-5 fw-semibold">MENU</span>
						    </a>
					    <ul class="list-unstyled ps-0">
					      	<li class="mb-1">
						        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true" style="font-size:17px; font-weight:bold;">
						        	문의 및 답변
						        </button>
					        	<div class="collapse show" id="home-collapse">
							        <ul class="btn-toggle-nav list-unstyled fw-normal pb-3 small">
							        	<li><a href="${pageContext.request.contextPath }/inquiry/list.do" class="link-dark rounded">문의 게시판</a></li>
							        	<li><a href="${pageContext.request.contextPath }/inquiry/answer_list.do" class="link-dark rounded">Q&A</a></li>
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
								문의 게시판
								<svg xmlns="http://www.w3.org/2000/svg" width="3rem" height="3rem" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
								  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
								  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg>
							</center>
						</h2>
						
						<br />
						<center>
							<a href="insertform.do" >
							   <button type="button" class="btn btn-outline-success">새로운 글 작성 하기</button>
							</a>
						</center>
						<br />
						
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col">글번호</th>
									<th scope="col">작성자</th>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="tmp" items="${list }">
								<tr>
									<td>${tmp.num }</td>
									<td>${tmp.writer }</td>
									<td>
										<a href="detail.do?num=${tmp.num }&keyword=${encodedK }&condition=${condition}">${tmp.title }</a>
									</td>				
									<td>${tmp.regdate }</td>
									<td>
										<a href="delete.do?num=${tmp.num }" onclick="return confirm('삭제 하시겠습니까?');">
											<svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
												  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
												  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
											</svg>
										</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<br />
						<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						    <li>
						      <c:if test="${startPageNum ne 1 }">
									<li>
										<a class="page-link" href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Previous</a>
									</li>
								</c:if>
						    </li>
						    <li>
						      <span>
						        <c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
									<li>
										<c:choose>
											<c:when test="${pageNum eq i }">
												<li class="page-item active">
													<a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
												</li>
											</c:when>
											<c:otherwise>
												<a class="page-link" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
											</c:otherwise>
										</c:choose>
									</li>
								</c:forEach>
						      </span>
						    </li>
						    <li class="page-item">
						      <c:if test="${endPageNum lt totalPageCount }">
									<li class="page-item">
										<a class="page-link" href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
									</li>
								</c:if>
						    </li>
						  </ul>
						</nav>					
						<br />
						<div style="clear:both;"></div>
						
						<center>
							<form action="list.do" method="get"> 
									<label for="condition"><strong>검색 카테고리</strong></label>
									<select name="condition" id="condition">
										<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
										<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
										<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
									</select>
									<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${keyword }"/>
									<button type="submit" class="btn btn-success">검색</button>
							</form>
						</center>
						</div>
						<c:if test="${ not empty condition }">
							<p>
								<center><strong>${totalRow }</strong> 개의 글이 검색 되었습니다.</center>
							</p>
						</c:if>
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

