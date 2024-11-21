<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<script>
	constreplyForm_onSubmit = function(form) {
		form.body.value = form.body.value.trim();
		
		if (form.body.value.length == 0) {
			alert('내용을 입력해주세요');
			form.body.focus();
			return;
		}
		
		form.submit();
	}
</script>

<section class="mt-8">
	<div class="container mx-auto">
		<div class="table-box">
			<table>
				<tr>
					<th>번호</th>
					<td>${article.getId() }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${article.getRegDate().substring(2, 16) }</td>
				</tr>
				<tr>
					<th>수정일</th>
					<td>${article.getUpdateDate().substring(2, 16) }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${article.getLoginId() }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${article.getTitle() }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${article.getBody() }</td>
				</tr>
			</table>
		</div>
		
		<div class="btns mt-3 text-sm flex justify-between">
			<div>
				<button class="btn bten-active btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
			<c:if test="${rq.getLoginedMemberId() == article.getMemberId() }">
				<div>
				<a class="btn bten-active btn-sm" href="modify?id=${article.getId() }">수정</a>
				<a class="btn bten-active btn-sm" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="doDelete?id=${article.getId() }">삭제</a>
				</div>
			</c:if>
		</div>
		
		<form action="doReply" method="post" onsubmit="replyForm_onSubmit(this); return false;">
			<div>
				<input type="hidden" name="articleId" value=${article.getId() } />
				<textarea class="textarea textarea-bordered" name="body" placeholder="댓글을 입력해주세요"></textarea>
				<button class="btn btn-active">확인</button>
			</div>
		</form>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>