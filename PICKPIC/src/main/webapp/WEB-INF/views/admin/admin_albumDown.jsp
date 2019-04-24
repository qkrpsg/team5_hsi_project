<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<!-- 여기서부터 사용자 관리 페이지 시작 -->
<div class="content-wrapper">
	<section class="content-header">
		<h1>앨범다운 <small>56 개의 게시물</small></h1>
	</section>
	
	<!-- 메인 시작 -->
	<section class="content">
		<!-- 대시 보드 시작 -->
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-aqua"><i class="ion ion-ios-gear-outline"></i></span>
					<div class="info-box-content my_middle">
						<span class="info-box-text">새로운 게시물</span> 
						<span class="info-box-number">10<small>개</small></span>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-red"><i class="glyphicon glyphicon-pencil"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">픽</span> 
						<span class="info-box-number">201<small>개</small></span>
					</div>
				</div>
			</div>
<!-- 			<div class="clearfix visible-sm-block"></div> -->
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-green"><i class="glyphicon glyphicon-map-marker"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">루트</span> 
						<span class="info-box-number">1,760<small>개</small></span>
					</div>
				</div>
			</div>
		</div>
		<!-- 대시 보드 끝 -->

		<!-- 상세 검색 시작 -->
		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">상세검색</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool"
						data-widget="collapse">
						<i class="fa fa-minus"></i>
					</button>
				</div>
			</div>
			
			<div class="box-body">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>사용자ID</label> 
							<input type="text" name="search_name" placeholder="사용자ID를 입력하세요." class="form-control">
						</div>
						<div class="form-group">
							<label>등록일자</label>
							<div class="input-group">
								<div class="input-group-addon"><i class="fa fa-clock-o"></i></div>
								<input type="text" class="form-control pull-right" id="reservationtime">
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label>Multiple</label> 
							<select class="form-control select2" multiple="multiple" data-placeholder="Select a State" style="width: 100%;">
								<option>Alabama</option>
								<option>Alaska</option>
								<option>California</option>
								<option>Delaware</option>
								<option>Tennessee</option>
								<option>Texas</option>
								<option>Washington</option>
							</select>
						</div>
						<div class="form-group">
							<label>Disabled Result</label> 
							<select class="form-control select2" style="width: 100%;">
								<option selected="selected">Alabama</option>
								<option>Alaska</option>
								<option disabled="disabled">California (disabled)</option>
								<option>Delaware</option>
								<option>Tennessee</option>
								<option>Texas</option>
								<option>Washington</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			
			<div class="box-footer">
			</div>
		</div>
		<!-- 상세 검색 끝 -->

		<!-- 게시물 목록 시작 -->
		<div class="row">
			<div class="col-xs-12">
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
		</div>
		<!-- 게시물 목록 끝 -->
	</section>
	<!-- 메인 끝 -->
</div>
<!-- 여기까지 사용자 관리 페이지 끝 -->