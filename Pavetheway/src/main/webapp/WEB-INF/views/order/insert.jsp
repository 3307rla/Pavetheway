<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/order/insert.jsp</title>
</head>
<body>
	<script>
		alert("상품 주문이 완료되었습니다.");
		location.href="${pageContext.request.contextPath}/order/list.do";
	</script>

</body>
</html>