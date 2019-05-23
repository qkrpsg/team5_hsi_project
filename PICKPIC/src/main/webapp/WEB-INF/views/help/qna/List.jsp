<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Pkp.css' />" rel="stylesheet">
<link href="<c:url value='/css/Help.css' />" rel="stylesheet">

<!-- List.jsp -->
<div class="l_pkp_all_wrap">
	<div class="l_pkp_sub_wrap">

		<div class="l_help_title_wrap">
			<div class="wrapper">
				<div class="box">
					<h2>문의사항</h2>
					<p>피크픽에대한 문의사항을 보내주세요.</p>
				</div>
			</div>
			<ol class="home_root">
				<li><a href="#">홈 /</a></li>
				<li><a href="#">고객센터 /</a></li>
				<li class="active">문의사항</li>
			</ol>
		</div>
		<div class="l_help_list_wrap">

			<!-- 검색용 UI -->
			<div class="row_serch">
				<form class="form-inline" method="post" action="#">
					<div class="form-group pull-left" style="margin-bottom: 1%">
						<a class="btn btn-block btn-primary btn-sm"  href="<c:url value='/help/qna/Write.pic'/>">문의하기</a>
					</div>
            
				
				</form>
			</div>

			<div class="row_list2">
				<table class="table table-hover table-responsive">
				
					<tr>
						<th class="text-center">번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>답변상태</th>
						<th class="text-center">아이디</th>
					</tr>
					<c:if test="${empty list }" var="isEmpty">
							<tr>
								<td colspan="4">등록된 게시물이 없어요</td>
							</tr>
						</c:if>
						<c:if test="${not isEmpty}">
							<c:forEach var="item" items="${list}" varStatus="loop">
					<tr>
						<td>${item.Q_INDEX }</td>
						<td id="title"><a href="<c:url value='/help/qna/View.pic?q_index=${item.Q_INDEX}'/> ">${item.Q_TITLE }</td>
						<td>${item.Q_POST_DATE}</td>
						<c:if test="${empty item.AQ_POST_DATE }" var="postempty">
						<td style="font-weight: bold;text-align: center">대기중</td>
						</c:if>
						<c:if test="${not postempty }">
						<td style="background-color: red;color:white;font-weight: bold;width:100px;text-align: center ">답변완료</td>
						</c:if>
		
						<td>${item.PPA_NICKNAME }</td>
					</tr>
				</c:forEach>
				</c:if>
				</table>
				</div>
				</div>
			<div class="row">
		<!-- 페이지네이션 가운데 배치:text-center -->
		<div class="col-md-12 text-center">${pagingString}</div>
	</div>
	<!-- l_pkp_sub_wrap -->
</div>
<!-- l_pkp_all_wrap -->

<script>
//Add event listener for opening and closing details

</script>



<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>

