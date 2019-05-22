$(document).ready(function(){
	var a =	0;
	$('.type-selector-li').click(function(){
		 a = $(this).index();
		 $('.pay-type-content').css('display','none');
		 $('.pay-type-content:eq('+a+')').css('display','block');
	});
	$('.pay-type-content:eq('+a+')').css('display','block');
	var val = 'phone';
	
	$('.type-selector-li').click(function(){
		
		val = $(this).find('.type-selector-radio').val();
		
	});
	
	/*$('select').change(function(){
		//val = $('.pay-type-content:eq('+a+')').find('select').val();
	});*/
	
/*
 * 결제처리 방법 UUID 클래스 
 * java : UUID uid = UUID.randomUUID();
 * 생성된 스트링값을 merchant_uid에 넣어준다.
 * 
 */
	
	
	
	
	$('#paymentBtn').click(function(){
		
		console.log(val);
		var IMP = window.IMP; // 생략해도 괜찮습니다.
		IMP.init("imp77502296"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

		//IMP.request_pay(param, callback) 호출
		IMP.request_pay({ // param
		    pg: "html5_inicis", //   mobilians  html5_inicis
		    pay_method: val, //뭐로 결제? vbank card phone 결제 방법
		    merchant_uid: "안녕하세요", //뭔지 모르겠다 결제코드 상품번호같은거 + new Date().getTime()
		    
		    
		   // name: "결제 테스트",
		    amount: 1, //아마 가격     paid_amount 받을 계좌 /// 가격 맞다.
		    buyer_email: "dldydtnsladk@naver.com",  //쿼리 셀렉터로 모두 값을 얻어온다.
		    buyer_name: "이용수",
		    buyer_tel: "010-3345-9431",				///필수로 입력할 항목은 amout와 tel이므로 다른건 입력 안해도 상관없다.
		    buyer_addr: "서울특별시 노원구 공릉동",			//참고
		    buyer_postcode: "01181" //우편번호 ?
		}, function (rsp) { // callback
		    if (rsp.success) {
		    	 var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				
				console.log();
				console.log(msg); 
				console.log("hi");
				
				
				/////결제 처리 성공했을 때 오는 지점
				//여기에 ajax로 DB에 입력하면 된다.
				/*
				$.ajax({
					url:,
					type:,
					data:,
					dataType:,
					success:,
					error:function(error, request){
						console.log('에러 발생~~~' + error);}
				});
				*/
				
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				console.log(msg);
				console.log("no-hi");
		    }
		}); 
	});
	
	
	
	
	
	
	
	 var d = new Date();
	 var day = parseInt(d.getDate())+1;
	 
     var currentDate = d.getFullYear() + "년 " + ( d.getMonth() + 1 ) + "월 " + day + "일";
     var currentTime = d.getHours() + "시 " + d.getMinutes() + "분 ";// + d.getSeconds() + "초"
     var result = document.getElementsByClassName('depositDueTxt')[0];
     result.innerHTML = currentDate + currentTime + " 까지"  ;
	
});
