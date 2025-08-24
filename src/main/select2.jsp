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
	<h1 class="center">전체 타자 성적 조회</h1>
	<table border=1 class="center">
		<tr>
			<td>선수 등록 코드</td>
			<td>선수명</td>
			<td>생년월일</td>
			<td>키</td>
			<td>몸무게</td>
			<td>소속</td>
			<td>선수등급</td>
			<td>순위</td>
		</tr>
<%
	String registration_code = request.getParameter("registration_code");
	String sql = "SELECT registration_code, name, birth_day, height, weight, ROUND(((((hit_numbers+home_runs)/appearance)*100+home_runs) + (put_out + (double_play*2) - (error_count*5)))/2) as point FROM tbl_player_info NATURAL JOIN tbl_hitter_info ORDER BY point DESC";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	int i = 0;
	while(rs.next()){
		String birth = rs.getString(3);
		i+=1;
%>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=birth.substring(0, 4) %>년<%=birth.substring(4, 6) %>월<%=birth.substring(6, 8) %>일</td>
			<td><%=rs.getString(4) %></td>
			<td class="right"><%=rs.getString(5) %></td>
			<td class="right"><%= rs.getString(1).substring(0, 1).equals("A")? "1군":"2군" %></td>
			<td><%= rs.getInt(6)>=90? "A":(rs.getInt(6)>=80? "B":(rs.getInt(6)>=70? "C":(rs.getInt(6)>=60? "D":"F"))) %></td>
			<td><%=i %></td>
		</tr>
		
<%
	}
%>
	</table>
<div class="center"><button onclick="window.location='search.jsp'">돌아가기</button></div>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>