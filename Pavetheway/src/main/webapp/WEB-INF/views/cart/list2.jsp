 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cart/list2.jsp</title>

<script>
$(function(){
 
    $("#btnList").click(function(){
        location.href="${path}/shop/list.do";
    });
 
// 아래쪽에서 btnlist를 호출해서 실행되는 function() 함수 구문.
// list로 가는 링크를 만든다.
 
    $("#btnDelete").click(function(){
        if(confirm("장바구니를 비우시겠습니까?")){
            location.href="${path}/shop/cart/deleteAll.do";
        }
    });
});
</script>
</head>
<body>
<h2>장바구니</h2>
<c:choose>
    <c:when test="${map.count == 0 }">
    <!-- when은 ~~일때 라는 뜻 그러니까 map의 count가 0일때... -->
    <!-- xml파일에서 hashmap에 list를 넣어놓았기 때문에 현재 map에 자료가 들어있다.  -->
    <!-- map에 자료가 아무것도 없다면 -->
        장바구니가 비었습니다.
    </c:when>
    
    <c:otherwise>
    <!-- map.count가 0이 아닐때, 즉 자료가 있을때 -->
    <!-- form을 실행한다.  -->
    <!-- form의 id를 form1로 하고, method 방식을 post로 한다. 그리고 update.do페이지로 이동시킨다. -->
        <form id="form1" name="form1" method="post"
        action="${path}/shop/cart/update.do">
            <table border="1" width="400px">
                <tr>
                    <th>상품명</th>
                    <th>단가</th>
                    <th>수량</th>
                    <th>금액</th>
                    <th>&nbsp;</th>
                </tr>
                <!-- map에 있는 list출력하기 위해 forEach문을 사용해 row라는 변수에 넣는다. -->
            <c:forEach var="row" items="${map.list}">
                <tr align="center">
                    <td>${row.product_name}</td>
                    
                    <td><fmt:formatNumber value="${row.price}"
                            pattern="#,###,###" /></td>
                            <!-- fmt:formatNumber 태그는 숫자를 양식에 맞춰서 문자열로 변환해주는 태그이다 -->
                            <!-- 여기서는 금액을 표현할 때 사용 -->
                            <!-- ex) 5,000 / 10,000 등등등-->
                            
                    <td><input type="number" name="amount" 
                        style="width:30px;"
                        value="<fmt:formatNumber value="${row.amount}"
                            pattern="#,###,###" />">
                    <!-- 물건의 개수 (amount)를 fmt태그를 사용해서 패턴의 형식에 맞춰서 문자열로 변환함 -->
                    <!--1,000 / 5,000 등등~  -->
                    
                            <input type="hidden" name="cart_id"
                            value="${row.cart_id}">
                            
                                
                    </td>
                    <td><fmt:formatNumber value="${row.money}"
                            pattern="#,###,###" /></td>
                    <td><a href=
"${path}/shop/cart/delete.do?cart_id=${row.cart_id}">[삭제]</a>
<!-- 삭제 버튼을 누르면 delete.do로 장바구니 개별 id (삭제하길원하는 장바구니 id)를 보내서 삭제한다. -->
                    </td>
                </tr>
            </c:forEach>
                <tr>
                    <td colspan="5" align="right">
                        	장바구니 금액 합계 :
                        			<fmt:formatNumber value="${map.sumMoney}"
                            		pattern="#,###,###" /><br>
                        	배송료 : ${map.fee}<br>
                        	총합계 :  <fmt:formatNumber value="${map.sum}"
                            		pattern="#,###,###" />
                    </td>
                </tr>
            </table>
            <button id="btnUpdate">수정</button>
            <button type="button" id="btnDelete">장바구니 비우기</button>
        </form>
    </c:otherwise>
</c:choose>
<button type="button" id="btnList">상품목록</button>
</body>
</html>
