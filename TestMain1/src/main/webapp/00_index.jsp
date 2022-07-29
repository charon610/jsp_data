<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl 태그(기본) -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- <c:out value="${contextPath}"/>  *확인용: /16_jsp_mvc2_training_bookShop -->
<!-- contextPath가 변경되어도  소스 수정없이 적용하기 위해 사용함-->
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<!-- meta name="viewport : 뷰포트 설정을 하게 되면 다양한 모바일 기기에서도 페이지의 너비나 화면 배율을 설정할 수 있음
     content="width=device-width : 너비를 장치 너비로 설정
     initial-scale=1.0 : 초기 화면 배율 설정(1.0 은 100%와 같음) -->
<link rel="stylesheet" href="${contextPath}/css/style.css"/>
<!-- <link> 태그의 rel 속성은 현재 문서와 외부 리소스 사이의 연관 관계를 명시하며 link태그 사용 시 무조건 사용해야할 속성
      rel="stylesheet" : 스타일 시트(stylesheet)로 사용할 외부 리소스를 불러옴. -->
<div id="header">
  <div id="logo" class="box"> 
    <a href="${contextPath}/index.do"> 
      <img class="noborder" id="logo" src="${contextPath}/images/logo.png"/> <!-- 로고 이미지 -->
   	</a>
  </div>
  <div id="auth" class="box">
  <!-- top부분에는 type==0;일경우  02_managerLogin.jsp / type==1일경우 12_login.jsp 페이지 불러오기-->
    <c:if test="${type == 0}"> <!-- _01_ManagerMain.jave의 type값 불러오기 -->
      <jsp:include page="02_managerLogin.jsp"/>
    </c:if>
    <c:if test="${type == 1}"> <!-- _11_ShopMain.jave의 type값 불러오기 -->
     <jsp:include page="12_login.jsp"/>
    </c:if>
  </div>
</div>
<div id="content" class="box2">
  <jsp:include page="${cont}"/> <!-- Controller.java에서 cont 페이지 불러오기 (/11_shopMain.jsp)-->
</div>
