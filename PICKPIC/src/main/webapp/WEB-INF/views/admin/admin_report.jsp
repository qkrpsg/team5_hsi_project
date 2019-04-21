<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<!-- Content Wrapper -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			신고함<small>20개 신고 접수</small>
		</h1>
	</section>

    <section class="content">
		<div class="box box-primary">
			<div class="box-header with-border">
	        	<h3 class="box-title">신고 게시글 목록</h3>	
			</div>
			<div class="box-body no-padding">
				<button type="button" class="btn btn-default btn-sm checkbox-toggle">
					<i class="fa fa-square-o"></i>
				</button>
				<div class="btn-group">
					<button type="button" class="btn btn-default btn-sm">
						<i class="fa fa-ban"></i>
					</button>
					<button type="button" class="btn btn-default btn-sm">
						<i class="fa fa-reply"></i>
					</button>
				</div>
				<button type="button" class="btn btn-default btn-sm">
					<i class="fa fa-refresh"></i>
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
				<table class="table table-hover">
					<tr>
						<th></th>
						<th>번호</th>
						<th>신고된 사용자</th>
						<th>게시판 분류</th>
						<th>제목</th>
						<th>신고내용</th>
						<th>신고한 사용자</th>
						<th>신고일</th>
						<th>처리 상태</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>3</td>
						<td>신고된 사용자명1</td>
						<td>게시판1</td>
						<td>제목3</td>
						<td>신고내용2</td>
						<td>신고한 사용자명2</td>
						<td>2019/03/12</td>
						<td>처리중</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>2</td>
						<td>신고된 사용자명2</td>
						<td>게시판2</td>
						<td>제목2</td>
						<td>신고내용2</td>
						<td>신고한 사용자명2</td>
						<td>2019/04/21</td>
						<td>처리중</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>신고된 사용자명1</td>
						<td>게시판1</td>
						<td>제목1</td>
						<td>신고내용1</td>
						<td>신고한 사용자명1</td>
						<td>2019/12/34</td>
						<td>처리완료</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
</div>
<!-- End of Content Wrapper -->