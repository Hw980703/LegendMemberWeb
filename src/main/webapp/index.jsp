<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전설의 멤버 웹</title>
</head>
<body>
	<h1>레전드 멤버 웹</h1>
	<h2>Login Page</h2>
	<c:if test="${sessionScope.memberId ne null }"> 
	${memberName}님 환영합니다!! <a href="/member/logout.do">로그아웃</a>
	<a href = "/member/myInfo.do?member-id=${memberId}">마이 페이지</a>


	</c:if>
	<c:if test="${memberId eq null }">

		<fieldset>
			<legend>Login</legend>
			<form action="/member/login.do" method="post">
				<input type="text" id="member-id" name="member-id"><br>
				<input type="password" id="member-pw" name="member-pw"><br>
				<div>
					<input type="submit" value="로그인"> <input type="reset"
						value="취소">
						<a href="/member/enroll.jsp">회원가입</a>

				</div>


			</form>
		</fieldset>

	</c:if>

</body>
</html>