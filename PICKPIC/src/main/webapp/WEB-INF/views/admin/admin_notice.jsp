<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>


<script>

</script>

<div class="content-wrapper">
	<!-- 콘텐츠 헤더 시작 -->
	<section class="content-header">
		<h1>공지사항</h1>	
	</section>
	<!-- 콘텐츠 헤더 끝 -->
	


			
		<div class="col-md-12">
			<form class="form-horizontal" method="post"
				action="<c:url value='/admin/admin_notice.pic'/>">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" name="n_title" id="title"
							placeholder="제목을 입력하세요" />
					</div>
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-5">
						<textarea rows="10" id="content" name="n_content"
							class="form-control" placeholder="내용을 입력하세요"></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-info" value="등록" />
					</div>
				</div>
			</form>
		</div>
				<div class="row" id="comments">
					<!-- 한줄 코멘트 목록-->
					<!-- ajax로 아래에 코멘트 목록 뿌리기 -->
	
				</div>
				
	<!-- 콘텐츠 시작 -->
    <section class="content">
	    <div class="row">
	    	<div class="col-md-6">
				<div class="box box-primary">
					<!-- 박스 헤더 시작 -->
					<div class="box-header with-border">
			        	<h3 class="box-title">공지사항목록</h3>	
					</div>
					<!-- 박스 헤더 끝 -->
						
						<div class="row_list">
				<table class="table table-hover table-responsive">
					<tr>
						<th></th>
						<th class="text-center">번호</th>
						<th>제목</th>
						<th>날짜</th>
					
					</tr>
					<c:if test="${empty list}" var="isEmpty">
					   <tr>					
 					        <td colspan="4" style="margin-bottom: 2%;">등록된 게시물이 없어요</td>
					   </tr>
					</c:if>
					<c:if test="${not isEmpty}">
					<c:forEach var="item" items="${list}" varStatus="loop">
						<tr class="kyk">
						    <th><input type="checkbox"><div class="q" style="visibility: hidden;">${item.N_INDEX}</div></th>
							<td style="text-align: center">${item.N_INDEX}</td>
							<td class="text-left" ><a href="<c:url value='/admin/admin_view.pic?n_index=${item.N_INDEX}'/> "> ${item.N_TITLE}</a></td>
							<td>${item.N_POST_DATE}</td>
						</tr>
					</c:forEach>
					
					
					
				</c:if>
				
				</table>
			</div>
			<div class="row">
		<!-- 페이지네이션 가운데 배치:text-center -->
		<div class="col-md-12 text-center">${pagingString}</div>
	</div>
		
		<div class="row">
		<!-- 페이지네이션 가운데 배치:text-center -->
<%-- 		<div class="col-md-12 text-center">${pagingString}</div> --%>
	</div>
					
					<!-- 박스 푸터 시작 -->
					<div class="box-footer">
						<button type="button" class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o qqq"> 전체 선택</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<a href="javascript:isDelete()" class="fa fa-trash" id="delete"> 삭제</a>
						</button>
					
					</div>
					<!-- 박스 푸터 끝 -->
				</div>
			</div>
			 <div class="col-md-6" style="background-color: #F5FFFA">
			<p style="font-size: 20px;font-weight: bold;border-bottom: 1px solid #B0C4DE;padding: 2%">공지사항 </p>
			     <c:if test="${empty list2 }" var="isEmpty">
					<tr>
						<td colspan="4" >등록된 게시물이 없어요</td>
					</tr>
				</c:if>
				<c:if test="${not isEmpty}">
				          <div class="col-md-12" style="font-size: 15px;padding: 2%">
			 			 <%--  <div 	class="col-md-8" >제목 : ${list2.n_title}</div>
							<div class="col-md-4">등록일: ${list2.n_post_date}</div>
							</div>
								<div class="col-md-12" style="margin-top: 1%;margin-left: 2%;margin-bottom: 2%"  >내용:${list2.n_content}</div> 
				            <div class="col-md-offset-9 col-md-3" >
				            <button>수정</button>  
				            </div> --%>
				            <form class="form-horizontal" method="post"
				action="<c:url value='/admin/admin_edit.pic'/>">
				<input type="hidden" name="n_index" value="${list2.n_index }" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-8">
						<input value="${list2.n_title }" type="text" class="form-control"
							name="n_title" id="title" placeholder="제목을 입력하세요" />
					</div>
				</div>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-8">
						<textarea rows="10" id="content" name="n_content"
							class="form-control" placeholder="내용을 입력하세요">${list2.n_content}</textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
		
						<input type="submit" class="btn btn-info" value="수정" />
					</div>
				</div>
			</form>
				</c:if> 
			
		</div> 
		</div>
	</section>
	<!-- 콘텐츠 끝 -->
</div>
<script>

//checkbox
var delete_kyk =[];
$(function(){
	
	
	
	$('input:checkbox').click(function(){
		console.log("체크 된 거"+$(this).next().html());
		var ab = $(this).next().html().split([","]);
		console.log("aa"+ab);
	
		
		 delete_kyk.push($(this).next().html());
		console.log("dd"+delete_kyk);
	});
		
});

var isDelete = function() {
	if (confirm("정말로 삭제 하시겠습니까?")) {
		
		location.replace("/pickpic/admin/admin_delete.pic?n_index="+delete_kyk);
	}

};




         
         




</script>

