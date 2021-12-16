<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user.css">

		<div style="width: 100%; height: 100%;">
			<div style="width: 100%; height: 100%;">
				<section class="mail-section">
					<div></div>
					<main class="mail-main" role="main">
						<div class="mail-confirmation" style="min-height: 100%;">
							<div class="confirmation-space">
								<div class="confirmation">
									<h1 class="sns-txt">Instagram</h1>
									<div class="confirmation-txt" style="max-width: 350px;">
										<img alt="" src="${pageContext.request.contextPath}/static/icons/mail.png" >
										<div class="mail-txt-space">
											<div class="code-input-txt">인증 코드 입력</div>
										</div>
										<div class="rt-space">
											<div class="send-mail">
												${param.email} 주소로 전송된 인증 코드를 입력하세요.
											</div>
										</div>
									</div>
									<div class="mail-form-space" style="width: 100%;">
										<form method="POST">
											<div class="confirmation-form" style="max-width: 350px;">
												<div class="confirmation-code" style="width: 100%;">
													<input type="hidden" name="username" id="username" value="${param.username}">
													<input aria-label="인증 코드" class="mail-code" maxlength="6" name="authkey" id="authkey" placeholder="인증 코드" type="text">
												</div>
												<div class="next-space" style="width: 100%;">
													<button class="next-btn" disabled="disabled" type="button">다음</button>
												</div>
												<div class="back-space">
													<button class="back-btn" type="button">돌아가기</button>
												</div>
												<div class="code-error">
													<div class="code-error-txt">
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="input-part">
									<div class="link-space">
										<p class="link-account">
											계정이 있으신가요? 
											<a href="/gram/account/login" tabindex="0" >
												<span class="link-name">로그인</span>
											</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</main>
					<c:import url="../temp/footer.jsp"></c:import>
				</section>
			</div>
		</div>
	<script>
		$(".back-btn").on("click", function () {
			location.href = "/gram/account/signup";	
		})
		
		$("#authkey").on("focus", function () {
			$(this).addClass("mail-code-focus");
		})
		
		$("#authkey").on("blur", function () {
			$(this).removeClass("mail-code-focus");
		})
		
		$("#authkey").on("input", function () {
			let authkey = $(this).val();
			if(authkey!=""){
				$(".next-btn").removeAttr("disabled");				
			} else {
				$(".next-btn").attr("disabled", "disabled");
			}
		})
		
		$(".next-btn").on("click", function () {
			let username = $("#username").val();
			let authkey = $("#authkey").val();
			$.ajax({
				type : "POST",
				url : "/gram/account/mail",
				data : {
					username : username,
					authkey : authkey
				},
				success : function (result) {
					result = result.trim();
					if(result!=""){
						$(".code-error-txt").html(result);
					} else {
						clause(username);
					}
				}
			})
		})
		
		function clause(username) {
			$.ajax({
				type : "GET",
				url : "/gram/account/clause",
				data : {
					username : username
				},
				success : function (result) {
					result = result.trim();
					$("#react-root").html(result);
				},
				error : function (error, xhr, status) {
					console.log("error 발생");
				}
				
			})
		}
		
	</script>