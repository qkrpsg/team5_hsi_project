<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<div class="content-wrapper">
	<section class="content-header">
		<h1>픽플레이스 <small>303 개의 게시물 </small></h1>
	</section>

	<section class="content container-fluid" style="overflow: hidden">
		<!-- 검색용 UI -->
		<div class="row" style="padding-right:30px">
			<div class="pull-right table-responsive">
				<form class="form-inline" method="post" action="<c:url value='#'/>">
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="title">제목</option>
							<option value="name">작성자</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" name="searchWord" class="form-control" />
					</div>
					<button type="submit" class="btn btn-primary">검색</button>
				</form>
			</div>
		</div>
		
		<!-- 실제내용 시작 -->
		<c:forEach var="item" items="${place }" varStatus="loop">
			<div class="box-body_wrap col-md-3 col-sm-6">
				<div class="box-body">
					<img class="img-responsive pad pp-image" src="<c:url value='${item.ppb_image_path }'/>" alt="Photo">
					<p></p>
					<button type="button" class="btn btn-default btn-xs pp-view">
						<i class="fa fa-share"> 게시물 보기</i>
					</button>
					<button type="button" class="btn btn-default btn-xs pp-delete">
						<i class="fa  fa-trash-o"> 게시물 삭제</i>
					</button>
				</div>
				<div class="box-footer box-comments">
					<div class="box-comment">
						<div class="user-block">
							<img class="img-circle pp-profile" src='${item.ppa_profile_path }' alt="User Image">
							<span class="username pp-name">${item.ppa_nickname }</span> 
							<span class="description pp-post">${item.ppb_post_date }</span>
						</div>
						<p class="pp-content">${item.ppb_content }</p>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- 실제내용 끝 -->

		<div style="clear: both;">
			<!-- 페이징 -->
<!-- 			<div class="row" style="margin-top: 30px; margin-bottom: 30px;"> -->
<!-- 				페이지네이션 가운데 배치:text-center -->
<%-- 				<div class="col-md-12 text-center">${pagingString}</div> --%>
<!-- 			</div> -->
			<div class="row">
				<div class="clearfix text-center">
	              <ul class="pagination pagination-sm">
	                <li><a href="#">&laquo;</a></li>
	                <li><a href="#">1</a></li>
	                <li><a href="#">2</a></li>
	                <li><a href="#">3</a></li>
	                <li><a href="#">&raquo;</a></li>
	              </ul>
	            </div>
			</div>
		</div>
	</section>
</div>
