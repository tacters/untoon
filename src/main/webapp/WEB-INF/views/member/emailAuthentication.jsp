<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
</head>
<body>

	<table border="1" width="300" height="300" align="center">
		<center>
			<span style="color: green; font-weight: bold;">인증번호를 입력하세요.</span> 
			<br> <br> <br><br>
			<div style="text-align: center;">
				<tr>
					<td>
						<center>
							<form action="email.do" method="post">
								<!-- 받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인 -->
								<center>
									<br>
									<div>
										인증번호 입력 : <input type="number" name="email_cert"
											placeholder="  인증번호를 입력하세요. "> &nbsp;
										<button type="submit" name="submit">인증번호 전송</button>
									</div>

			</div>
			</td>
			</tr>
		</center>
	</table>
	</form>
	</center>
</body>
</html>