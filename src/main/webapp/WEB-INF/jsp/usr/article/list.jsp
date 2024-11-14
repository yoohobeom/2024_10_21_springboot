<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>

<c:set var="pageTitle" value="목록"/>

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<section>
	<div class="table-box">
	<%--<ul>
			 <c:forEach var="i" begin="0" end="2"> 
			 <li>${articles.get(i).getId() } | ${articles.get(i).getTitle() } | ${articles.get(i).getLoginId() } | ${articles.get(i).getRegDate() }</li> 
			 </c:forEach> 
			 
			<c:forEach var="article" items="${articles }">
				<li>${article.getId() }| ${article.getTitle() } |
					${article.getLoginId() } | ${article.getRegDate().substring(2,16) }</li>
			</c:forEach>
		</ul>--%>
	<table>
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
				<tr>
					<td>${article.getId() }</td>
					<td><a href="/usr/article/detail?id=${article.getId() }">${article.getTitle() }</a></td>
					<td>${article.getLoginId() }</td>
					<td>${article.getRegDate().substring(2,16) }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp"%>