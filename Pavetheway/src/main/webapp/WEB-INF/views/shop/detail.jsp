<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/shop/detail.jsp</title>
<%-- bootstrap --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" >
</head>
<body>
<div class="container">
   <nav>
      <ul class="breadcrumb">
         <li class="breadcrumb-item">
            <a href="${pageContext.request.contextPath }/">Home</a>
         </li>
         <li class="breadcrumb-item">
            <a href="${pageContext.request.contextPath }/shop/list.do">상품목록</a>
         </li>
         <li class="breadcrumb-item active">상세보기</li>
      </ul>
   </nav>
   <div class="card mb-3">
      <img class="card-img-top" src="${pageContext.request.contextPath}${dto.imagePath}"/>
      <div class="card-body">
         <p class="card-text">by <strong>${dto.name}</strong></p>
         <p><small>${dto.price}</small></p>
         <p class="card-text">${dto.infoImagePath}</p>
      </div>
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
</body>
</html>

