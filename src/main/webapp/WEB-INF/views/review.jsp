<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review</title>
<link rel="stylesheet" href="/css/board.css">
</head>
<body>
<%@ include file="header.jsp" %>
	<div id="bigForm">
		<div class="flex-container p">
			<p>REVIEW</p>		
			<%-- <h3>목록갯수 : ${totalReview}</h3> --%>
		</div>
			<div class="flex-container noticeListForm">
				<!-- 리스트 -->
				<c:set var="num" value="${page.total - page.start + 1}"></c:set>
				<table>
					<colgroup>
						<col width="50">
						<col width="150">
						<col width="480">
						<col width="80">
						<col width="80">
						<col width="50">
					</colgroup>
					<tr>
						<th>번호</th>
						<th>상품정보</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
					<c:forEach var="review" items="${reviewList}">
						<tr>
							<td>${review.rq_id}</td>
							<td>
								<img style="width: 48px; height: 64px;" src="${review.stored_thumbnail}">
								${review.product_name}
							</td>
							<td>${review.rq_title}</td>
							<td>${review.rq_name}</td>
							<td>
								<fmt:formatDate value="${review.rq_date}" type="date" pattern="YYYY.MM.dd"/>
							</td>
							<td>${review.rq_readcount}</td>
						</tr>
						<c:set var="num" value="${num - 1 }"></c:set>
					</c:forEach>			
				</table>		
			</div>
			<!-- 글쓰기 버튼 -->
			<div class="flex-container writebutton">
				<!-- <button class="submit_box" type="submit" onclick="">글쓰기</button> -->
				<a href="/reviewWriteForm">
					<input class="submit_box" type="submit" value="글쓰기">
				</a>
			</div>
			<!-- 페이징 -->
			<div class="flex-container pageForm">
				<c:if test="${page.startPage > page.pageBlock}">
					<a href="review?currentPage=${page.startPage - page.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<a href="review?currentPage=${i}">[${i}]</a>
				</c:forEach>
				<c:if test="${page.endPage < page.totalPage}">
					<a href="review?currentPage=${page.startPage + page.pageBlock}">[다음]</a>
				</c:if>
			</div>		
		<!-- 검색 -->
		<div class="flex-container searchForm">
			<div class="search">
				<form action="">			
					<select id="search_name" name="search_name">
						<option>선택</option>
						<option value="subject" >제목</option>
						<option value="writer_name">작성자</option>
					</select>
					<input class="search_box" type="text" id="search" name="search">
					<button class="submit_box" type="submit" onclick="">찾기</button>
					<!-- <input class="submit_box" type="submit" value="찾기"> -->
				</form>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>