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
<h1 class="center">개별 타자 성적 조회</h1>
<form name="frm" action="select1.jsp">
<table border=1 class="center">
	<tr>
		<td>선수 등록 코드를 입력 하시오.</td>
		<td><input type="text" name="registration_code"/></td>
	</tr>
	<tr>
		<td colspan=2>
			<button type="submit" onclick="return check()">선수조회</button>
			<button onclick="window.location = 'index.jsp'">홈으로</button>
		</td>
	</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
function check(){
	if(!frm.registration_code.value){
		alert("선수 등록 코드가 입력되지 않았습니다!");
		return false;
	}
	
}
</script>
</body>
</html>