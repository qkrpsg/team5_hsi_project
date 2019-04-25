<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/Bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/Top.css'/>" rel="stylesheet">
<script src="<c:url value='/Bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/mostrar_nav.js'/>"></script>
<script src="<c:url value='/js/Top.js'/>"></script>
<!-- CreRoot_Top.jsp -->
<%-- <header class="container-fluid header_top">

	<div class="menu_all_wrap_position">
		<div class="main_menu_wrap">
			<div class="logo col-md-2">
				<a href="<c:url value='/'/>"> <img id="top_logo"
					src="<c:url value='/resources/images/pickpic_logo_white.png'/>" />
				</a>
			</div>
		</div>
	</div>


</header> --%>
<div id="header">
<div style="width:100%;">
					<h1 class="logo fl" alt="여행의 시작! 어스토리">
				<a href="/ko/"><img src="/res/img/workspace/new/earthtory_ws_logo.png" alt="여행의 시작! 어스토리" style="margin-left:20px;"></a>
			</h1>
						<div class="fl" style="width:357px;border-right:solid #ebebeb 1px;height:62px"><div class="fl" id="plan_title"></div><div class="clear"></div></div>
		<div class="fl" style="width:181px;height:62px;line-height:62px;border-right:solid #ebebeb 1px;text-align:center;color: #555555;font-size:16px;font-weight:bold;" id="plan_total_budget"></div>
		<a href="#" class="fl" style="width:181px;height:62px;line-height:62px;border-right:solid #ebebeb 1px;text-align:center;color: #555555;font-size:16px;font-weight:bold;" id="plan_preview_link" target="_blank"><img src="/res/img/workspace/new/plan_preview_btn.png" style="vertical-align:middle;"> 미리보기</a>
				<div class="fl" style="height:62px;line-height:62px;padding-left:20px;"><a href="https://www.agoda.com/ko-kr/?cid=1607809" target="_blank" style="background:#ff9320;color:#fff;font-size:13px;padding:5px;font-weight:bold;border-radius:5px;">▶도시별 특가 호텔 - 아고다에서 오늘의 특가요금을 확인하세요.</a></div>
								<div class="fl" id="gnb_ci_name"></div>
		<div class="fr gnb_box">
			
		

		
			<div class="fr" style="margin-top:9px;margin-right:20px;">
									<div class="fl" id="plan_member_list_box">
			<div class="fl" style="margin-right:5px;"><img src="/res/img/common/mobile/img_profile.png" style="width:40px;height:40px;border-radius:20px;" onerror="this.src='/res/img/common/mobile/img_profile.png';"></div>
			<div class="clear"></div>
		</div>
		<div class="fl" style="margin-right:10px;margin-top:3px;cursor:pointer;" onclick="ws_invite();" id="ws_invite_btn" title="친구 초대"><img src="/res/img/workspace/new/ws_invite_btn.png"></div>
			<a href="/ko/mypage/?type=plan"><div class="fl" id="plan_out_btn">저장&닫기</div></a>
			<div class="fl" id="plan_complete_btn" onclick="plan_complete()">완료</div>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>

</div>


	</div>
	<div class="clear"></div>