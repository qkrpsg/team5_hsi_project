<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>



<link href="<c:url value='/css/Pay.css'/>" rel="stylesheet">
<script src="<c:url value='/js/Pay.js'/>"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<div style="margin-top: 100px;"></div>

	
	
<div class="middle">
	<!-- container-fluid -->
	<div class="ordTitle">
		<h3 class="title">주문/결제</h3>
		<span class="steps"> <em>주문결제 &gt; </em> 주문완료
		</span>
	</div>

	<form role="form" action='' method="POST">
		<div class="row">
			<div class="col-md-12">
				<table class="table">
				<c:forEach var="list" items="${list }" varStatus="loop">
					<tr>
						<td>닉네임</td>
						<td>${list.ppa_nickname }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${list.ppa_email }</td>
					</tr>
					<!-- <tr>
						<td>휴대폰 번호</td>
						<td>010-8787-4852</td>
					</tr> -->
					<tr>
						<td>상품명</td>
						<td>${list.f_name }</td>
					</tr>
					<tr>
						<td>상품코드</td>
						<td attr1="${list.f_id}" >${list.f_id}${list.ppa_index }</td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td>${list.f_change } 원</td>
					</tr>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" class="mb" />
				</c:forEach>
					<tr>
						<td>결제방법</td>
						<td class="check" style="">

							<li id="phonePayBox" class="type-selector-li"><input
								class="type-selector-radio" type="radio" name="payType"
								id="payType1" value="phone" checked> <label
								class="type-selector-label" for="payType1"
								style="font-weight: normal;"> <span
									class="type-selector-label__text">휴대폰</span>
							</label></li>

							<li id="virtualAccountPayBox" class="type-selector-li"><input
								class="type-selector-radio" type="radio" name="payType"
								id="payType2" value="vbank"> <label
								class="type-selector-label" for="payType2"
								style="font-weight: normal;"> <span
									class="type-selector-label__text">무통장입금(가상계좌)</span>
							</label></li>

							<li id="cardPayBox" class="type-selector-li"><input
								class="type-selector-radio" type="radio" name="payType"
								id="payType3" value="card"> <label
								class="type-selector-label" for="payType3"
								style="font-weight: normal;"> <span
									class="type-selector-label__text">신용/체크카드</span>
							</label></li>

							<!--<div class="wrap">-->
								<!--<div class="cellphone-payment pay-type-content"
									data-controller="CellphonePayment" data-controller-data="{}">
									<label for="cellphoneTelecom" class="cell_label">통신사 종류</label>
									 <select name="cellphoneTelecom" id="cellphoneTelecom"
										class="payment-cellphone__select">
										<option value="" selected="">선택</option>
										<option value="SKT" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">SKT</option>
										<option value="KT" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">KT</option>
										<option value="LG" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">LG</option>
									</select> 
								</div>
								-->
								<!-- 통신사 박스 -->

								<!--<div class="cellphone-payment pay-type-content"
									data-controller="CellphonePayment" data-controller-data="{}">
									<label for="depositBank" class="cell_label">입금은행</label> 
									 <select
										id="depositBank" class="" name="depositBank">
										<option value="" selected="" data-limitmsg="">선택</option>
										<option value="NH" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">농협은행</option>
										<option value="KB" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">국민은행</option>
										<option value="SHINHAN" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">신한은행</option>
										<option value="WOORI" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">우리은행</option>
										<option value="HANA" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">KEB하나은행</option>
										<option value="IBK" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">기업은행</option>
										<option value="DAEGU" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">대구은행</option>
										<option value="BUSAN" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">부산은행</option>
										<option value="POST_OFFICE" data-limitmsg=""
											data-messagecolor="" data-paymentdisabled="false">우체국</option>
										<option value="KYONGNAM" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">경남은행</option>
										<option value="KWANGJU" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">광주은행</option>
										<option value="SC" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">SC제일은행</option>
										<option value="SUHYUB" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">수협은행</option>
										<option value="CITI" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false">씨티은행</option>
									</select> 

									<li class="payBox-section  pay-type-section"><span
										class="line-title">입금기한</span>
										<div class="line-data">
											<span class="depositDueTxt">20</span>
										</div></li>

								</div>-->
								<!-- 무통장  -->
								<!--<div class="cellphone-payment pay-type-content"
									data-controller="CellphonePayment" data-controller-data="{}">
									<label for="cardTypeSelect" class="cell_label">카드종류</label>
									  <select
										name="cardCode" id="cardTypeSelect">
										<option value="" selected="" data-limitmsg="">선택</option>
										<option value="BC" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">BC카드</option>
										<option value="SHINHAN" selected="" data-limitmsg=""
											data-messagecolor="" data-paymentdisabled="false"
											data-maxinstallmentmonth="12">신한카드</option>
										<option value="KB" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">KB국민카드</option>
										<option value="SAMSUNG" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="24">삼성카드</option>
										<option value="HYUNDAI" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">현대카드</option>
										<option value="LOTTE" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">롯데카드</option>
										<option value="HANA_SK" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">하나카드</option>
										<option value="NH" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">NH농협카드</option>
										<option value="CITY" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">씨티카드</option>
										<option value="WOORI" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">우리카드</option>
										<option value="KakaoBank" data-limitmsg=""
											data-messagecolor="" data-paymentdisabled="false"
											data-maxinstallmentmonth="12">카카오뱅크카드</option>
										<option value="K bank" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">케이뱅크카드</option>
										<option value="JEONBUK" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">전북은행카드</option>
										<option value="COMMUNITY_CREDIT_COOPERATIVES" data-limitmsg=""
											data-messagecolor="" data-paymentdisabled="false"
											data-maxinstallmentmonth="12">새마을금고카드</option>
										<option value="ETC" data-limitmsg="" data-messagecolor=""
											data-paymentdisabled="false" data-maxinstallmentmonth="12">기타(은행/증권)카드</option>
									</select>

								</div>
								 카드 결제 -->
							<!--</div>  wrap end -->
							
							
						</td>

					</tr>
				</table>
				<div class="form-group" style="overflow: hidden;">
					<input type="checkbox" name="ppu_agree" value="이용약관" id="ppu_agree"
						value="ok" style="float: left; margin-right: 10px;" />
					<p style="float: left;">이용약관에 동의합니다.</p>
				</div>

				<button type="button" id="paymentBtn">
					<img src="//image12.coupangcdn.com/image/rocketpay-order-image/pc/btn_payment.gif"
						type="submit" width="260" height="60" alt="결제하기">
				</button>
			</div>
		</div>
		<!-- row -->
	</form>
</div>
<!-- container-fluid -->
<div style="margin-bottom: 139px;"></div>


