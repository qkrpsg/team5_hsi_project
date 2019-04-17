<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<!-- 여기서부터 사용자 관리 페이지 시작 -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					게시물 관리 <small>56 개의 새로운 게시물</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 홈</a></li>
					<li class="active">게시물 관리</li>
				</ol>
			</section>
			<!-- 메인 시작 -->
			<!-- Main content -->
			<section class="content">
				<!-- 대시 보드 시작 -->
				<!-- Info boxes -->
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-aqua"><i
								class="ion ion-ios-gear-outline"></i></span>

							<div class="info-box-content my_middle">
								<span class="info-box-text">새로운 게시물</span> <span
									class="info-box-number">10<small>개</small></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box1 -->
					</div>
					<!-- /.col -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-red"><i
								class="glyphicon glyphicon-pencil"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">픽</span> <span
									class="info-box-number">201<small>개</small></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box2 -->
					</div>
					<!-- /.col -->

					<!-- fix for small devices only -->
					<div class="clearfix visible-sm-block"></div>

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-green"><i
								class="glyphicon glyphicon-map-marker"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">루트</span> <span
									class="info-box-number">1,760<small>개</small></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box3 -->
					</div>
					<!-- /.col -->

				</div>
				<!-- /.row -->
				<!-- 대시 보드 끝 -->

				<!-- 상세 검색 시작 -->
				<!-- SELECT2 EXAMPLE -->
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
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label>사용자ID</label> <input type="text" name="search_name"
										placeholder="사용자ID를 입력하세요." class="form-control">
								</div>
								<!-- /.form-group -->
								<div class="form-group">
									<label>등록일자</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-clock-o"></i>
										</div>
										<input type="text" class="form-control pull-right"
											id="reservationtime">
									</div>
									<!-- /.input group -->
								</div>
								<!-- /.form-group -->
							</div>
							<!-- /.col -->
							<div class="col-md-6">
								<div class="form-group">
									<label>Multiple</label> <select class="form-control select2"
										multiple="multiple" data-placeholder="Select a State"
										style="width: 100%;">
										<option>Alabama</option>
										<option>Alaska</option>
										<option>California</option>
										<option>Delaware</option>
										<option>Tennessee</option>
										<option>Texas</option>
										<option>Washington</option>
									</select>
								</div>
								<!-- /.form-group -->
								<div class="form-group">
									<label>Disabled Result</label> <select
										class="form-control select2" style="width: 100%;">
										<option selected="selected">Alabama</option>
										<option>Alaska</option>
										<option disabled="disabled">California (disabled)</option>
										<option>Delaware</option>
										<option>Tennessee</option>
										<option>Texas</option>
										<option>Washington</option>
									</select>
								</div>
								<!-- /.form-group -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<!--  -->
					</div>
				</div>
				<!-- /.box -->
				<!-- 상세 검색 끝 -->

				<!-- 게시물 목록 시작 -->
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">게시물 목록</h3>

								<div class="box-tools">
									<ul class="pagination pagination-sm no-margin pull-right">
										<li><a href="#">&laquo;</a></li>
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding ">
								<table class="table table-hover"" >
									<tr>
										<th class="col-md-1">번호</th>
										<th class="col-md-1">사용자</th>
										<th class="col-md-2">날짜</th>
										<th class="col-md-5">내용</th>
										<th class="col-md-2">사진</th>
										<th class="col-md-1">옵션</th>
									</tr>
									<tr>
										<td>1</td>
										<td>Kosmo_1</td>
										<td>2019-4-9</td>
										<td>서귀포 해안가 모닝카페. 창으로 들어오는 빛이 예쁜 곳이에요.</td>
										<td><img class="img-responsive" src="dist/img/photo2.png"
											alt="Photo"></td>
										<td>
											<div class="btn-group-vertical">
												<button type="button" class="btn btn-default">차단</button>
												<button type="button" class="btn btn-default">메세지</button>
												<button type="button" class="btn btn-default">삭제</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Kosmo_2</td>
										<td>2019-4-9</td>
										<td>서귀포 해안가 모닝카페. 창으로 들어오는 빛이 예쁜 곳이에요.</td>
										<td><img class="img-responsive" src="dist/img/photo2.png"
											alt="Photo"></td>
										<td>
											<div class="btn-group-vertical">
												<button type="button" class="btn btn-default">차단</button>
												<button type="button" class="btn btn-default">메세지</button>
												<button type="button" class="btn btn-default">삭제</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>3</td>
										<td>Kosmo_3</td>
										<td>2019-4-9</td>
										<td>서귀포 해안가 모닝카페. 창으로 들어오는 빛이 예쁜 곳이에요.</td>
										<td><img class="img-responsive" src="dist/img/photo2.png"
											alt="Photo"></td>
										<td>
											<div class="btn-group-vertical">
												<button type="button" class="btn btn-default">차단</button>
												<button type="button" class="btn btn-default">메세지</button>
												<button type="button" class="btn btn-default">삭제</button>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
				</div>
				<!-- 게시물 목록 끝 -->


			</section>
			<!-- /.content -->
			<!-- 메인 끝 -->
		</div>
		<!-- /.content-wrapper -->
		<!-- 여기까지 사용자 관리 페이지 끝 -->