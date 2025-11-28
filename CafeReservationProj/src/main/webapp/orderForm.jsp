<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠퍼스 카페 주문 시스템</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<h1>캠퍼스 카페 주문하기</h1>

	<form action="insertOrder.jsp" method="post" id="orderForm"
		onsubmit="return validateForm()">

		<fieldset>
			<legend>주문자 정보</legend>

			<label for="customer_name">이름:</label> <input type="text"
				id="customer_name" name="customer_name" placeholder="주문자 이름"
				required><br> <label for="customer_phone">연락처:</label>
			<input type="text" id="customer_phone" name="customer_phone"
				placeholder="010-1234-5678" required><br>
		</fieldset>

		<fieldset>
			<legend>메뉴 선택</legend>

			<label for="menu_name">메뉴:</label> <select id="menu_name"
				name="menu_name" required>
				<option value="">-- 메뉴를 선택하세요 --</option>
				<option value="아메리카노" data-price="2500">아메리카노</option>
				<option value="카페 라떼" data-price="3500">카페 라떼</option>
				<option value="딸기 프라페" data-price="4000">딸기 프라페</option>
			</select><br> <label>사이즈:</label>
			<div class="radio-group">
				<input type="radio" id="size_s" name="size_code" value="S">
				<label for="size_s">S</label> <input type="radio" id="size_m"
					name="size_code" value="M"> <label for="size_m">M</label> <input
					type="radio" id="size_l" name="size_code" value="L" checked>
				<label for="size_l">L</label> <input type="radio" id="size_g"
					name="size_code" value="G"> <label for="size_g">G</label> <input
					type="radio" id="size_x" name="size_code" value="X"> <label
					for="size_x">X</label>
			</div>
			<br> <label>온도:</label>
			<div class="radio-group">
				<input type="radio" id="temp_h" name="temperature" value="H">
				<label for="temp_h">Hot</label> <input type="radio" id="temp_i"
					name="temperature" value="I" checked> <label for="temp_i">Ice</label>
			</div>
			<br> <label for="quantity">수량:</label> <input type="number"
				id="quantity" name="quantity" min="1" value="1" required><br>

			<label for="request_message">요청사항:</label>
			<textarea id="request_message" name="request_message" rows="3"
				placeholder="예: 시럽 적게, 얼음 많이"></textarea>
			<br> <input type="hidden" id="unit_price" name="unit_price"
				value="2500">

		</fieldset>

		<div class="button-group">
			<button type="submit">주문하기</button>
			<button type="reset">초기화</button>
		</div>
	</form>

	<p>
		<a href="listOrder.jsp">주문 목록 조회하기</a>
	</p>

	<script src="js/validate.js"></script>
</body>
</html>