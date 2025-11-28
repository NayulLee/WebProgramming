function validateForm() {
    // 1. 폼 데이터 가져오기
    const name = document.getElementById("customer_name").value.trim();
    const phone = document.getElementById("customer_phone").value.trim();
    const menu = document.getElementById("menu_name").value;
    const quantity = parseInt(document.getElementById("quantity").value);
    
    const sizeRadios = document.getElementsByName("size_code");
    const tempRadios = document.getElementsByName("temperature");
    
    let isSizeSelected = false;
    let isTempSelected = false;

    // 필수 항목 공란 확인 (이름, 연락처)
    if (name === "") {
        alert("이름을 입력해주세요.");
        document.getElementById("customer_name").focus();
        return false;
    }
    
    if (phone === "") {
        alert("연락처를 입력해주세요.");
        document.getElementById("customer_phone").focus();
        return false;
    }
    
    // 필수 선택 항목 체크 (메뉴)
    if (menu === "") {
        alert("메뉴를 선택해주세요.");
        document.getElementById("menu_name").focus();
        return false;
    }

    // 필수 선택 항목 체크 (사이즈)
    for (let i = 0; i < sizeRadios.length; i++) {
        if (sizeRadios[i].checked) {
            isSizeSelected = true;
            break;
        }
    }
    if (!isSizeSelected) {
        alert("사이즈를 선택해주세요.");
        return false;
    }

    // 필수 선택 항목 체크 (온도)
    for (let i = 0; i < tempRadios.length; i++) {
        if (tempRadios[i].checked) {
            isTempSelected = true;
            break;
        }
    }
    if (!isTempSelected) {
        alert("온도를 선택해주세요.");
        return false;
    }
    
    // 수량 범위 검증 (1 이상)
    if (isNaN(quantity) || quantity < 1) {
        alert("수량을 1개 이상 입력해주세요.");
        document.getElementById("quantity").focus();
        return false;
    }

    return true;
}

// 가격 계산

document.addEventListener('DOMContentLoaded', function() {
    const menuSelect = document.getElementById('menu_name');
    const unitPriceInput = document.getElementById('unit_price');
    const quantityInput = document.getElementById('quantity');
    
    function updatePrice() {
        const selectedOption = menuSelect.options[menuSelect.selectedIndex];
        // data-price 속성에서 단가를 가져오기
        const price = selectedOption.getAttribute('data-price') || 0; 
        
        // unit_price hidden 필드 업데이트
        unitPriceInput.value = price;
    }

    // 메뉴가 바뀔 때 가격 업데이트
    menuSelect.addEventListener('change', updatePrice);
    
    // 페이지 로드 시 초기 가격 설정
    updatePrice();
});