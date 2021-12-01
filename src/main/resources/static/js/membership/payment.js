/**
 * payment.js
 */

var IMP = window.IMP; // 생략 가능
IMP.init("imp91079723"); // 예: imp00000000

// 결제 관련 정보
var merchant_uid = $("#m1").val();
var name = $("#m2").val();
var amount = $("#m3").val();
var membershipNum = $("#m4").val();
var userNum = $("#m5").val();

var paymentsTime = "";

// 사용자 관련 정보
var buyer_name = "";	
var buyer_email = "";
var buyer_tel = "";

// 사용자 정보 블러 이벤트    
$(".inp").blur(function(){
	buyer_name = $("#name").val();
	buyer_email = $("#email").val();
	let tel1 = $("#tel1").val();
	let tel2 = $("#tel2").val();
	let tel3 = $("#tel3").val();
	buyer_tel = tel1 + tel2 + tel3;
});

// 결제하기 버튼 클릭 이벤트
$("#btn").click(function(){
	requestPay();
});

function requestPay() {
	// IMP.request_pay(param, callback) 결제창 호출
	IMP.request_pay({ // param
		pg: "html5_inicis",
		pay_method: "card",
		merchant_uid: merchant_uid,
		name: name,
		amount: amount,
		buyer_email: buyer_email,
		buyer_name: buyer_name,
		buyer_tel: buyer_tel,
	}, function(rsp) { // callback
		if (rsp.success) {
			// 현재 시간 계산
			var today = new Date();
			var hours = ('0' + today.getHours()).slice(-2); 
			var minutes = ('0' + today.getMinutes()).slice(-2);
			var seconds = ('0' + today.getSeconds()).slice(-2);
			var paymentsTime = hours + ':' + minutes  + ':' + seconds;

			// 결제 성공 시 로직
			var msg = '결제가 완료되었습니다.';
			msg += '고유ID : ' + rsp.imp_uid;
			msg += '상점 거래ID : ' + rsp.merchant_uid;
			msg += '결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num;
			let paymentsVo = {
				merchant_uid: rsp.merchant_uid,
				membershipNum: membershipNum,
				userNum: userNum,
				paymentsTime: paymentsTime,
				applyNum: rsp.apply_num,
				amount: rsp.paid_amount,
				method: rsp.pay_method,
				paymentsCk: 'y',
			}
			// 컨트롤러에 데이터를 전달하여 DB에 입력하는 로직
            // 결제내역을 사용자에게 보여주기 위해 필요
            $.ajax({
				url : "./placeorder.do",
				type : "get",
				data : paymentsVo,
				dataType : "text",
				success : function(result) {
					result = result.trim();
					
					if (result == "y") {
						alert(msg);
						location.href = "../"; 
					} else {
						alert("디비입력실패");
						return false;
					}
				},
				error : function(a,b,c){}
			});
		} else {
			// 현재 시간 계산
			var today = new Date();
			var hours = ('0' + today.getHours()).slice(-2); 
			var minutes = ('0' + today.getMinutes()).slice(-2);
			var seconds = ('0' + today.getSeconds()).slice(-2);
			var paymentsTime = hours + ':' + minutes  + ':' + seconds;

			let paymentsVo = {
				merchant_uid: rsp.merchant_uid,
				membershipNum: membershipNum,
				userNum: userNum,
				paymentsTime: paymentsTime,
				applyNum: rsp.error_msg,
				amount: amount,
				method: rsp.pay_method,
				paymentsCk: 'n',
			}
			
			$.ajax({
				url : "./placeorder.do",
				type : "get",
				data : paymentsVo,
				dataType : "text",
				success : function(result) {
					result = result.trim();
					// 결제 실패 시 로직
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
					location.href = "../";
				},
				error : function(a,b,c){}
			});
		}
	});
}