<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/pwd_update.jsp</title>
</head>
<body>
	<div class="container">
		<c:choose>
			<c:when test="${isSuccess }">
				<script>
					alert("수정되었습니다.");
					location.href="${pageContext.request.contextPath}/users/loginform.do";
				</script>
			</c:when>
			<c:otherwise>
				<script>
					alert("이전 패스워드가 일치하지 않습니다.");
					location.href="${pageContext.request.contextPath}/users/pwd_updateform.do";
				</script>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>





