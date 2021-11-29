<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/head.jsp"></c:import>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user.css">
</head>
<body class="" style=""> 
	<div id="react-root">
		<section class="clause-section">
			<div></div>
			<main class="clause-main" role="main">
				<div class="clause-agree-space" style="min-height: 100%;">
					<div class="clause">
						<div class="agreement">
							<div class="clause-space" style="max-width: 350px;">
								<div class="clause-name">
									<div class="clause-txt">
										이용 약관에 동의
									</div>
								</div>
								<div class="agreement-txt-space">
									<div class="agreement-txt">
										Instagram은 회원님의 개인 정보를 안전하게 보호합니다. 새 계정을 만들려면 모든 약관에 동의하세요.
									</div>
								</div>
								<div class="agreement-box" style="width: 100%;">
									<div aria-labelledby="f2ea7080328eea4 f1ace36bc7307a8 f220922a16ff034 fd3a4a6bfa8438" class="agreement-object">
										<div class="agree-space">
											<div class="agreement-div" id="f1ace36bc7307a8">
												<div class="agree-txt-space">
													<div class="all-agree-txt">
														이용약관 3개에 모두 동의
													</div>
												</div>
											</div>
										</div>
										<div class="checkbox-space" id="f2ea7080328eea4">
											<input class="agree-checkbox" type="checkbox">
										</div>
									</div>
									<hr class="clause-hr">
									<div aria-labelledby="f3fed0521cdfb7c f1a5ee8b94d3eb4 fe1d6a7839cea f2116856aaa1b1" class="agreement-object">
										<div class="agree-space">
											<div class="agreement-div" id="f1a5ee8b94d3eb4">
												<div class="agree-txt-space">
													<div class="agree-txt">
														이용 약관(필수)
													</div>
												</div>
											</div>
											<div class="agreement-more-div" id="fe1d6a7839cea">
												<div class="agreement-entity">
													<div class="agreement-more">
														<a href="https://help.instagram.com/581066165581870" rel="nofollow noopener noreferrer" target="_blank">
															<div class="more-txt">더 알아보기</div>
														</a>
													</div>
												</div>
											</div>
										</div>
										<div class="checkbox-space" id="f3fed0521cdfb7c">
											<input class="agree-checkbox" type="checkbox">
										</div>
									</div>
									<div aria-labelledby="f1ae7a5466ae42c f38b1bccf998f48 f28304b5458b3 f3b51cf02c6d4c" class="agreement-object">
										<div class="agree-space">
											<div class="agreement-div" id="f38b1bccf998f48">
												<div class="agree-txt-space">
													<div class="agree-txt">
														데이터 정책(필수)
													</div>
												</div>
											</div>
											<div class="agreement-more-div" id="f28304b5458b3">
												<div class="agreement-entity">
													<div class="agreement-more">
														<a href="https://help.instagram.com/519522125107875" rel="nofollow noopener noreferrer" target="_blank">
															<div class="more-txt">더 알아보기</div>
														</a>
													</div>
												</div>
											</div>
										</div>
										<div class="checkbox-space" id="f1ae7a5466ae42c">
											<input class="agree-checkbox" type="checkbox">
										</div>
									</div>
									<div aria-labelledby="f287075043555d4 f160b3456cbbf44 f214848a194687c fb228278c3ca4c" class="agreement-object">
										<div class="agree-space">
											<div class="agreement-div" id="f160b3456cbbf44">
												<div class="agree-txt-space">
													<div class="agree-txt">
														위치 기반 기능(필수)
													</div>
												</div>
											</div>
											<div class="agreement-more-div" id="f214848a194687c">
												<div class="agreement-entity">
													<div class="agreement-more">
														<a href="https://help.instagram.com/626057554667531" rel="nofollow noopener noreferrer" target="_blank">
															<div class="more-txt">더 알아보기</div>
														</a>
													</div>
												</div>
											</div>
										</div>
										<div class="checkbox-space" id="f287075043555d4">
											<input class="agree-checkbox" type="checkbox">
										</div>
									</div>
								</div>
								<div class="next-space" style="width: 100%;">
									<button class="next-btn" disabled="" type="submit">다음</button>
								</div>
								<div class="back-space">
									<button class="back-btn" type="button">돌아가기</button>
								</div>
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
		</section>
	</div>
	<div class="update-message-space">
		<div class="update-ease-out">
			<div class="update-message">
				<div class="update-text-space">
					<p class="update-text"></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>