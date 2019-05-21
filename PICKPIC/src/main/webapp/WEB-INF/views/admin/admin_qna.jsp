<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<div class="content-wrapper">
	<!-- 컨텐츠 헤더 시작 -->
	<section class="content-header">
		<h1>
			문의 <small>30 개의 문의사항</small>
		</h1>
	</section>
	<!-- 컨텐츠 헤더 시작 -->

	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" method="post"
					action="<c:url value='/admin/qna.pic'/>">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="box box-primary">
						<!-- 박스 헤더 시작 -->
						<div class="box-header with-border">
							<h3 class="box-title">문의 목록</h3>
						</div>
						<!-- 박스 헤더 끝 -->
						<c:if test="${empty list }" var="isEmpty">
							<tr>
								<td colspan="4">등록된 게시물이 없어요</td>
							</tr>
						</c:if>
						<c:if test="${not isEmpty}">
							<c:forEach var="item" items="${list}" varStatus="loop">
								<!-- 박스 바디 시작 -->
								<div class="box-body">

									<!-- Post -->
									<div class="post clearfix">
										<div class="user-block">
											<img class="img-circle img-bordered-sm"
												src="<c:url value='/resources/admin_images/user_icon.png'/>"
												alt="User Image"> <span class="username"> <a
												href="#">${item.Q_TITLE}</a>
											</span> <span class="description"><%-- ${item.Q_POST_DATE } --%></span>
										</div>
										<p>${item.Q_CONTENT }</p>
										<!-- 							<form class="form-horizontal"> -->
										<!-- 								<div class="form-group margin-bottom-none"> -->
										<!-- 									<div class="col-sm-10"> -->
										<!-- 										<input class="form-control input-sm" placeholder="등록"> -->
										<!-- 									</div> -->
										<!-- 									<div class="col-sm-2"> -->
										<!-- 										<button type="submit" class="btn btn-primary pull-right btn-block btn-sm">보내기</button> -->
										<!-- 									</div> -->
										<!-- 								</div> -->
										<!-- 							</form> -->
										<form class="form-horizontal">
								<div class="form-group margin-bottom-none">
									<div class="col-sm-10">
										<input class="form-control input-sm" placeholder="등록">
									</div>
									<div class="col-sm-2">
										<button type="submit" class="btn btn-primary pull-right btn-block btn-sm">보내기</button>
									</div>
								</div>
									</div>
									<hr style="border-bottom: solid 2px #87CEFA"> 
								</div>
				</form>
				</c:forEach>
				</c:if>

			</div>
	</section>
</div>
