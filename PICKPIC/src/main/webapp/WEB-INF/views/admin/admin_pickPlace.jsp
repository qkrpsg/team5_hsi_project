<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<div class="content-wrapper">
	<section class="content-header">
		<h1>픽플레이스 <small>303 개의 게시물 </small></h1>
	</section>

	<section class="content container-fluid" style="overflow: hidden">
		<!-- 검색용 UI -->
		<div class="row">
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
		<div class="box-body_wrap col-md-6">
			<div class="box-body">
				<img class="img-responsive pad" src="<c:url value='/resources/images/13.jpg'/>" alt="Photo">
				<p></p>
				<button type="button" class="btn btn-default btn-xs">
					<i class="fa fa-share"> 게시물 보기</i>
				</button>
				<button type="button" class="btn btn-default btn-xs">
					<i class="fa  fa-trash-o"> 게시물 삭제</i>
				</button>
			</div>
			<div class="box-footer box-comments">
				<div class="box-comment">
					<div class="user-block">
						<img class="img-circle" src="<c:url value='/resources/admin_images/user_icon.png'/>" alt="User Image">
						<span class="username"> 
							<a href="#">사용자1</a>
						</span> 
						<span class="description">2019/03/24 17:33</span>
					</div>
					<p>
						내용1
					</p>
				</div>
			</div>
		</div>
		<!-- 실제내용 끝 -->

		<div class="box-body_wrap col-md-6">
			<div class="box-body">
				<img class="img-responsive pad" src="<c:url value='/resources/images/5.jpg'/>" alt="Photo">
				<p></p>
				<button type="button" class="btn btn-default btn-xs">
					<i class="fa fa-share"> 게시물 보기</i>
				</button>
				<button type="button" class="btn btn-default btn-xs">
					<i class="fa  fa-trash-o"> 게시물 삭제</i>
				</button>
			</div>
			<div class="box-footer box-comments">
				<div class="box-comment">
					<div class="user-block">
						<img class="img-circle" src="<c:url value='/resources/admin_images/user_icon.png'/>" alt="User Image">
						<span class="username"> 
							<a href="#">사용자2</a>
						</span> 
						<span class="description">2019/04/10 15:03</span>
					</div>
					<p>
						내용2
					</p>
				</div>
			</div>
		</div>

		<div class="box-body_wrap col-md-6">
			<div class="box-body">
				<img class="img-responsive pad" src="<c:url value='/resources/images/9.jpg'/>" alt="Photo">
				<p></p>
				<button type="button" class="btn btn-default btn-xs">
					<i class="fa fa-share"> 게시물 보기</i>
				</button>
				<button type="button" class="btn btn-default btn-xs">
					<i class="fa  fa-trash-o"> 게시물 삭제</i>
				</button>
			</div>
			<div class="box-footer box-comments">
				<div class="box-comment">
					<div class="user-block">
						<img class="img-circle" src="<c:url value='/resources/admin_images/user_icon.png'/>" alt="User Image">
						<span class="username"> 
							<a href="#">사용자3</a>
						</span> 
						<span class="description">2019/04/20 21:47</span>
					</div>
					<p>
						내용3
					</p>
				</div>
			</div>
		</div>
		
		<div class="box-body_wrap col-md-6">
			<div class="box-body">
				<img class="img-responsive pad" src="<c:url value='/resources/images/12.jpg'/>" alt="Photo">
				<p></p>
				<button type="button" class="btn btn-default btn-xs">
					<i class="fa fa-share"> 게시물 보기</i>
				</button>
				<button type="button" class="btn btn-default btn-xs">
					<i class="fa  fa-trash-o"> 게시물 삭제</i>
				</button>
			</div>
			<div class="box-footer box-comments">
				<div class="box-comment">
					<div class="user-block">
						<img class="img-circle" src="<c:url value='/resources/admin_images/user_icon.png'/>" alt="User Image">
						<span class="username"> 
							<a href="#">사용자4</a>
						</span> 
						<span class="description">2019/04/25 20:00</span>
					</div>
					<p>
						내용4
					</p>
				</div>
			</div>
		</div>

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
