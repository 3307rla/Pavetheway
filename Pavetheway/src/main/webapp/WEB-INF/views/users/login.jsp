<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/login.jsp</title>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${not empty sessionScope.id }">
				<script>
					location.href="${requestScope.url }";
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("아이디 혹은 패스워드가 잘못 입력되었습니다.");
					location.href="loginform.do?url=${requestScope.encodedUrl }";
				</script>
			</c:otherwise>
		</c:choose>
	</div>	
</body>
</html>