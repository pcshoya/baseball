<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
Connection conn = null;
try {
    Class.forName("oracle.jdbc.OracleDriver");
    String url = "jdbc:oracle:thin:@//localhost:1521/XE"; // 포트·서비스명 환경에 맞게
    conn = DriverManager.getConnection(url, "system", "1234");
    out.println("데이터베이스 접속에성공했습니다.");
} catch (Throwable t) {
    t.printStackTrace(new java.io.PrintWriter(out)); // 예외 전체 출력
} finally {
    if (conn != null) try { conn.close(); } catch (Exception ignore) {}
}
%>