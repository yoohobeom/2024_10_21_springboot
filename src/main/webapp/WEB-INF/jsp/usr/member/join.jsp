<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<c:set var="pageTitle" value="회원가입" />

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>

<script>
	
	const joinForm_onSubmit = function(form) {
		form.joinName.value = form.joinName.value.trim();
		form.joinId.value = form.joinId.value.trim();
		form.joinPw.value = form.joinPw.value.trim();
		form.joinPwChk.value = form.joinPwChk.value.trim();
		
		if (form.joinName.value == 0) {
			alert('이름을 입력해주세요');
			form.joinName.focus();
			return;
		}
		
		if (form.joinId.value == 0) {
			alert('아이디를 입력해주세요');
			form.joinId.focus();
			return;
		}
		
		if (form.joinPw.value == 0) {
			alert('비밀번호를 입력해주세요');
			form.joinPw.focus();
			return;
		}
		
		if (form.joinPw.value != form.joinPwChk.value) {
			alert('비밀번호가 일치하지 않습니다');
			form.joinPw.value = '';
			form.joinPwChk.value = '';
			form.joinPwChk.focus();
			return;
		}
		
		form.submit();
	}
	
	const loginIdDupChk = function(el) {
		el.value = el.value.trim();
		
		$.ajax({
			url : '/usr/member/loginIdDupChk',
			type : 'GET',
			data : {
				loginId : el.value
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})
	}
	
</script>

<section class="mt-8">
	<div class="container mx-auto">
		<form action="doJoin" method="post" onsubmit="joinForm_onSubmit(this); return false;">
			<div class="table-box">
				<table>
					<tr>
						<th>성명</th>
						<td>
							<label class="input input-bordered flex items-center gap-2">
							  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70">
							    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" />
							  </svg>
							  <input type="text" name="joinName" placeholder="이름을 입력해주세요" />
							</label>
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<label class="input input-bordered flex items-center gap-2">
							  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70">
							    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6ZM12.735 14c.618 0 1.093-.561.872-1.139a6.002 6.002 0 0 0-11.215 0c-.22.578.254 1.139.872 1.139h9.47Z" />
							  </svg>
							  <input type="text" name="joinId" placeholder="아이디를 입력해주세요" onblur="loginIdDupChk(this)" />
							</label>
						</td>
					</tr>
					<tr>
					<th>비밀번호</th>
						<td>
							<label class="input input-bordered flex items-center gap-2">
							  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70">
								<path fill-rule="evenodd" d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z" clip-rule="evenodd" />
							  </svg>
							  <input type="text" name="joinPw" placeholder="비밀번호를 입력해주세요" />
							</label>
						</td>
					</tr>
					<tr>
					<th>비밀번호 확인</th>
						<td>
							<label class="input input-bordered flex items-center gap-2">
							  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="currentColor" class="h-4 w-4 opacity-70">
								<path fill-rule="evenodd" d="M14 6a4 4 0 0 1-4.899 3.899l-1.955 1.955a.5.5 0 0 1-.353.146H5v1.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-2.293a.5.5 0 0 1 .146-.353l3.955-3.955A4 4 0 1 1 14 6Zm-4-2a.75.75 0 0 0 0 1.5.5.5 0 0 1 .5.5.75.75 0 0 0 1.5 0 2 2 0 0 0-2-2Z" clip-rule="evenodd" />
							  </svg>
							  <input type="text" name="joinPwChk" placeholder="비밀번호를 입력해주세요" />
							</label>
						</td>
					</tr>
					
					
					<tr>
						<td colspan="2"><button class="btn btn-outline btn-primary">회원가입</button></td>
					</tr>
				</table>
			</div>
		</form>

		<div class="btns mt-3 text-sm flex justify-between">
			<button onclick="history.back();">
				<svg class="h-6 w-6 fill-current md:h-8 md:w-8" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
				<path d="M15.41,16.58L10.83,12L15.41,7.41L14,6L8,12L14,18L15.41,16.58Z"></path>
				</svg>
			</button>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>