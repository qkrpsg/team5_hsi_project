<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<div class="content-wrapper">
	<!-- 콘텐츠 헤더 시작 -->
	<section class="content-header">
		<h1>휴지통<small>30개 삭제된 게시물</small></h1>	
	</section>
	<!-- 콘텐츠 헤더 끝 -->
	
	<!-- 콘텐츠 시작 -->
    <section class="content">
	    <div class="row">
	    	<div class="col-md-12">
				<div class="box box-primary">
					<!-- 박스 헤더 시작 -->
					<div class="box-header with-border">
			        	<h3 class="box-title">삭제된 게시글 목록</h3>	
					</div>
					<!-- 박스 헤더 끝 -->
					
					<!-- 박스 바디 시작 -->
					<div class="box-body">
						<button type="button" class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"> 전체 선택</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-trash"> 삭제</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-reply"> 복원</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"> 새로고침</i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
						
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th></th>
										<th>번호</th>
										<th class="col-md-3">제목</th>
										<th>게시판 분류</th>
										<th>사용자</th>
										<th>삭제일</th>
									</tr>
								</thead>
								<!-- 데이터를 받아오는 부분 -->
								<tbody>
									<tr>
										<td><input type="checkbox"></td>
										<td>1</td>
										<td>제목1</td>
										<td>게시판1</td>
										<td>사용자명1</td>
										<td>2019/12/34</td>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
										<td>2</td>
										<td>제목2</td>
										<td>게시판2</td>
										<td>사용자명2</td>
										<td>2019/04/21</td>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
										<td>3</td>
										<td>제목3</td>
										<td>게시판1</td>
										<td>사용자명3</td>
										<td>2019/03/12</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 박스 바디 끝 -->
					
					<!-- 박스 푸터 시작 -->
					<div class="box-footer">
						<button type="button" class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"> 전체 선택</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-trash"> 삭제</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-reply"> 복원</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"> 새로고침</i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
					</div>
					<!-- 박스 푸터 끝 -->
				</div>
			</div>
		</div>
	</section>
	<!-- 콘텐츠 끝 -->
</div>
