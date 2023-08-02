<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/main.css">
</head>
<body>

	<h1>마이 페이지</h1>
	<form action = "/member/update.do"  method = "post">
	

	<fieldset>
		<legend>회원 상세 정보</legend>


		<ul>
			<li><label for="member-id"> 아이디</label> <input type="text"
				id="member-id" name="member-id" value="${member.memberId}" readonly></li>
			<li><label for="member-pw"> 비밀번호 </label> <input type="password"
				id="member-pw" name="member-pw"></li>
			<li><label for="member-name"> 이름</label> <input type="text"
				id="member-name" name="member-name" value="${member.memberName}"
				readonly></li>
			<li><label for="member-age"> 나이</label> <input type="text"
				id="member-age" name="member-age" value="${member.memberAge}"
				></li>
			<li><label for="member-gender"> 성별</label>
			<input type="hidden" id ="member-gender" name = "member-gender" value = "${member.memberGender }">
			<c:if test = "${member.memberGender eq 'M'}">남자</c:if>
			<c:if test = "${member.memberGender eq 'F'}">여자</c:if>
			
			
			
<%-- 			<c:if test = ${member.memberGender eq 'F' }> checked</c:if>> --%>
<!-- 			남 <input type="radio" id="member-gender" name="member-gender" value="M" 		> -->
<!-- 				 여 <input type="radio" name="member-gender" value="F"> 		</li> -->
				
			<li><label for="member-email"> 이메일</label> <input type="text"
				id="member-email" name="member-email" value="${member.memberEmail}"
				></li>
			<li><label for="member-addr"> 주소</label> <input type="text"
				id="member-addr" name="member-addr" value="${member.memberAddress}"
				></li>
			<li><label for="member-phone"> 전화번호</label> <input type="text"
				id="member-phone" name="member-phone" value="${member.memberPhone}"
			></li>
			<li><label for="member-hobby"> 취미</label> <input type="text"
				id="member-hobby" name="member-hobby" value="${member.memberHobby}"
				></li>
			<li><label for="member-hobby"> 가입 날짜 </label> <input type="text"
				id="member-hobby" name="member-date" value="${member.memberDate}"
				readonly></li>

		</ul>

	</fieldset>
	<div>
		<button type="submit">수정하기</button>
		<a href="javascript:void(0)" onclick="checkDelete()"
			id="infoSet">탈퇴하기</a>

	</div>
	
	</form>
	<script>
	// /member/delete.do?memberId=${sessionScope.memberId}
		function checkDelete() {
			const memberId = "${sessionScope.memberId}";
			if (confirm("탈퇴 하시겠습니까?")){
				location.href = "/member/delete.do?memberId="+memberId;
				
			}	
		}
	</script>
</body>
</html>