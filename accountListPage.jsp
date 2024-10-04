<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%-- 데이터베이스로부터 오는 값을 받아주는 라이브러리 --%>
<%@ page import="java.sql.ResultSet" %>

<%
    // DB Connector 찾아오기
    Class.forName("org.mariadb.jdbc.Driver");

    // DB 통신 연결
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web", "stageus", "1234");

    // SQL 작성
    String sql = "SELECT * FROM account";

    // SQL 전송 준비 상태로 만들기
    PreparedStatement query = connect.prepareStatement(sql);

    // Query 전송
    ResultSet result = query.executeQuery();
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<% while(result.next()) { %>
    <div>
        <span><%=result.getString("id")%></span>
        <span><%=result.getString("pw")%></span>
    </div>
<% } %>

</body>