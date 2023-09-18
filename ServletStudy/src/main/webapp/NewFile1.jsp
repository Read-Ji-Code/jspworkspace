<%@page import="java.sql.Date"%>
<%@page page import="java.sql.ResultSet"%>
<%@page page import="java.sql.Connection"%>
<%@page page import="java.sql.Statement"%>
<%@page page import="common.JDBConnect"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
    <title>JDBC</title>
</head>
<body>
    <h2>회원 목록 조회 테스트 (executeQuery() 사용)</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Password</th>
            <th>Name</th>
            <th>Registration Date</th>
        </tr>
        <%
        
        JDBConnect jdbc = new JDBConnect();
        Connection con = jdbc.getConnection();
        {
            String sql = "select id, pass, name, regidate from member";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String id = rs.getString(1);
                String pw = rs.getString(2);
                String name = rs.getString("name");
                Date regidate = rs.getDate("regidate");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= pw %></td>
            <td><%= name %></td>
            <td><%= regidate %></td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
        }
        %>
    </table>

    <h2>게시물 목록 조회 테스트 (executeQuery() 사용)</h2>
    <table border="1">
        <tr>
            <th>Title</th>
            <th>Content</th>
            <th>ID</th>
            <th>Post Date</th>
        </tr>
        <%
        {
            String sql = "select title, content, id, postdate from board";
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String title = rs.getString(1);
                String content = rs.getString(2);
                String id = rs.getString(3);
                Date postdate = rs.getDate(4);
        %>
        <tr>
            <td><%= title %></td>
            <td><%= content %></td>
            <td><%= id %></td>
            <td><%= postdate %></td>
        </tr>
        <%
            }
            rs.close();
            stmt.close();
        }
        jdbc.close();
        %>
    </table>
</body>
</html>
