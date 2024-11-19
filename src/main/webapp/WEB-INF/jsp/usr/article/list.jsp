<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="${board.getName() }" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section class="mt-8">
	<div class="container mx-auto text-sm">
		<div class= "mx-auto">
			<div>총 : ${articlesCnt }개</div>
		</div>
		<div class="table-box">
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articles }">
						<tr class="hover">
							<td>${article.getId() }</td>
							<td class="hover:underline"><a
								href="detail?id=${article.getId() }">${article.getTitle() }</a></td>
							<td>${article.getLoginId() }</td>
							<td>${article.getRegDate().substring(2,16) }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<c:if test="${rq.getLoginedMemberId() != -1 }">
			<div class="flex justify-end my-3">
				<a class="btn bten-active btn-sm" href="write">글쓰기</a>
			</div>
		</c:if>
		
		<div>
			<div>
				<c:if test="${from != 1 }">
					<a href="?boardId=${param.boardId }&cPage=${from - 1 }">이전</a>			
				</c:if>
			
				<c:forEach var="i" begin="${from }" end="${end }">
					<a href="?boardId=${param.boardId }&cPage=${i }">${i }</a>
				</c:forEach>
				
				<c:if test="${end != totalPagesCnt }">
					<a href="?boardId=${param.boardId }&cPage=${end + 1 }">다음</a>
				</c:if>
			</div>		
		</div>
		
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>