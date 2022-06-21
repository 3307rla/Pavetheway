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
					<th>상품명</th>
					<th>단가</th>
					<th>수량</th>
					<th>금액</th>
					<th>취소</th>
				</tr>
				<c:forEach var="row" items="${mpa.list }">
					<tr>
						<td>${row.name }</td>
						
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${row.price }"/>
						</td>
						<td>
							<input type="number" style="" name="amount" value="${row.amount }"/>
							<input type="hidden" name="code" value="${code }"/>							
						</td>
						<td>
							<fmt></fmt>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>