<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbconnect.jsp" %>
<% 
	String sql = "INSERT INTO tbl_hitter_info VALUES('"
		+request.getParameter("registration_code")+"', '"
		+request.getParameter("game_numbers")+"', '"
		+request.getParameter("appearance")+"', '"
		+request.getParameter("hit_numbers")+"', '"
		+request.getParameter("home_runs")+"', '"
		+request.getParameter("put_out")+"', '"
		+request.getParameter("double_play")+"', '"
		+request.getParameter("error_count")+"')";
		
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
%>
<jsp:forward page="index.jsp"/>