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
<h1 class="center">타자 성적 등록</h1>
<form name="frm" action="action.jsp">
<table border=1>
	<tr>
		<td class="center">타자 선택</td>
		<td>
			<select name="registration_code">
				<option value="" selected>타자 선택</option>
				<option value="A001">[A001]김길동</option>
				<option value="A005">[A005]이길동</option>
				<option value="B002">[B002]홍길동</option>
				<option value="B006">[B006]조길동</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class="center" colspan=2>공격 포인트</td>
	</tr>
	<tr>
		<td class="center">게임 수</td>
		<td><input type="text" name="game_numbers" class="right"/>게임</td>
	</tr>
	<tr>
		<td class="center">타석 수</td>
		<td><input type="text" name="appearance" class="right"/>타수</td>
	</tr>
	<tr>
		<td class="center">안타 수</td>
		<td><input type="text" name="hit_numbers" class="right"/>안타</td>
	</tr>
	<tr>
		<td class="center">홈런 수</td>
		<td><input type="text" name="home_runs" class="right"/>홈런</td>
	</tr>
	<tr>
		<td class="center" colspan=2>수비 포인트</td>
	</tr>
	<tr>
		<td class="center">아웃 카운트 수</td>
		<td><input type="text" name="put_out" class="right"/>회</td>
	</tr>
	<tr>
		<td class="center">더블 플레이 수</td>
		<td><input type="text" name="double_play" class="right"/>회</td>
	</tr>
	<tr>
		<td class="center">에러</td>
		<td><input type="text" name="error_count" class="right"/>회</td>
	</tr>
	<tr>
		<td class="center" colspan=2>
			<button type="submit" onclick="return check()">등록</button>
			<button type="reset" onclick="rewrite()">다시쓰기</button>
		</td>
	</tr>
</table>

</form>
</section>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
function check(){
	if(!frm.registration_code.value){
		alert("타자가 선택되지 않았습니다!");
		frm.registration_code.focus()
		return false;
	}
	if(!frm.game_numbers.value){
		alert("게임 수가 입력되지 않았습니다!");
		frm.game_numbers.focus()
		return false;
	}
	if(!frm.appearance.value){
		alert("타석 수가 입력되지 않았습니다!");
		frm.appearance.focus()
		return false;
	}
	if(!frm.hit_numbers.value){
		alert("안타 수가 입력되지 않았습니다!");
		frm.hit_numbers.focus()
		return false;
	}
	if(!frm.home_runs.value){
		alert("홈런 수가 입력되지 않았습니다!");
		frm.home_runs.focus()
		return false;
	}
	if(!frm.put_out.value){
		alert("아웃 카운트 수가 입력되지 않았습니다!");
		frm.put_out.focus()
		return false;
	}
	if(!frm.double_play.value){
		alert("더블 플레이 수가 입력되지 않았습니다!");
		frm.double_play.focus()
		return false;
	}
	if(!frm.error_count.value){
		alert("에러 수가 입력되지 않았습니다!");
		frm.error_count.focus()
		return false;
	}
	alert("타자 성적 정보 등록이 완료 되었습니다!");
	return true;
}

function rewrite(){

	alert("정보를 지우고 처음부터 다시 입력합니다!");
	frm.registration_code.focus()
}
</script>
</body>
</html>