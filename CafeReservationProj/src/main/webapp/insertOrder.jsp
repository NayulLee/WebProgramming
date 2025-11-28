<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8"); 

    
    String customerName = request.getParameter("customer_name");
    String customerPhone = request.getParameter("customer_phone");
    String menuName = request.getParameter("menu_name");
    String sizeCode = request.getParameter("size_code");
    String temperature = request.getParameter("temperature");
    String requestMessage = request.getParameter("request_message");
    
    // 수량과 단가는 숫자로 변환
    int quantity = Integer.parseInt(request.getParameter("quantity"));
    int unitPrice = Integer.parseInt(request.getParameter("unit_price")); // hidden 필드에서 가져옴

    // 총 금액 계산
    int totalPrice = quantity * unitPrice;
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    String DB_URL = "jdbc:mysql://localhost:3306/JSPBookDB?serverTimezone=UTC";
    String DB_USER = "root";
    String DB_PASS = "1234";
    
    String resultMessage = "";

    try {
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
        
        // SQL 실행
        String sql = "INSERT INTO cafe_orders (customer_name, customer_phone, menu_name, size_code, temperature, "
                   + "quantity, unit_price, total_price, request_message) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        pstmt = conn.prepareStatement(sql);
        
        // 데이터 매핑
        pstmt.setString(1, customerName);
        pstmt.setString(2, customerPhone);
        pstmt.setString(3, menuName);
        pstmt.setString(4, sizeCode);
        pstmt.setString(5, temperature);
        pstmt.setInt(6, quantity);
        pstmt.setInt(7, unitPrice);
        pstmt.setInt(8, totalPrice);
        pstmt.setString(9, requestMessage);
        
        //쿼리 실행
        int rowsAffected = pstmt.executeUpdate();
        
        if (rowsAffected > 0) {
            resultMessage = "주문이 성공적으로 접수되었습니다. (총액: " + totalPrice + "원)";
        } else {
            resultMessage = "주문 접수에 실패했습니다.";
        }

    } catch (SQLException e) {
        resultMessage = "데이터베이스 오류가 발생했습니다: " + e.getMessage();
        e.printStackTrace();
    } catch (ClassNotFoundException e) {
        resultMessage = "JDBC 드라이버를 찾을 수 없습니다. 라이브러리를 확인하세요.";
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 결과</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>주문 처리 결과</h1>
        <p><%= resultMessage %></p>
        
        <p><a href="listOrder.jsp">주문 목록 확인하기</a></p>
        <p><a href="orderForm.jsp">새 주문하기</a></p>
    </div>
</body>
</html>