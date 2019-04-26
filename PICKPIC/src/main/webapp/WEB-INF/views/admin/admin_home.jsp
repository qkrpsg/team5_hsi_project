<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>관리자 페이지 <small>HOME</small></h1>
	</section>

	<section class="content">
		<!-- 대시보드 시작 -->
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-aqua"><i
						class="fa fa-thumb-tack"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">신규 픽</span> <span
							class="info-box-number">10</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-red"><i class="fa fa-krw"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">신규 판매</span> <span
							class="info-box-number">30</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-green"><i class="fa fa-group"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">신규 회원</span> <span
							class="info-box-number">5</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-yellow"><i
						class="fa fa-newspaper-o"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">신규 게시물</span> <span
							class="info-box-number">2,000</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 대시보드 끝 -->
		
		<!-- 1행 시작 -->
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">사이트 통계</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-8">
								<p class="text-center">
									<strong>접속자 통계 : 2019/03/01 ~ 2019/04/01</strong>
								</p>

								<div class="chart">
									<!-- Sales Chart Canvas -->
									<canvas id="salesChart" style="height: 180px;"></canvas>
								</div>
								<!-- /.chart-responsive -->
							</div>
							<!-- /.col -->
							<div class="col-md-4">
								<p class="text-center">
									<strong>컨텐츠 이용 빈도</strong>
								</p>

								<div class="progress-group">
									<span class="progress-text">픽플레이스</span> 
									<span class="progress-number"><b>33</b>/100</span>
									<div class="progress sm">
										<div class="progress-bar progress-bar-aqua" style="width: 33%"></div>
									</div>
								</div>
								<!-- /.progress-group -->
								<div class="progress-group">
									<span class="progress-text">필터</span> 
									<span class="progress-number"><b>21</b>/100</span>
									<div class="progress sm">
										<div class="progress-bar progress-bar-red" style="width: 21%"></div>
									</div>
								</div>
								<!-- /.progress-group -->
								<div class="progress-group">
									<span class="progress-text">픽루트</span> 
									<span class="progress-number"><b>28</b>/100</span>
									<div class="progress sm">
										<div class="progress-bar progress-bar-green" style="width: 28%"></div>
									</div>
								</div>
								<!-- /.progress-group -->
								<div class="progress-group">
									<span class="progress-text">앨범다운</span> 
									<span class="progress-number"><b>18</b>/100</span>
									<div class="progress sm">
										<div class="progress-bar progress-bar-yellow" style="width: 18%"></div>
									</div>
								</div>
								<!-- /.progress-group -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- ./box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- 1행 끝 -->

		<!-- 2행 시작 -->
		<div class="row">
			<!-- 유저 시작 -->
			<div class="col-md-6">
				<div class="box box-primary">
					<!-- 목록 헤더 시작 -->
					<div class="box-header with-border">
						<h3 class="box-title">사용자 목록</h3>
						<div class="box-tools pull-right">
							<a href="<c:url value='/admin/users.pic'/>">더보기</a>
						</div>
					</div>
					<!-- 목록 헤더 끝-->

					<!-- 목록 바디 시작 -->
					<div class="box-body">
						<!-- 목록데이터 : 사용자 아이디 입력 부분 -->
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th>번호</th>
										<th>사용자</th>
										<th>별명</th>
										<th>최종로그인</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>사용자1</td>
										<td>별명1</td>
										<td>차단 됨</td>
									</tr>
									<tr>
										<td>2</td>
										<td><a href="#">사용자2</a></td>
										<td>별명2</td>
										<td>2019.03.25</td>
									</tr>
									<tr>
										<td>3</td>
										<td>사용자3</td>
										<td>별명3</td>
										<td>활동 중...</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 목록 바디 끝 -->
				</div>
			</div>
			<!-- 유저 끝 -->
			
			<!-- 필터 시작 -->
			<div class="col-md-6">
	    		<div class="box">
					<div class="box-header">
						<h3 class="box-title">필터 목록</h3>
						<div class="box-tools pull-right">
							<a href="<c:url value='/admin/filter.pic'/>">더보기</a>
						</div>
					</div>
					
					<div class="box-body table-responsive">
						<table class="table table-hover table-striped" >
							<thead>
								<tr>
									<th>번호</th>
									<th>필터명</th>
									<th>가격</th>
									<th>상태</th>
									<th>이벤트 여부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>>필터명1</td>
									<td>3,000</td>
									<td>판매중</td>
									<td><i class="fa fa-circle text-red"></i></td>
								<tr>
									<td>2</td>
									<td>필터명2</td>
									<td>2,500</td>
									<td>판매중</td>
									<td><i class="fa fa-circle text-green"></i></td>
								<tr>
									<td>3</td>
									<td>필터명3</td>
									<td>3,900</td>
									<td>판매중</td>
									<td><i class="fa fa-circle text-red"></i></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 필터 끝 -->
		</div>
		<!-- 2행 끝 -->
		
		<!-- 3행 시작 -->
		<div class="row">
			<!-- 픽로드 시작 -->
			<div class="col-md-6">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">픽로드 목록</h3>
						<div class="box-tools pull-right">
							<a href="<c:url value='/admin/pickRoad.pic'/>">더보기</a>
						</div>
					</div>
					
					<div class="box-body table-responsive">
						<table class="table table-hover" >
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>사용자</th>
								<th>등록일</th>
							</tr>
							<tr>
								<td>1</td>
								<td>제목1</td>
								<td>내용1</td>
								<td>사용자명1</td>
								<td>등록일1</td>
							</tr>
							<tr>
								<td>2</td>
								<td>제목2</td>
								<td>내용2</td>
								<td>사용자명2</td>
								<td>등록일2</td>
							</tr>
							<tr>
								<td>3</td>
								<td>제목3</td>
								<td>내용3</td>
								<td>사용자명3</td>
								<td>등록일3</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- 픽로드 끝 -->
			
			<!-- 앨범다운 시작 -->
			<div class="col-md-6">
	    		<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">앨범 다운 기록</h3>
						<div class="box-tools pull-right">
							<a href="<c:url value='/admin/albumDown.pic'/>">더보기</a>
						</div>
					</div>
					
					<div class="box-body table-responsive">
						<table class="table table-hover" >
							<tr>
								<th>번호</th>
								<th>사용자</th>
								<th>다운로드일</th>
							</tr>
							<tr>
								<td>1</td>
								<td>사용자명1</td>
								<td>2019/02/22</td>
							</tr>
							<tr>
								<td>2</td>
								<td>사용자명2</td>
								<td>2019/03/04</td>
							</tr>
							<tr>
								<td>3</td>
								<td>사용자명3</td>
								<td>2019/04/25</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- 앨범다운 끝 -->
		</div>
		<!-- 3행 끝 -->
		
		<!-- 4행 시작 -->
		<div class="row">
			<!-- 신고함 시작 -->
			<div class="col-md-6">
				<div class="box box-primary">
					<!-- 박스 헤더 시작 -->
					<div class="box-header with-border">
			        	<h3 class="box-title">신고 게시글 목록</h3>	
						<div class="box-tools pull-right">
							<a href="<c:url value='/admin/report.pic'/>">더보기</a>
						</div>
					</div>
					<div class="box-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>게시판 분류</th>
										<th>신고된 사용자</th>
										<th>신고한 사용자</th>
										<th>신고일</th>
										<th>처리 상태</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>3</td>
										<td>제목3</td>
										<td>게시판1</td>
										<td>신고된 사용자명1</td>
										<td>신고한 사용자명2</td>
										<td>2019/03/12</td>
										<td>처리중</td>
									</tr>
									<tr>
										<td>2</td>
										<td>제목2</td>
										<td>게시판2</td>
										<td>신고된 사용자명2</td>
										<td>신고한 사용자명2</td>
										<td>2019/04/21</td>
										<td>처리중</td>
									</tr>
									<tr>
										<td>1</td>
										<td>제목1</td>
										<td>게시판1</td>
										<td>신고된 사용자명1</td>
										<td>신고한 사용자명1</td>
										<td>2019/12/34</td>
										<td>처리완료</td>
									</tr>	
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 신고함 끝 -->
			<!-- 휴지통 시작 -->
			<div class="col-md-6">
				<div class="box">
					<div class="box-header with-border">
			        	<h3 class="box-title">삭제된 게시글 목록</h3>	
						<div class="box-tools pull-right">
							<a href="<c:url value='/admin/recyclebin.pic'/>">더보기</a>
						</div>
					</div>
					<div class="box-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>게시판 분류</th>
										<th>사용자</th>
										<th>삭제일</th>
									</tr>
								</thead>
								<!-- 데이터를 받아오는 부분 -->
								<tbody>
									<tr>
										<td>1</td>
										<td>제목1</td>
										<td>게시판1</td>
										<td>사용자명1</td>
										<td>2019/12/34</td>
									</tr>
									<tr>
										<td>2</td>
										<td>제목2</td>
										<td>게시판2</td>
										<td>사용자명2</td>
										<td>2019/04/21</td>
									</tr>
									<tr>
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
				</div>
			</div>
			<!-- 휴지통 끝 -->
		</div>
		<!-- 4행 끝 -->
	</section>
</div>


<!-- ChartJS -->
<script src="<c:url value='/js/Chart.js'/>"></script>