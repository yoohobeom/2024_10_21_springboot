<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<!-- 테일윈드CSS -->
<script src="https://cdn.tailwindcss.com"></script>
<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.14/dist/full.min.css" rel="stylesheet" type="text/css" />
<!-- JQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />
<!-- common css -->
<link rel="stylesheet" href="/resource/common.css" />
</head>
<body>
	<div class="h-20 flex container mx-auto text-3xl">
		<div><a class="h-full px-3 flex items-center" href="${pageContext.request.contextPath}/">로고</a></div>
		<div class="grow"></div>
		<ul class="flex">
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="${pageContext.request.contextPath}/">HOME</a></li>
			<li class="hover:underline">
				<a class="h-full px-3 flex items-center" href="${pageContext.request.contextPath}/usr/article/list">LIST</a>
				<div class="dropdown dropdown-hover">
				  <div tabindex="0" role="button" class="btn m-1">Hover</div>
				  <ul tabindex="0" class="dropdown-content menu bg-base-100 rounded-box z-[1] w-52 p-2 shadow">
				    <li><a href="${pageContext.request.contextPath}/usr/article/list?boardId=1&cPage=1">공지사항</a></li>
				    <li><a href="${pageContext.request.contextPath}/usr/article/list?boardId=2&cPage=1">자유게시판</a></li>
				  </ul>
				</div>
			</li>
			<c:if test="${rq.getLoginedMemberId() == -1 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="${pageContext.request.contextPath}/usr/member/login">LOGIN</a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() != -1 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="${pageContext.request.contextPath}/usr/member/doLogout">LOGOUT</a></li>
			</c:if>
		</ul>
	</div>

	<section class="my-4 text-2xl">
		<div class="container mx-auto">
			<div>${pageTitle }</div>
		</div>
	</section>