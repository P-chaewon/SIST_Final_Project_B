<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<c:import url="../temp/admin_nav.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="../static/css/membership/payment.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
	<main class="wrapper">
		<h1 id="title">결제하기</h1>
		<hr>
		
		<h1 id="membershipName">${membershipVO.membershipName}</h1>
		<div id="membershipAmount">${membershipVO.membershipAmount}원</div>
		
		<table>
			<tr>
				<td class="t">수량</td>
				<td class="c">1개</td>
			</tr>
			<tr>
				<td class="t">할인금액</td>
				<td class="c">0원</td>
			</tr>
			<tr>
				<td class="t">할인적용금액</td>
				<td class="c">${membershipVO.membershipAmount}원</td>
			</tr>
		</table>
		<hr>
		
		<button onclick="requestPay()">결제하기</button>
	</main>
	
	<script type="text/javascript">
		var IMP = window.IMP; // 생략 가능
	    IMP.init("imp91079723"); // 예: imp00000000
	    
	    function requestPay() {
	        // IMP.request_pay(param, callback) 결제창 호출
	        IMP.request_pay({ // param
	            pg: "html5_inicis",
	            pay_method: "card",
	            merchant_uid: "ORD20180131-0000011",
	            name: "${membershipVO.membershipName}",
	            amount: ${membershipVO.membershipAmount},
	            buyer_email: "gildong@gmail.com",
	            buyer_name: "홍길동",
	            buyer_tel: "010-4242-4242",
	            buyer_addr: "서울특별시 강남구 신사동",
	            buyer_postcode: "01181"
	        }, function (rsp) { // callback
	            if (rsp.success) {
	            	jQuery.ajax({
	                    url: "{서버의 결제 정보를 받는 endpoint}", // 예: https://www.myservice.com/payments/complete
	                    method: "POST",
	                    headers: { "Content-Type": "application/json" },
	                    data: {
	                        imp_uid: rsp.imp_uid,
	                        merchant_uid: rsp.merchant_uid
	                    }
	                }).done(function (data) {
	                  // 가맹점 서버 결제 API 성공시 로직
	                  alert("결제에 성공하였습니다.");
	                  location.href="./list";
	                })
	            } else {
	            	alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	            }
	        });
	      }
	</script>
</body>
</html>