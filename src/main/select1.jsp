<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconnect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>
<%
	String registration_code = request.getParameter("registration_code");
	String sql = "SELECT registration_code, name, game_numbers, appearance, hit_numbers, home_runs, ((hit_numbers+home_runs)/appearance)*100+home_runs, put_out, double_play, double_play, (put_out + (double_play*2) - (error_count*5)) FROM tbl_hitter_info NATURAL JOIN tbl_player_info WHERE registration_code = '"
		+ registration_code + "'";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
%>
	<h1 class="center">선수 등록 코드 : <%= registration_code %> 성적 조회</h1>
	<table border=1 class="center">
		<tr>
			<td>선수 등록 코드</td>
			<td>선수명</td>
			<td>게임수</td>
			<td>타석수</td>
			<td>안타수</td>
			<td>홈런수</td>
			<td>공격포인트</td>
			<td>아웃 카운트 수</td>
			<td>더블 플레이 수</td>
			<td>에러 수</td>
			<td>수비 포인트</td>
		</tr>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=String.format("%.2f", rs.getFloat(7)) %></td>
			<td><%=rs.getString(8) %></td>
			<td><%=rs.getString(9) %></td>
			<td><%=rs.getString(10) %></td>
			<td><%=rs.getString(11) %></td>
		</tr>
		
	</table>
<%
	} else {
%>
	<h1 class="center">선수 등록 코드 : <%= registration_code %> 성적 조회 결과가 없습니다.</h1>
<%
	}
%>
<div class="center"><button onclick="window.location='search.jsp'">돌아가기</button></div>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>