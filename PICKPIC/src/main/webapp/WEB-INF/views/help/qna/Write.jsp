<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Pkp.css' />" rel="stylesheet">
<link href="<c:url value='/css/Help.css' />" rel="stylesheet">
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<!-- Write.jsp -->
<div class="l_pkp_all_wrap">
	<div class="l_pkp_sub_wrap">
		<div class="row text-center">
			<div class="section-header col-md-12"
				style="margin-top: 5%; margin-bottom: 4%">
				<h2>문의 작성</h2>
				<span>아래 폼을 작성하세요.</span>
			</div>
			<!-- /.section-header -->
		</div>
		<!-- /.row -->

		<div class="l_help_list_wrap">
			<div class="row" style="margin-left: 20%;margin-right: 20%;">
				<form role="form" method="POST">

					<div class="form-group">
						<label for="#">제목</label> <input type="text" class="form-control"
							name="#" id="#" placeholder="제목을 입력해 주세요">
					</div>

					<div class="form-group">
						<label for="#">이메일</label> <input type="tel" class="form-control"
							name="#" id="#" placeholder="답변알림을 받으실 이메일 주소를 입력하세요.">
					</div>

					<!-- 등록일 -->
					<input type="hidden" name="ppu_register_date" />

					<div class="form-group">
						<label for="#">관련사항</label> <input type="radio"
							style="margin-left: 10px;" name="#" id="#" class="#" value="m"
							checked />장소 <input type="radio" name="#" class="#" value="f" />루트
						<input type="radio" name="#" class="#" value="f" />필터 <input
							type="radio" name="#" class="#" value="f" />결제 <input
							type="radio" name="#" class="#" value="f" />기타
					</div>

					<!-- 글쓰기 썸머노트 -->
					<textarea id="summernote" name="editordata"><p>상세 내용을 작성하세요. </p></textarea>

					<!--  -->

					<div class="form-group text-center">
						<input type="button" id="join-submit" class="btn btn-primary" onclick="location.href='<c:url value="/help/qna/List.pic"/>'" value="작성완료" >
						<input type="button" id="join-submit" class="btn btn-warning" onclick="location.href='<c:url value="/help/qna/List.pic"/>'" value="취소" >
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- l_pkp_sub_wrap -->
</div>
<!-- l_pkp_all_wrap -->

<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- summernote -->
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true
		// set focus to editable area after initializing summernote
		});
	});
</script>