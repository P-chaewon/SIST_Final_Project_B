<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<span>멤버십: ${paymentsVO.membershipNum}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span>사용자: ${paymentsVO.userNum}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span>결제일: ${paymentsVO.paymentsDate}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span>결제시각: ${paymentsVO.paymentsTime}</span><br><br>
	<span>승인번호: ${paymentsVO.applyNum}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span>금액: ${paymentsVO.amount}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span>결제수단: ${paymentsVO.method}</span>
</div>