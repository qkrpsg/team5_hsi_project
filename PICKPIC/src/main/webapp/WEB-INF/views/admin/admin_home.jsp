<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			관리자 페이지 <small>HOME</small>
		</h1>
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
							class="info-box-number">${adminNewPick }</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-green"><i class="fa fa-group"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">신규 회원</span> <span
							class="info-box-number">${adminNewUser }</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-yellow"><i
						class="fa fa-newspaper-o"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">신규 문의사항</span> <span
							class="info-box-number">${adminNewQuestion }</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-red"><i class="fa fa-krw"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">최근 판매량</span> <span
							class="info-box-number">${adminNewSale }</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 대시보드 끝 -->

		<!-- 1행 시작 -->
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-12">
								<h3 class="box-title">사이트 통계</h3>
								<p class="text-center">
									<strong>접속자 통계 : ${nowDate }</strong>
								</p>
							</div>
						</div>
						<div class="_GAN9" id="ID-overview-graph" data-guidedhelpid="overview-tab-graph"><div class="_GAEC"><div id="ID-overview-graph-lineChart"><div class="ID-chartLegend _GAWL"><div class="_GAq1"><div class="_GAb-_GAci-_GAhi"><div class="_GAdVb _GAb-_GAci-_GAhi"><span style="border-color: #058DC7" class="_GAytb"></span>&nbsp;사용자</div></div></div></div><div class="ID-chartDest _GAg0b" style="height: 160px;"><div style="position: relative;"><div dir="ltr" style="position: relative; width: 1580px; height: 160px;"><div aria-label="차트" style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%;"><svg width="1580" height="160" aria-label="차트" style="overflow: hidden;"><defs id="_ABSTRACT_RENDERER_ID_4"><clipPath id="_ABSTRACT_RENDERER_ID_5"><rect x="7" y="4" width="1553" height="136"></rect></clipPath><filter id="_ABSTRACT_RENDERER_ID_24"><feGaussianBlur in="SourceAlpha" stdDeviation="2"></feGaussianBlur><feOffset dx="1" dy="1"></feOffset><feComponentTransfer><feFuncA type="linear" slope="0.1"></feFuncA></feComponentTransfer><feMerge><feMergeNode></feMergeNode><feMergeNode in="SourceGraphic"></feMergeNode></feMerge></filter></defs><rect x="0" y="0" width="1580" height="160" stroke="none" stroke-width="0" fill="#ffffff"></rect><g><rect x="7" y="4" width="1553" height="136" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g clip-path="url(https://analytics.google.com/analytics/app/?hl=ko&amp;pli=1#_ABSTRACT_RENDERER_ID_5)"><g><rect x="7" y="4" width="1" height="136" stroke="none" stroke-width="0" fill="#ffffff"></rect><rect x="266" y="4" width="1" height="136" stroke="none" stroke-width="0" fill="#ffffff"></rect><rect x="524" y="4" width="1" height="136" stroke="none" stroke-width="0" fill="#ffffff"></rect><rect x="783" y="4" width="1" height="136" stroke="none" stroke-width="0" fill="#ffffff"></rect><rect x="1042" y="4" width="1" height="136" stroke="none" stroke-width="0" fill="#ffffff"></rect><rect x="1300" y="4" width="1" height="136" stroke="none" stroke-width="0" fill="#ffffff"></rect><rect x="1559" y="4" width="1" height="136" stroke="none" stroke-width="0" fill="#ffffff"></rect><rect x="7" y="139" width="1553" height="1" stroke="none" stroke-width="0" fill="#efefef"></rect><rect x="7" y="94" width="1553" height="1" stroke="none" stroke-width="0" fill="#efefef"></rect><rect x="7" y="49" width="1553" height="1" stroke="none" stroke-width="0" fill="#efefef"></rect><rect x="7" y="4" width="1553" height="1" stroke="none" stroke-width="0" fill="#efefef"></rect><rect x="7" y="117" width="1553" height="1" stroke="none" stroke-width="0" fill="#f9f9f9"></rect><rect x="7" y="72" width="1553" height="1" stroke="none" stroke-width="0" fill="#f9f9f9"></rect><rect x="7" y="27" width="1553" height="1" stroke="none" stroke-width="0" fill="#f9f9f9"></rect></g><g><g><path d="M7.5,139.5L7.5,139.5L7.5,117L266.1666666666667,112.5L524.8333333333334,103.5L783.5,121.5L1042.1666666666667,99L1300.8333333333335,94.5L1559.5,45L1559.5,139.5L1559.5,139.5Z" stroke="none" stroke-width="0" fill-opacity="0.1" fill="#058dc7"></path></g></g><g><rect x="7" y="139" width="1553" height="1" stroke="none" stroke-width="0" fill="#333333"></rect></g><g><path d="M7.5,117L266.1666666666667,112.5L524.8333333333334,103.5L783.5,121.5L1042.1666666666667,99L1300.8333333333335,94.5L1559.5,45" stroke="#058dc7" stroke-width="4" fill-opacity="1" fill="none"></path></g></g><g><circle cx="7.5" cy="117" r="4.5" stroke="none" stroke-width="0" fill="#058dc7"></circle><circle cx="266.1666666666667" cy="112.5" r="4.5" stroke="none" stroke-width="0" fill="#058dc7"></circle><g><circle cx="524.8333333333334" cy="103.5" r="7" stroke="#058dc7" stroke-width="1" fill="#ffffff"></circle><circle cx="524.8333333333334" cy="103.5" r="7.5" stroke="#000000" stroke-width="1" stroke-opacity="0.25" fill-opacity="1" fill="none"></circle><circle cx="524.8333333333334" cy="103.5" r="8.5" stroke="#000000" stroke-width="1" stroke-opacity="0.1" fill-opacity="1" fill="none"></circle><circle cx="524.8333333333334" cy="103.5" r="9.5" stroke="#000000" stroke-width="1" stroke-opacity="0.05" fill-opacity="1" fill="none"></circle><circle cx="524.8333333333334" cy="103.5" r="4.5" stroke="none" stroke-width="0" fill="#058dc7"></circle></g><circle cx="783.5" cy="121.5" r="4.5" stroke="none" stroke-width="0" fill="#058dc7"></circle><circle cx="1042.1666666666667" cy="99" r="4.5" stroke="none" stroke-width="0" fill="#058dc7"></circle><circle cx="1300.8333333333335" cy="94.5" r="4.5" stroke="none" stroke-width="0" fill="#058dc7"></circle><circle cx="1559.5" cy="45" r="4.5" stroke="none" stroke-width="0" fill="#058dc7"></circle></g><g><g><text text-anchor="middle" x="7.5" y="153.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">…</text><rect x="2" y="144.5" width="11" height="11" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect></g><g><text text-anchor="middle" x="266.1666666666667" y="153.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">5월 23일</text></g><g><text text-anchor="middle" x="524.8333333333334" y="153.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">5월 24일</text></g><g><text text-anchor="middle" x="783.5" y="153.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">5월 25일</text></g><g><text text-anchor="middle" x="1042.1666666666667" y="153.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">5월 26일</text></g><g><text text-anchor="middle" x="1300.8333333333335" y="153.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">5월 27일</text></g><g><text text-anchor="middle" x="1559.5" y="153.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">5월 2…</text><rect x="1541" y="144.5" width="37" height="11" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect></g><g><g><text text-anchor="start" x="10" y="106.85" font-family="Arial" font-size="11" stroke="#ffffff" stroke-width="3" fill="#444444" aria-hidden="true">10</text><text text-anchor="start" x="10" y="106.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">10</text></g></g><g><g><text text-anchor="start" x="10" y="61.85" font-family="Arial" font-size="11" stroke="#ffffff" stroke-width="3" fill="#444444" aria-hidden="true">20</text><text text-anchor="start" x="10" y="61.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">20</text></g></g><g><g><text text-anchor="start" x="10" y="16.85" font-family="Arial" font-size="11" stroke="#ffffff" stroke-width="3" fill="#444444" aria-hidden="true">30</text><text text-anchor="start" x="10" y="16.85" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#444444">30</text></g></g></g></g><g><g class="google-visualization-tooltip"><path d="M383.5,108.5A1,1,0,0,1,382.5,107.5L382.5,70.5A1,1,0,0,1,383.5,69.5L513.5,69.5A1,1,0,0,1,514.5,70.5L514.5,107.5A1,1,0,0,1,513.5,108.5Z" stroke="#cccccc" stroke-width="1" fill="#ffffff" filter="url(https://analytics.google.com/analytics/app/?hl=ko&amp;pli=1#_ABSTRACT_RENDERER_ID_24)"></path><g><text text-anchor="start" x="389" y="85.35" font-family="Arial" font-size="11" font-weight="bold" stroke="none" stroke-width="0" fill="#000000">2019년 5월 24일 금요일</text></g><g><rect x="389" y="93" width="5" height="5" stroke="none" stroke-width="0" fill="#058dc7"></rect><text text-anchor="start" x="398" y="99.35" font-family="Arial" font-size="11" stroke="none" stroke-width="0" fill="#000000">사용자:</text><text text-anchor="start" x="437" y="99.35" font-family="Arial" font-size="11" font-weight="bold" stroke="none" stroke-width="0" fill="#000000">8</text></g></g></g></svg><div aria-label="차트의 데이터를 표로 표시합니다." style="position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;"><table><thead><tr><th>사용자</th></tr></thead><tbody><tr><td>5</td></tr><tr><td>6</td></tr><tr><td>8</td></tr><tr><td>4</td></tr><tr><td>9</td></tr><tr><td>10</td></tr><tr><td>21</td></tr></tbody></table></div></div></div><div aria-hidden="true" style="display: none; position: absolute; top: 170px; left: 1590px; white-space: nowrap; font-family: Arial; font-size: 11px; font-weight: bold;">8</div><div></div></div></div></div><div id="ID-overview-graph-annotations"><div id="AnnotationDrawer" class="_GAtc"><div id="AnnotationDrawer_wrapper" class="_GAJsb" style="display:none"><div id="AnnotationDrawer_controls" class="_GAoh"><table class="full_width"><tbody><tr><td>표시:&nbsp;<a href="#" onclick="return false;" class="no_filter _GAAu selected">모두</a>&nbsp;|&nbsp;<a href="#" onclick="return false;" class="starred_filter _GAAu">별표</a></td><td align="right"><a href="#" onclick="return false;" class="_GALN _GAAu">+&nbsp;새 주석 만들기</a></td></tr></tbody></table></div><div id="AnnotationsDrawer_content" class="_GAPH" style="max-height: 147px;"><table id="AnnotationsDrawer_list" class="_GAA"><tbody><tr class="_GAUZb editable" style="display: none;"><td class="_GAze"><div class="_GAgmb _GAah"></div></td><td class="_GAsg">&nbsp;</td><td class="_GAdB"><span class="_GAnh" style="display:hidden"><div class="_GAMw"><div class="_GAxo"><div class="_GAwo">비공개</div></div></div></span><span>&nbsp;</span></td><td class="_GAJFb"><a href="#" onclick="return false;">수정</a></td><td class="_GAbBb">&nbsp;</td></tr><tr class="_GAob" style="display:none"><td colspan="7" class="_GAbqb"><form action="" onsubmit="return false;"><table><tbody><tr><td class="_GAze"><div class="_GAgmb _GAah"></div></td><td class="_GAsg"><input name="date" type="text" size="10"></td><td class="_GANrb"><textarea name="text" cols="40" rows="3"></textarea></td><td class="_GAqQb"><div class="_GAlyb"><span></span>/160</div></td><td class="_GAVSb">표시 대상:</td><td class="_GAEq"><div class="_GAEq public"><label for="AnnotationsDrawer_public_radiobutton" class="_GAgmb"><input type="radio" name="access" class="_GAgmb" value="PUBLIC" id="AnnotationsDrawer_public_radiobutton">공유됨</label></div><div class="_GAEq private"><label for="AnnotationsDrawer_private_radiobutton" class="_GAgmb"><input type="radio" name="access" class="_GAgmb" value="PRIVATE" id="AnnotationsDrawer_private_radiobutton">비공개</label> <span class="_GAb-_GAP-_GAnc ACTION-learnMore TARGET-2884495" style="display:none">?</span></div></td><td class="_GAIe"><a class="_GAjb _GAWn"><b><b><b>저장</b></b></b></a><div class="_GAeB"><div class="_GAcSb">|</div><a class="_GAZH">취소</a><div class="_GAAS"><div class="_GAcSb">|</div><a class="_GAHF">삭제</a></div></div></td></tr></tbody></table></form></td></tr><tr class="_GAhp" style="display:none"><td colspan="5">오류가 발생했습니다. 페이지 <a href="javascript:window.location.reload()">새로고침</a>을 실행한 다음 다시 시도하십시오.</td></tr></tbody><tbody></tbody></table></div></div><div class="_GAft"><div id="AnnotationDrawer_drawer_button" class="ACTION-click TARGET-drawerButton _GAPP _GArKb _GAgmb" data-guidedhelpid="annotation-drawer-button"><div class="drawer_button_icon"></div></div></div></div></div></div></div>
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
						<h3 class="box-title">회원 관리</h3>
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
									<c:forEach var="item" items="${user }" end="4" varStatus="loop">
										<tr>
											<td>${loop.count}</td>
											<td>${item.ppa_email }</td>
											<td>${item.ppa_nickname}</td>
											<td>${item.lh_ld }</td>
										</tr>
									</c:forEach>
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
						<h3 class="box-title">필터 관리</h3>
						<div class="box-tools pull-right">
							<a href="<c:url value='/admin/filter.pic'/>">더보기</a>
						</div>
					</div>

					<div class="box-body table-responsive">
						<table class="table table-hover table-striped">
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
								<c:forEach var="item" items="${filter }" end="4" varStatus="loop">
									<tr>
										<td>${loop.count}</td>
										<td>${item.f_name }</td>
										<td>${item.f_change}</td>
										<c:if test="${item.f_sale_yn eq 'Y' }" var="isSale">
											<td>판매중</td>
										</c:if>
										<c:if test="${not isSale }">
											<td>미판매중</td>
										</c:if>
										<c:if test="${item.f_event_yn eq 'Y' }" var="isEvent">
											<td>이벤트 진행중</td>
										</c:if>
										<c:if test="${not isEvent }">
											<td>이벤트 종료</td>
										</c:if>
									</tr>
								</c:forEach>
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
			<!-- 앨범다운 시작 -->
			<div class="col-md-6">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">픽플레이스 관리</h3>
						<div class="box-tools pull-right">
							<a href="<c:url value='/admin/pickPlace.pic'/>">더보기</a>
						</div>
					</div>

					<div class="box-body table-responsive">
						<table class="table table-hover">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
								<th>추천수</th>
							</tr>
							<c:forEach var="item" items="${place }" end="4" varStatus="loop">
								<tr>
									<td>${loop.count}</td>
									<td>${item.ppb_title }</td>
									<td>${item.ppb_post_date}</td>
									<td>${item.ppb_count}</td>
									<td>${item.ppb_pick}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<!-- 앨범다운 끝 -->
			<!-- 픽로드 시작 -->
			<div class="col-md-6">
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">픽로드 관리</h3>
						<div class="box-tools pull-right">
							<a href="<c:url value='/admin/pickRoad.pic'/>">더보기</a>
						</div>
					</div>

					<div class="box-body table-responsive">
						<table class="table table-hover">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
								<th>추천수</th>
							</tr>
							<c:forEach var="item" items="${road }" end="4" varStatus="loop">
								<tr>
									<td>${loop.count}</td>
									<td>${item.prb_title }</td>
									<td>${item.prb_post_date}</td>
									<td>${item.prb_view}</td>
									<td>${item.prb_recommend}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<!-- 픽로드 끝 -->
		</div>
		<!-- 3행 끝 -->
	</section>
</div>


<!-- ChartJS -->
<script src="<c:url value='/js/Chart.js'/>"></script>