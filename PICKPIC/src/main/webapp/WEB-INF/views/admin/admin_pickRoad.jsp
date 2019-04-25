<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<!-- 여기서부터 사용자 관리 페이지 시작 -->
<div class="content-wrapper">
	<section class="content-header">
		<h1>픽로드 <small>20개의 게시물</small></h1>
	</section>
	
	<!-- 메인 시작 -->
	<section class="content">
		<div class="row">
			<!-- 상세 검색 시작 -->
			<div class="col-md-3">
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">상세검색</h3>
<!-- 						<div class="box-tools pull-right"> -->
<!-- 							<button type="button" class="btn btn-box-tool" -->
<!-- 								data-widget="collapse"> -->
<!-- 								<i class="fa fa-minus"></i> -->
<!-- 							</button> -->
<!-- 						</div> -->
					</div>
					
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label>사용자ID</label> 
									<input type="text" name="search_name" placeholder="사용자ID를 입력하세요." class="form-control">
								</div>
								<div class="form-group">
									<label>등록일자</label>
									<div class="input-group">
										<div class="input-group-addon"><i class="fa fa-clock-o"></i></div>
										
									</div>
								</div>
								<div class="form-group">
									<label>국가</label> 
									<select class="form-control select2" data-placeholder="Select a State" style="width: 100%;">
										<option></option>
										<option>한국</option>
										<option>미국</option>
										<option>영국</option>
										<option>일본</option>
										<option>필리핀</option>
										<option>중국</option>
										<option>프랑스</option>
									</select>
								</div>
								<div class="form-group">
									<label>도시</label> 
									<select class="form-control select2" style="width: 100%;">
										<option></option>
										<option>서울</option>
										<option>대전</option>
										<option>대구</option>
										<option>부산</option>
									</select>
								</div>
								<div class="form-group">
									<label>지역</label> 
									<select class="form-control select2" style="width: 100%;">
										<option></option>
										<option>강남구</option>
										<option>영등포구</option>
										<option>마포구</option>
										<option>종로구</option>
										<option>강북구</option>
										<option>송파구</option>
									</select>
								</div>
								<a href="#" class="btn btn-primary btn-block"><b>검색</b></a>
							</div>
						</div>
					</div>
					
					<div class="box-footer">
					</div>
				</div>
			</div>
			<!-- 상세 검색 끝 -->
	
			<!-- 게시물 목록 시작 -->
			<div class="col-md-9">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">게시물 목록</h3>
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
								<th class="col-md-3">제목</th>
								<th>내용</th>
								<th>사용자</th>
								<th>등록일</th>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>제목1</td>
								<td>내용1</td>
								<td>사용자명1</td>
								<td>등록일1</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>2</td>
								<td>제목2</td>
								<td>내용2</td>
								<td>사용자명2</td>
								<td>등록일2</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>3</td>
								<td>제목3</td>
								<td>내용3</td>
								<td>사용자명3</td>
								<td>등록일3</td>
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
			<!-- 게시물 목록 끝 -->
		</div>
	</section>
	<!-- 메인 끝 -->
</div>
<!-- 여기까지 사용자 관리 페이지 끝 -->