<%@page import="com.oracle.minimalism.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/js" href="${pageContext.request.contextPath}/resources/js/bootstrap.min.js">
<link rel="stylesheet" type="text/css" href="/css/header.css">
</head>
<body>
	<nav class="navbar fixed-top navbar-light bg-white">
			<div class="col-md-3">
				<!-- 햄버거 메뉴 -->
				<input type="checkbox" id="trigger">
				<label for="trigger">
					<!-- 햄버거 세줄 표현 -->
		            <span></span>
		            <span></span>
		            <span></span>
				</label>
				 <!-- 클릭시 나타날 사이드바 -->
        		<div class="sidebar">
        			<div class="sidebarList">
	        			<label class="list">MINIMALISM</label><br>
		        			<a class="a" href="/about">About</a><br>
		        			<a class="a" href="/stockist">Stockist</a><br>
	        			<label class="list">BAG</label><br>
		        			<a class="a" href="/viewAll?currentPage=1&value=1&category=0">View all</a><br>
		        			<a class="a" href="/viewAll?currentPage=1&value=1&category=1">Shoulder</a><br>
		        			<a class="a" href="/viewAll?currentPage=1&value=1&category=2">Cross</a><br>
		        			<a class="a" href="/viewAll?currentPage=1&value=1&category=3">Bucket</a><br>
		        			<a class="a" href="/viewAll?currentPage=1&value=1&category=4">Tote</a><br>
	        			<label class="list">BOARD</label><br>
		        			<a class="a" href="/board/notices">NOTICE</a><br>
		        			<a class="a" href="/board/reviews">REVIEW</a><br>
		        			<a class="a" href="/board/qnas">Q&amp;A</a><br>
		        	</div>
        		</div>
			</div>
			<div class="col-md-6">
				<ul class="nav justify-content-center">
					<li class="nav-item">
						<a href="/"><img class="logo" alt="logo" src="/img/minimalism.png" width="300"></a>
					</li>
				</ul>
			</div>
			<div class="col-md-3">
				<ul class="nav justify-content-end">
					<c:if test="${loginUser == null}">
					<li class="nav-item">
						<a href="/loginForm">LOGIN</a>
					</li>
					<li class="nav-item">
						<a href="/joinForm">JOIN</a>
					</li>
					<li class="nav-item">
						<a href="/cart/${loginUser.id}">CART</a>
					</li>
					</c:if>
					<c:if test="${loginUser != null}">
					<li class="nav-item">
						<a href="/mypageForm">${loginUser.username}(${loginUser.id})</a>
					
					<li class="nav-item">
						<a href="/logout">LOGOUT</a>
					</li>
					
					<li class="nav-item">
						<a href="/cart/${loginUser.id}">CART</a>
					</li>			
					</c:if>
				</ul>
			</div>
		</nav>		
		<c:if test="${msg != null}">
			 <script>
			 let msg = "${msg}";
			 alert(msg);
			 </script>
			 <c:remove scope="session" var="msg" />
		</c:if>
	</body>
</html>