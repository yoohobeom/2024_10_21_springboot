<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="상세보기" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
<section>
	<div class="table-box">
		<table>
			<tr>
				<th>번호</th>
				<td>${foundArticle.getId() }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${foundArticle.getRegDate().substring(2, 16) }</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>${foundArticle.getUpdateDate().substring(2, 16) }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${foundArticle.getLoginId() }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${foundArticle.getTitle() }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${foundArticle.getBody() }</td>
		</table>
	</div>

	<div class="pt-2">
		<button class="a rounded-lg bg-green-600" onclick="history.back();">뒤로가기</button>
	</div>
</section>
<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>