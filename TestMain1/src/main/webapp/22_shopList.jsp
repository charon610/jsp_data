<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="${contextPath}/css/style.css"/>
<script src="${contextPath}/js/jquery-3.5.1.min.js"></script>

<div class = "side">
  <ul class="menu">
    <li class="menu-item"><a href="${contextPath}/list.do?book_kind=100" class="menu-link">문학</a>
    <li class="menu-item"><a href="${contextPath}/list.do?book_kind=200" class="menu-link">어학</a>
    <li class="menu-item"><a href="${contextPath}/list.do?book_kind=300" class="menu-link">컴퓨터</a>
    <li class="menu-item"><a href="${contextPath}/list.do?book_kind=all" class="menu-link">전체</a>
  </ul>
</div>	

<div id="shop" class="box2">
  <c:if test="${book_kind=='100'}">
    <c:set var="book_kindName" value="문학"/>
  </c:if>
  <c:if test="${book_kind=='200'}">
    <c:set var="book_kindName" value="외국어"/>
  </c:if>
  <c:if test="${book_kind=='300'}">
    <c:set var="book_kindName" value="컴퓨터"/>
  </c:if>
  
  <c:if test="${book_kind=='all'}">
    <c:set var="book_kindName" value="전체"/>
    <c:set var="display" value="전체 목록"/>
  </c:if>
  <c:if test="${book_kind!='all'}">
    <c:set var="display" value="[${book_kindName}] 분류의 목록"/>
  </c:if>
  
  <p class="b">${display} : (${count}개)</p>
  <c:forEach var="book" items="${bookList}">
    <table class="vhcenter">
      <tr height="30"> 
        <td rowspan="4"  width="100">
          <a href="${contextPath}/bookContent.do?book_id=${book.getBook_id()}&book_kind=${book.getBook_kind()}">
             <img src="${contextPath}/bookImage/${book.getBook_image()}" class="listimage"></a></td>
        <td width="350" class="vhcenter">
          <a href="${contextPath}/bookContent.do?book_id=${book.getBook_id()}&book_kind=${book.getBook_kind()}" class="b">
              ${book.getBook_title()}</a></td>
        <td rowspan="4" width="100">
          <c:if test="${book.getBook_count()==0}">
            일시품절
          </c:if>
          <c:if test="${book.getBook_count()!=0}">
            구매가능
          </c:if>
       </td>      
       </tr>
       <tr height="30">
        <td width="350">출판사 :${book.getPublishing_com()}</td></tr>
       <tr height="30">
        <td width="350">저자 : ${book.getAuthor()}</td></tr>
       <tr height="30">
        <td width="350"><c:set var="price" value="${book.getBook_price()}"/>
            <c:set var="rate" value="${book.getDiscount_rate()}"/>
            정가 : <fmt:formatNumber value="${price}" type="number" pattern="#,##0"/>원<br>
         <strong class="bred">판매가:<fmt:formatNumber value="${price*((100.0-rate)/100)}" type="number" pattern="#,##0"/>원</strong>
        </td></tr> 
     </table>
  </c:forEach>
</div>