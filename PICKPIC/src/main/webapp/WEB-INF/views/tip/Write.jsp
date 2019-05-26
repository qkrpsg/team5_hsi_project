<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css & js -->
<link href="<c:url value='/css/Pkp.css' />" rel="stylesheet">
<link href="<c:url value='/css/Tip.css' />" rel="stylesheet">
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
    src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js">
</script>

<!-- Write.jsp -->
<div class="l_pkp_all_wrap">
   <div class="l_pkp_sub_wrap">
      <div class="row text-center">
         <div class="section-header col-md-12"
             style="margin-top: 5%; margin-bottom: 4%">
             <h2>피크픽 Tip작성</h2>
             <span>아래 폼을 작성하세요.</span>
      </div>
      <!-- /.section-header -->
      </div>
      <!-- /.row -->
      
      <div class="l_tip_list_wrap">
			<div class="row" style="margin-left: 20%;margin-right: 20%;">
				<form method="post" action="<c:url value='/views/tip/Write2.pic'/>" id="jyu"> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

					<div class="form-group">
						<label for="title">제목</label> 
						<input type="text" class="form-control" name="TB_TITLE" id="TB_TITLE" placeholder="제목을 입력해 주세요">
					</div>
					<!-- 등록일 -->
					<input type="hidden" name="ppu_register_date" id="TB_POST_DATE"/>
					<!-- 글쓰기 썸머노트 -->
					<textarea id="summernote" name="TB_CONTENT" id="TB_CONTENT">상세 내용을 작성하세요.</textarea>       
					
					<div class="form-group text-center">
						<input type="button" id="join-submit" class="btn btn-primary" value="작성완료" >
						<input type="button"  class="btn btn-warning" onclick="location.href='<c:url value="/views/tip/List.pic"/>'" value="취소" >
					</div>
				</form>
			</div>
		</div>
   </div>
   <!-- 1_pkp_sub_wrap -->
</div>
<!-- 1_pkp_all_wrap -->

<!-- AdminLTE App --><!-- 
<script src="../../dist/js/adminlte.min.js"></script> -->
<!-- summernote -->
<script>
$(function(){
	$("#join-submit").click(function(){
		console.log("hi");
		$("#jyu").submit();
	});
});
   $(document).ready(function(){
	   $('#summernote').summernote({
		   height :300,
		   minHeight : null,
		   maxHeight : null,
		   focus : true
		   
	   })
   })


</script>
    

