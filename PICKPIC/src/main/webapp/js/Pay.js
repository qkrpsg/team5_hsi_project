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
		 
		let f_id = $('.table').find('tr').eq(3).find('td').eq(1).attr('attr1');
		let ppa_nickname = $('.table').find('tr').find('td').eq(1).html();//닉네임
		let ppa_email = $('.table').find('tr').eq(1).find('td').eq(1).html();//이멜
		let f_name = $('.table').find('tr').eq(2).find('td').eq(1).html();//상품명
		let f_id_ppa_index = $('.table').find('tr').eq(3).find('td').eq(1).html();//상품코드
		let f_price = $('.table').find('tr').eq(4).find('td').eq(1).html();//상품가격
		f_price = f_price.replace('원','');
		console.log('한결'+f_id);
		console.log(f_name);
		console.log(f_id_ppa_index);
		console.log(f_price);
		
		var IMP = window.IMP; // 생략해도 괜찮습니다.
		IMP.init("imp77502296"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
		//IMP.request_pay(param, callback) 호출
		IMP.request_pay({ // param
		    pg: "html5_inicis", //   mobilians  html5_inicis
		    pay_method: val, //뭐로 결제? vbank card phone 결제 방법
		    merchant_uid: f_id_ppa_index,  //상품코드 + new Date().getTime() 이건 임시로 남겨둠
		    //name: "결제 테스트",
		    amount: f_price, //상품가격    paid_amount 받을 계좌 
		    buyer_email: ppa_email,  //이메일
		    buyer_name: ppa_nickname, //닉네임
		    //buyer_tel: "010-3345-9431",//없다  예전엔(필수 가격 전화번호) 
		    //buyer_addr: "서울특별시 노원구 공릉동",			//없다
		    //buyer_postcode: "01181" //우편번호 ?
		}, function (rsp) { // callback
		    if (rsp.success) {
		    	let msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				console.log(msg); 
				
				      var form = document.createElement("form");
				      form.setAttribute("charset", "UTF-8");
				      form.setAttribute("method", "Post");  //Post 방식
				      form.setAttribute("action", "/pickpic/admin/pickRoad.do"); //요청 보낼 주소
				      
				      
				      
				      var hiddenField = document.createElement("input");
				      hiddenField.setAttribute("type", "hidden");
				      hiddenField.setAttribute("name", "f_id");
				      hiddenField.setAttribute("value", f_id);
				      form.appendChild(hiddenField);
				     
				      var hiddenField = document.createElement("input");
				      hiddenField.setAttribute("type", "hidden");
				      hiddenField.setAttribute("name", "${_csrf.parameterName}");
				      hiddenField.setAttribute("value", "${_csrf.token}");
				      
				      //결제 수단입니다.
				      var hiddenField = document.createElement("input");
				      hiddenField.setAttribute("type", "hidden");
				      hiddenField.setAttribute("name", "p_method");
				      hiddenField.setAttribute("value", val);
				      
				      //금액입ㄴ다.
				      var hiddenField = document.createElement("input");
				      hiddenField.setAttribute("type", "hidden");
				      hiddenField.setAttribute("name", "p_price");
				      hiddenField.setAttribute("value", f_price);
				     
				      form.appendChild(hiddenField); 
				      document.body.appendChild(form);
				      //form.submit();
				   
				
				
				
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				console.log(msg);
				console.log("no-hi");
		    }
		}); 
	});//click
	
	
	
	
	
	
	
	/*
	 var d = new Date();
	 var day = parseInt(d.getDate())+1;
	 
     var currentDate = d.getFullYear() + "년 " + ( d.getMonth() + 1 ) + "월 " + day + "일";
     var currentTime = d.getHours() + "시 " + d.getMinutes() + "분 ";// + d.getSeconds() + "초"
     var result = document.getElementsByClassName('depositDueTxt')[0];
     result.innerHTML = currentDate + currentTime + " 까지"  ;*/
	
});
