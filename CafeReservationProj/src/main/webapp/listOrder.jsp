<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
  
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null; 
    
    String DB_URL = "jdbc:mysql://localhost:3306/JSPBookDB?serverTimezone=UTC";
    String DB_USER = "root";
    String DB_PASS = "1234";
    
    String sql = "SELECT * FROM cafe_orders ORDER BY order_time DESC";

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 목록 조회</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* listOrder.jsp만을 위한 테이블 스타일 추가 */
        table {
            width: 90%;
            border-collapse: collapse; /* 셀 경계선을 합침 */
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; /* 짝수 행 배경색 */
        }
    </style>
</head>
<body>
    <h1>☕ 캠퍼스 카페 주문 목록</h1>
    
    <table>
        <thead>
            <tr>
                <th>No.</th>
                <th>주문자</th>
                <th>연락처</th>
                <th>메뉴</th>
                <th>사이즈</th>
                <th>온도</th>
                <th>수량</th>
                <th>총액</th>
                <th>요청사항</th>
                <th>주문시간</th>
            </tr>
        </thead>
        <tbody>
        <% 
        
            if (rs != null) {
                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("order_id") %></td>
                <td><%= rs.getString("customer_name") %></td>
                <td><%= rs.getString("customer_phone") %></td>
                <td><%= rs.getString("menu_name") %></td>
                <td><%= rs.getString("size_code") %></td>
                <td><%= rs.getString("temperature") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><%= rs.getInt("total_price") %></td>
                <td><%= rs.getString("request_message") != null ? rs.getString("request_message") : "-" %></td>
                <td><%= rs.getTimestamp("order_time") %></td>
            </tr>
        <% 
                } // end while
            } else {
        %>
            <tr>
                <td colspan="10">현재 접수된 주문이 없습니다.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    
    <p><a href="orderForm.jsp">새 주문 등록하기</a></p>

<%
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>