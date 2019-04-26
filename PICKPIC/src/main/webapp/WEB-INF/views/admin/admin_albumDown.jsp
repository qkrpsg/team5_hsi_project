<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<div class="content-wrapper">
	<!-- 콘텐츠 헤더 시작 -->
	<section class="content-header">
		<h1>앨범다운 <small>56 개의 다운 기록</small></h1>
	</section>
	<!-- 콘텐츠 헤더 끝 -->
	
	<!-- 콘텐츠 시작 -->
    <section class="content">
	    <div class="row">
	    	<div class="col-md-12">
	    		<div class="box">
					<div class="box-header">
						<h3 class="box-title">앨범 다운 기록</h3>
					</div>
					
					<div class="box-body table-responsive">
						<button type="button" class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"> 전체 선택</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-trash"> 삭제</i>
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
						<table class="table table-hover" >
							<tr>
								<th></th>
								<th>번호</th>
								<th>사용자</th>
								<th>다운로드일</th>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>사용자명1</td>
								<td>2019/02/22</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>2</td>
								<td>사용자명2</td>
								<td>2019/03/04</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>3</td>
								<td>사용자명3</td>
								<td>2019/04/25</td>
							</tr>
						</table>
					</div>
					
					<div class="box-footer">
						<button type="button" class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"> 전체 선택</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-trash"> 삭제</i>
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
				</div>
			</div>
		</div>
	</section>
	<!-- 콘텐츠 끝 -->
</div>