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
		<style>
			.content{
				border: 1px dotted gray;
			}
			
			/* 댓글 프로필 이미지를 작은 원형으로 만든다. */
			.profile-image{
				width: 50px;
				height: 50px;
				border: 1px solid #cecece;
				border-radius: 50%;
			}
			/* ul 요소의 기본 스타일 제거 */
			.comments ul{
				padding: 0;
				margin: 0;
				list-style-type: none;
			}
			.comments dt{
				margin-top: 5px;
			}
			.comments dd{
				margin-left: 50px;
			}
			.comment-form textarea, .comment-form button{
				float: left;
			}
			.comments li{
				clear: left;
			}
			.comments ul li{
				border-top: 1px solid #888;
			}
			.comment-form textarea{
				width: 84%;
				height: 100px;
			}
			.comment-form button{
				width: 14%;
				height: 100px;
			}
			/* 댓글에 댓글을 다는 폼과 수정폼은 일단 숨긴다. */
			.comments .comment-form{
				display: none;
			}
			/* .reply_icon 을 li 요소를 기준으로 배치 하기 */
			.comments li{
				position: relative;
			}
			.comments .reply-icon{
				position: absolute;
				top: 1em;
				left: 1em;
				color: red;
			}
			pre {
			  display: block;
			  padding: 9.5px;
			  margin: 0 0 10px;
			  font-size: 13px;
			  line-height: 1.42857143;
			  color: #333333;
			  word-break: break-all;
			  word-wrap: break-word;
			  background-color: #f5f5f5;
			  border: 1px solid #ccc;
			  border-radius: 4px;
			}	
			
			.loader{
				/* 로딩 이미지를 가운데 정렬하기 위해 */
				text-align: center;
				/* 일단 숨겨 놓기 */
				display: none;
			}	
			
			.loader svg{
				animation: rotateAni 1s ease-out infinite;
			}
			
			@keyframes rotateAni{
				0%{
					transform: rotate(0deg);
				}
				100%{
					transform: rotate(360deg);
				}
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
                    <img src="${pageContext.request.contextPath}/resources/images/logo1.png" width="220" height="120"/>
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
        		<div class=col-8>
        			<img src="${pageContext.request.contextPath}${dto.imagePath}" width="500" height="500"/>
        			<br/>
        			<img src="${pageContext.request.contextPath}${dto.infoImagePath}" width="500" height="500"/>
        			<br/>
        			<a href="${pageContext.request.contextPath}/shop/list.do?category=${dto.category}">목록으로</a>
        			<a href="${pageContext.request.contextPath}/shop/buy.do">주문하기</a>
        			<td>
        				<form name="form1" method="post" action="${pageContext.request.contextPath}/cart/insert.do">
        				<input type="hidden" name="code" value="${dto.code }"/>
        				<select name="amount">
        					<c:forEach begin="1" end="10" var="i">
        						<option value="${i}">${i}</option>
        					</c:forEach>
        				</select>&nbsp;개
        				<input type="submit" value="장바구니"/>
        				</form>
        			</td>
        			<br />
        			
        			<!-- 댓글 목록 -->
					<div class="comments">
						<ul>
							<c:forEach var="tmp" items="${commentList }">
								<c:choose>
									<c:when test="${tmp.deleted eq 'yes' }">
										<li>삭제된 댓글 입니다.</li>
									</c:when>
									<c:otherwise>
										<c:if test="${tmp.num eq tmp.comment_group }">
											<li id="reli${tmp.num }">
										</c:if>
										<c:if test="${tmp.num ne tmp.comment_group }">
											<li id="reli${tmp.num }" style="padding-left:50px;">
												<svg class="reply-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
						  							<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
												</svg>
										</c:if>
												<dl>
													<dt>
														<c:if test="${ empty tmp.profile }">
															<svg class="profile-image" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
															  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
															  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
															</svg>
														</c:if>
														<c:if test="${not empty tmp.profile }">
															<img class="profile-image" src="${pageContext.request.contextPath}${tmp.profile }"/>
														</c:if>
														<span>${tmp.writer }</span>
														<c:if test="${tmp.num ne tmp.comment_group }">
															@<i>${tmp.target_id }</i>
														</c:if>
														<span>${tmp.regdate }</span>
														<a data-num="${tmp.num }" href="javascript:" class="reply-link">답글</a>
														<c:if test="${ (id ne null) and (tmp.writer eq id) }">
															<a data-num="${tmp.num }" class="update-link" href="javascript:">수정</a>
															<a data-num="${tmp.num }" class="delete-link" href="javascript:">삭제</a>
														</c:if>
													</dt>
													<dd>
														<pre id="pre${tmp.num }">${tmp.content }</pre>						
													</dd>
												</dl>
												<form id="reForm${tmp.num }" class="animate__animated comment-form re-insert-form" action="comment_insert.do" method="post">
													<input type="hidden" name="ref_group" value="${dto.num }"/>
													<input type="hidden" name="target_id" value="${tmp.writer }"/>
													<input type="hidden" name="comment_group" value="${tmp.comment_group }"/>
													<textarea name="content"></textarea>
													<button type="submit">등록</button>
												</form>
											<c:if test="${tmp.writer eq id }">
												<form id="updateForm${tmp.num }" class="comment-form update-form" action="comment_update.do" method="post">
													<input type="hidden" name="num" value="${tmp.num }" />
													<textarea name="content">${tmp.content }</textarea>
													<button type="submit">수정</button>
												</form>
											</c:if>
											</li>		
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</div>
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
