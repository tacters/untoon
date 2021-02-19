<%@page import="java.util.StringTokenizer"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UNTOON 언투온택터즈</title>
</head>
<body>
	<%
		String clientId = "tnz4Oa6fZlcpvi3HDP0F";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "0WYBTjL1P1";//애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("http://localhost:8745/untoon", "UTF-8");
	String apiURL;
	apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	apiURL += "client_id=" + clientId;
	apiURL += "&client_secret=" + clientSecret;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&code=" + code;
	apiURL += "&state=" + state;
	String access_token = "";
	String refresh_token = "";
	System.out.println("apiURL=" + apiURL);
	String tokenStr = null;
	try {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;
		System.out.print("responseCode=" + responseCode);
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
		
		//토큰 값 추출
		String resStr = res.toString();
		StringTokenizer stok = new StringTokenizer(resStr, ":");
		for (int i=0; i<2; i++) {
			if(i==1) {
				tokenStr = stok.nextToken();
			}else {
				stok.nextToken();
			}
        }
		
		String[] array = tokenStr.split("\"");
		for(int i=1; i<2;i++){
			 tokenStr = array[i];
			 System.out.println(tokenStr);
		}
		
		if (responseCode == 200) {
			System.out.println(resStr);
			System.out.println("토큰값 추출 : " + tokenStr);
			System.out.println("===================NaverLogin.jsp========================");
		}
	} catch (Exception e) {
		System.out.println(e);
	}
 %>
 
	<br>
	<br>
	<br>
	<br>  
	<div align="center">
		<form action="/nongbu/NaverLogin" method="post">
			<input type="hidden" name="token" value="<%= tokenStr %>">
			<input type="submit" value="네이버 아이디로 로그인하기">
		</form>
	</div>
</body>
</html>