<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="마이페이지" />

<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<section class="mt-8">
	<div class="container mx-auto">
		<div class="table-box">
			<table>
				<tr>
					<th>번호</th>
					<td></td>
				</tr>
				<tr>
					<th>가입날짜</th>
					<td></td>
				</tr>
				<tr>
					<th>정보수정일</th>
					<td></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td></td>
				</tr>
				<tr>
					<th>성명</th>
					<td></td>
				</tr>
			</table>
		</div>
		
		<div class="btns mt-3 text-sm flex justify-between">
			<div>
				<button class="btn bten-active btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
			<c:if test="${rq.getLoginedMemberId() == article.getMemberId() }">
				<div>
				<a class="btn bten-active btn-sm" href="modify?id=${article.getId() }">비밀번호변경</a>
				<a class="btn bten-active btn-sm" onclick="if(confirm('정말 삭제하시겠습니까?') == false) return false;" href="doDelete?id=${article.getId() }">삭제</a>
				</div>
			</c:if>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>