<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%-- Connector파일을 찾아오는 라이브러리 --%>
<%@ page import="java.sql.DriverManager" %>
<%-- DB에 연결하는 라이브러리 --%>
<%@ page import="java.sql.Connection" %>
<%-- SQL을 만들어주는 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>

<%-- 백엔드 통신 --%>

<%
    // JSP 문법을 적을 수 있는 공간

    request.setCharacterEncoding("utf-8");   // 받아온 값에 대한 인코딩 설정
    String idValue = request.getParameter("id");
    String pwValue = request.getParameter("pw");

    // DB Connector 찾아오기
    Class.forName("org.mariadb.jdbc.Driver");

    // DB 통신 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web", "stageus", "1234");

    // SQL 작성
    String sql = "INSERT INTO account (id, pw) VALUES (?, ?)";

    // SQL 전송 준비 상태로 만들기
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, idValue);
    query.setString(2, pwValue);

    // Query 전송
    query.executeUpdate();
%>

<script>
    alert("회원가입이 성공하였습니다 !")
    location.href = "index.html"
</script>