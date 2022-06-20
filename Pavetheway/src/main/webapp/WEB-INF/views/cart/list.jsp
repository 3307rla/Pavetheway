<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cart/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
</head>
<body>
<div class="container">
	<h1>장바구니 확인</h1>
	<c:choose>
		<c:when test="${map.count == 0 }">
			장바구니가 비었습니다.
		</c:when>
		<c:otherwise>
		<form name="form1" id="form1" method="post" action="${pageContext.request.contextPath }/cart/update.do">
			<table>
				<tr>
					<th>상품번호</th>
					<th>상품코드</th>
					<th>상품이름</th>
				</tr>
			</table>
		</form>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>