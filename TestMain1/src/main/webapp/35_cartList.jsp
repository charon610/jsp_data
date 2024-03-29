<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="${contextPath}/css/style.css"/>
<script src="${contextPath}/js/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#conShopping").click(function(){//[쇼핑계속]버튼 클릭
			window.location.href="${contextPath}/list.do?book_kind=all";
		});
		
		$("#shopMain").click(function(){//[메인으로]버튼 클릭
			window.location.href="${contextPath}/index.do";
		});
	});
	
	function editSu(editBtn){//[수정]버튼 클릭
		
		var rStr = editBtn.name;
		var arr = rStr.split(",");
		var query = "${contextPath}/cartUpdateForm.do?cart_id="+arr[0];
		query += "&buy_count="+arr[1];
		window.location.href=query;
	}
	
	function delList(delBtn){//[삭제]버튼 클릭
		var rStr = delBtn.name;
		var query = "${contextPath}/deleteCart.do?list="+rStr;
	    window.location.href=query;
	}
</script>
<c:if test="${empty sessionScope.id}">
  <meta http-equiv="Refresh" content="0;url=${contextPath}/index.do">
</c:if>

<div class = "side">
  <ul class="menu">
    <li class="menu-item"><a href="${contextPath}/list.do?book_kind=100" class="menu-link">문학</a>
    <li class="menu-item"><a href="${contextPath}/list.do?book_kind=200" class="menu-link">어학</a>
    <li class="menu-item"><a href="${contextPath}/list.do?book_kind=300" class="menu-link">컴퓨터</a>
    <li class="menu-item"><a href="${contextPath}/list.do?book_kind=all" class="menu-link">전체</a>
  </ul>
</div>	
<div id="goShop">
  <button id="conShopping">쇼핑계속</button>
  <button id="shopMain">메인으로</button>
</div>
<div id="cartList">
<c:if test="${count == 0}">
   <ul>
      <li>장바구니에 담긴 물품이 없습니다.
   </ul>
</c:if>
<c:if test="${count > 0}">
  <table> 
  <tr> 
   <td width="300">상품명</td> 
   <td width="100">판매가격</td>
   <td width="150">수량</td> 
   <td width="150">금액</td>
  </tr>
  <c:set var="total" value="0"/>
  <c:forEach var="cart" items="${cartLists}">
    <tr> 
       <td  width="300">
         <img src="${contextPath}/bookImage/${cart.getBook_image()}" 
             class="cartimage">${cart.getBook_title()}</td> 
       <td width="100">
          <fmt:formatNumber value="${cart.getBuy_price()}" type="number" pattern="#,##0"/>원</td>
       <td width="150">
          <input type="text" name="buy_count" size="5" value="${cart.getBuy_count()}" disabled="disabled">
          <button id="updateSu" name="${cart.getCart_id()},${cart.getBuy_count()}" 
	       onclick="editSu(this)">수정</button>
       </td> 
       <td align="center"  width="150">
         <c:set var="amount" value="${cart.getBuy_count()*cart.getBuy_price()}"/>
         <c:set var="total" value="${total+amount}"/>
         <fmt:formatNumber value="${amount}" type="number" pattern="#,##0"/>원
         <button id="deleteList" name="${cart.getCart_id()}" 
	       onclick="delList(this)">삭제</button>
       </td>
     </tr>
  </c:forEach>
    <tr>
     <td colspan="4" align="right" class="b">총 금액 : 
       <fmt:formatNumber value="${total}" type="number" pattern="#,##0"/>원</td>
    </tr>
    <tr  height="10">
      <td colspan="5" align="center">
         <div id="cinfo">
         <table><tr>
           <td><form id="cartForm" method="post" action="${contextPath}/buyForm.do">
            <input type="hidden" name="buyer" value="${sessionScope.id}">
            <input type="submit" value="구매하기">
            </form></td>
           <td><form id="cartClearForm" method="post" action="${contextPath}/deleteCart.do">
            <input type="hidden" name="list" value="all">
            <input type="hidden" name="buyer" value="${sessionScope.id}">
            <input type="submit" value="장바구니비우기">
            </form></td></tr>
         </table>
         </div>
      </td>
    </tr>
  </table>
</c:if>
</div> 