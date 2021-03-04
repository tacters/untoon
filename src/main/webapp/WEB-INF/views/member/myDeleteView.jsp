<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<c:import url="../member/myPageheader.jsp"/>  
	<br><br><br><br>
	
	<h2 style="text-align: center;">탈퇴하시기전에 한번 더 생각해보시고 <br> 
		탈퇴하시길 바라겠습니다.<br><br>  
		 그동안 이용해주셔서 감사합니다.<br><br>
	</h2>
		<table colspan="2" align="center">	
			<tr>
					<td>
						<c:url var="mdelete" value="mdelete.do">
							<c:param name="id" value="${ loginUser.id }"/>
						</c:url>
						<button type="button" onclick="location.href='${ mdelete }';">탈퇴하기</button>
						<%-- <button type="button" onclick="location.href='${ mdelete }';">탈퇴하기</button> --%>
						<input type="button" value="취소하기" onclick="location.href='home.do'">
					</td>
			</tr>
		</table>
		<c:import url="../common/footer.jsp"/>
</body>
</html>