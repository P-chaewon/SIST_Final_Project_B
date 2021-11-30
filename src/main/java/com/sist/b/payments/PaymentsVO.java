package com.sist.b.payments;

import java.sql.Date;

import com.sist.b.membership.MembershipVO;

import lombok.Data;

@Data
public class PaymentsVO {
	private Long merchant_uid;
	private Long membershipNum;
	private Long userNum;
	private Date paymentsDate;
	private String paymentsTime;
	private String applyNum;
	private Integer amount;
	private String method;
	private String paymentsCk;
	
	private MembershipVO membershipVO;
}
