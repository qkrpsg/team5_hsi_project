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
					<h2>공지사항</h2>
					<p>피크픽의 새로운 소식을 전합니다.</p>
				</div>
			</div>
			<ol class="home_root">
				<li><a href="#">홈 /</a></li>
				<li><a href="#">고객센터 /</a></li>
				<li class="active">공지사항</li>
			</ol>
		</div>
		<div class="l_help_list_wrap">
			<!-- 검색용 UI -->
		

			<div class="row_list">
			<table class="table table-hover table-responsive">
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">날짜</th>
					
					</tr>
					<c:if test="${empty list}" var="isEmpty">
					   <tr>					
 					        <td colspan="4">등록된 게시물이 없어요</td>
					   </tr>
					</c:if>
					<c:if test="${not isEmpty}">
					
					<c:forEach var="item" items="${list}" varStatus="loop">
						<tr>
							<td style="text-align: center">${item.N_INDEX}</td>
							<td class="text-left"><a href="<c:url value='/help/notice/View.pic?n_index=${item.N_INDEX}'/> ">${item.N_TITLE}</a></td>
							<td>${item.N_POST_DATE}</td>
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
		
		
		
	</div>
	<!-- l_pkp_sub_wrap -->
</div>
<!-- l_pkp_all_wrap -->

<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>