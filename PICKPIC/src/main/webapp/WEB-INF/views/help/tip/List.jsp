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
					<h2>피크픽TIP</h2>
					<p>피크픽을 사용하면서 생긴 팁을 공유하세요. </p>
				</div>
			</div>
			<ol class="home_root">
				<li><a href="#">홈 /</a></li>
				<li><a href="#">고객센터 /</a></li>
				<li class="active">피크픽TIP</li>
			</ol>
		</div>
		<div class="l_help_list_wrap">

			<!-- 검색용 UI -->
			<div class="row_serch">
				<form class="form-inline" method="post" action="#">
					<div class="form-group pull-left">
						<a class="btn btn-block btn-primary btn-sm"  href="<c:url value='/help/tip/Write.pic'/>">작성하기</a>
					</div>

					<div class="form-group">
						<select name="searchColumn" class="form-control input-sm">
							<option value="title">제목</option>
							<option value="name">사용자</option>
							<option value="content">내용</option>
						</select>
					</div>

					<div class="form-group">
						<input type="text" name="searchWord" class="form-control input-sm" />
					</div>
					<button type="submit" class="btn btn-primary btn-sm">검색</button>
				</form>
			</div>

			<div class="row_list2">
				<table class="table table-hover table-responsive">
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">최신</th>
						<th>제목</th>
						<th>날짜</th>
						<th class="text-center">조회수</th>
					</tr>
					
			<c:if test="${empty list }" var="isEmpty">
			       <tr>
			            <td colspan="4">등록된 게시물이 없어요</td>
			       </tr>
			   </c:if>
			   <c:if test="${not isEmpty}">
			      <c:forEach var="item" items="${list}" varStatus="loop">
			  <tr>
			     <td>${item.TB_INDEX }</td>
			     <td id="title"><a href="<c:url value='/help/tip/View.pic?tb_index=${item.TB_INDEX}'/> ">${item.TB_TITLE }</a></td>
			     <td>${item.TB_POST_DATE}</td>
			     <c:if test="${empty item.TB_POST_DATE }" var="postempty">
			     <td style="font-weight: bold;text-align: center">대기중</td>
			     </c:if>
<%-- 			     <c:if test="${not postempty }"> --%>
			     <td style="background-color: white;color:white;font-weight:bold;width:100px;text-align:center"></td>
<%-- 			     </c:if> --%>
			     
			     <td></td>
			    </tr>
			      
			      </c:forEach>
			   </c:if>
			   </table>
			</div>
		</div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination pagination-md d-flex">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- l_pkp_sub_wrap -->
</div>
<!-- l_pkp_all_wrap -->


<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>