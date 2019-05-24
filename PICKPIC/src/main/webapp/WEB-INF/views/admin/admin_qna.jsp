<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<style>
.sa {
	width: 80px;
	height: 40px;
	float: right
}
</style>

<script>
	$(function() {
		//showComments();		
		//보내기 = 작성
	
		$('#qna_aqupdate').click(
				function() {
					console.log('번호 잘 담고있니', $(this).parent().children(0)
							.children(0).val());
					console.log('ㅎㅇ');
					//아직 안됨
					$.ajax({
						url : '<c:url value="/admin/admin_qna_update.pic"/> ',
						data : {
							 q_index : $(this).parent().parent().find('.ho').find('#cch').val(),
							 aq_content : $(this).parent().parent().find('.how').val(),
									
							'_csrf' : '${_csrf.token}'
						},
						dataType : 'text',
						type : 'post',
						success : function() {
                             alert('수정완료');
						}

					}); 
				});


		
		$('#qna_aqcomment')
				.click(
						function() {
							console.log('값 들어오냐')
							console.log("ㅗㅑㅗㅗㅑ"
									+ $(this).parent().parent().find('.hi')
											.find('#cch').val());

							console.log('번호 잘 담고있니', $(this).parent().parent()
									.children(0).children(0).val());

							
									$.ajax({
										url : '<c:url value="/admin/admin_qna_aqinsert.pic"/> ',
										data : {
											q_index : $(this).parent().parent().find('.hi').find('#cch').val(),
											aq_content : $(this).parent().parent().find('.ha').val(),
											
											'_csrf' : '${_csrf.token}'
										},
										dataType : 'json',
										type : 'post',
										success : function(data) {
										alert('답변완료');

										}
									}); 
						});
	}); 
</script>


<div class="content-wrapper">
	<!-- 컨텐츠 헤더 시작 -->
	<section class="content-header">
		<h1>
			문의 <small></small>
		</h1>
	</section>
	<!-- 컨텐츠 헤더 시작 -->

	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" method="post" id="frm"
					action="<c:url value='/admin/qna.pic'/>">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="box box-primary">
						<!-- 박스 헤더 시작 -->
						<div class="box-header with-border">
							<h3 class="box-title">문의 목록</h3>
						</div>
						<!-- 박스 헤더 끝 -->
						<c:if test="${empty list }" var="isEmpty">
							<tr>
								<td colspan="4">등록된 게시물이 없어요</td>
							</tr>
						</c:if>

						<c:if test="${not isEmpty}">
							<c:forEach var="item" items="${list}" varStatus="loop">
								<!-- 박스 바디 시작 -->
								<div class="box-body">
									<div class="post clearfix">
										<div class="user-block">
											<img class="img-circle img-bordered-sm" style="float: left"
												src="<c:url value='/resources/admin_images/user_icon.png'/>"
												alt="User Image"> <span class="username"> <a
												href="#">제목: ${item.Q_TITLE}</a> <span
												style="font-size: 10px; color: blue; float: right">&nbsp;
													등록일: ${item.Q_POST_DATE}</span> <br /> 사용자: ${item.PPA_EMAIL } 
										</div>
										<p style="font-size: 15px;">
											<br /> <span style="font-weight: bold; font-size: 15px">내용:</span>&nbsp;&nbsp;
											${item.Q_CONTENT }<br />
										</p>
										<c:if test="${empty item.AQ_CONTENT }" var="Empty">
											<div class="form-group margin-bottom-none">
												<div class="col-sm-1" style="">
													<img src="<c:url value='/resources/images/question.jpg'/> "
														class="sa">
												</div>
												<div class="col-sm-9 hi" style="margin-top: 6px;">
													<input type="hidden" id="cch" name="q_index"
														value=${item.Q_INDEX }> <input
														class="form-control ha" placeholder="답변"
														value=${item.AQ_CONTENT }>
												</div>
												<div class="col-sm-1 " style="margin-top: 6px;">
													<button type="submit"
														class="btn btn-primary pull-right btn-block btn-sm "
														n id="qna_aqcomment">보내기</button>
												</div>
											</div>
										</c:if>
										<c:if test="${not Empty }">
											<div class="form-group margin-bottom-none">

												<div class="col-sm-1" style="">
													<img src="<c:url value='/resources/images/question.jpg'/> "
														class="sa">
												</div>
												<div class="col-sm-9 ho" style="margin-top: 6px;">
													<input type="hidden" id="cch" name="q_index"
														value=${item.Q_INDEX} > <input
														class="form-control how" placeholder=""
														value="${item.AQ_CONTENT }">


												</div>
												<div class="col-sm-1" style="margin-top: 6px;">
													<button type="submit" 
														class="btn btn-info pull-right btn-block btn-sm qna_aqupdate"
														id="qna_aqupdate">수정</button>
												</div>

											</div>
										</c:if>

									</div>
								</div>
								<hr style="border-bottom: solid 2px #87CEFA">
							</c:forEach>
						</c:if>

					</div>
				</form>

			</div>
		</div>
	</section>
</div>
