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
				<c:forEach var="tmp" items="${mpa.list }">
					<tr>
						<td>${tmp.name }</td>
						
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${tmp.price }"/>
						</td>
						<td>
							<input type="number" style="" name="amount" value="${tmp.amount }"/>
							<input type="hidden" name="code" value="${code }"/>							
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${tmp.money }"/>							
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/cart/delete.do?num=${tmp.num}"></a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td>
						장바구니 금액 합계 : <fmt formatNumber patter="###,###,###" value="${map.sumMoney}"/><br>
						배송료 : ${map.fee}<br>
						전체 주문 금액 : <fmt formatNumber patter="###,###,###" value="${map.allSum}"/><br> 
					</td>
				</tr>
			</table>
		</form>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>