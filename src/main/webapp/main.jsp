<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class="row">
		<!-- 베스트상품 슬라이드형식으로 나오게끔,, -->
		베스트상품 영역입니다.
	</div>
	<div class="row">
		<c:if test="${empty productList }">
	<h1>상품을 준비 중입니다.</h1>
	</c:if>
	<c:forEach var="productList" items="${productList}" varStatus="status">
	<c:choose>
		<c:when test="${productList.p_hide == 'false'}"><!-- 품절아닐때 -->
			<div id="product">
				<a href="productDetailView.p?p_num=${productList.p_num}">
					<img src="${pageContext.request.contextPath}/images/${productList.p_image}" id="p_image">
				</a><br>
					조회수: ${productList.p_readcount}<br>
					상품명: ${productList.p_name}<br>
					금액: ${productList.p_price}<br>
			</div>
			<c:if test="${status.count % 4 == 0}">
				<div style="clear: both;"></div>
			</c:if>
		</c:when>
		<c:otherwise><!-- 품절일때 -->
			<div id="product">
				<a href="productDetailView.p?p_num=${productList.p_num}">
					<img src="${pageContext.request.contextPath}/images/${productList.p_image}" id="p_image">
				</a><br>
					조회수: ${productlist.p_readcount}<br>
					품절입니다.
			</div>
			<c:if test="${status.count % 4 == 0}">
				<div style="clear: both;"></div>
			</c:if>
		</c:otherwise>
	</c:choose>
</c:forEach>
	</div>



</div>
</body>
</html>