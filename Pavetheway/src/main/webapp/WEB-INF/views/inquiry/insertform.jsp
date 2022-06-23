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
						        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true" style="font-size:17px; font-weight:bold;">
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
						        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false" style="font-size:17px; font-weight:bold;">
						          Shop
						        </button>
					        	<div class="collapse" id="orders-collapse">
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
						<form action="insert.do" method="post" id="insertForm">
							<div class="mb-3">
								<label class="form-label" for="title">제목</label>
								<input class="form-control" type="text" name="title" id="title"/>
							</div>
							<div class="mb-3">
								<label class="form-label" for="content">내용</label>
								<textarea rows="10" class="form-control"  name="content" id="content"></textarea>
							</div>
							<button class="btn btn-primary" type="submit">작성 완료</button>
						</form>
					</div>
					<%--
						[ SmartEditor 를 사용하기 위한 설정 ]
						
						1. WebContent 에 SmartEditor  폴더를 복사해서 붙여 넣기
						2. WebContent 에 upload 폴더 만들어 두기
						3. WebContent/WEB-INF/lib 폴더에 
						   commons-io.jar 파일과 commons-fileupload.jar 파일 붙여 넣기
						   ( spring mvc 프로젝트에서는 필요 없음!!! / pom.xml 에 이미 명시 해 놓았음)
						4. <textarea id="content" name="content"> 
						   content 가 아래의 javascript 에서 사용 되기때문에 다른 이름으로 바꾸고 
						      싶으면 javascript 에서  content 를 찾아서 모두 다른 이름으로 바꿔주면 된다. 
						5. textarea 의 크기가 SmartEditor  의 크기가 된다.
						6. 폼을 제출하고 싶으면  submitContents(this) 라는 javascript 가 
						      폼 안에 있는 버튼에서 실행되면 된다.
					 --%>
					<!-- SmartEditor 에서 필요한 javascript 로딩  -->
					<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
					<script>
						var oEditors = [];
						
						//추가 글꼴 목록
						//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
						
						nhn.husky.EZCreator.createInIFrame({
							oAppRef: oEditors,
							elPlaceHolder: "content",
							sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
							htParams : {
								bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
								bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
								bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
								//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
								fOnBeforeUnload : function(){
									//alert("완료!");
								}
							}, //boolean
							fOnAppLoad : function(){
								//예제 코드
								//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
							},
							fCreator: "createSEditor2"
						});
						
						function pasteHTML() {
							var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
							oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
						}
						
						function showHTML() {
							var sHTML = oEditors.getById["content"].getIR();
							alert(sHTML);
						}
					
						
						function setDefaultFont() {
							var sDefaultFont = '궁서';
							var nFontSize = 24;
							oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
						}
						
						//폼에 submit 이벤트가 일어났을때 실행할 함수 등록
						document.querySelector("#insertForm")
							.addEventListener("submit", function(e){
								//에디터에 입력한 내용이 textarea 의 value 값이 될수 있도록 변환한다. 
								oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
								//textarea 이외에 입력한 내용을 여기서 검증하고 
								const title=document.querySelector("#title").value;
								
								//만일 폼 제출을 막고 싶으면  
								//e.preventDefault();
								//을 수행하게 해서 폼 제출을 막아준다.
								if(title.length < 5){
									alert("제목을 5글자 이상 입력하세요!");
									e.preventDefault();
								}
								
							});
					</script>
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

