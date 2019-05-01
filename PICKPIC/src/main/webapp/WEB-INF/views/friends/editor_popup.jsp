<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>네이버 포토업로더</title>
<link rel="stylesheet" type="text/css" href="/html5/css/base.css">
<link rel="stylesheet" type="text/css"
	href="/html5/css/photo_editor.css?$Rev:%20190102%20$">
<script type="text/javascript">
	var baseDomain = document.domain; //for flashdev, ndrive save
	document.domain = 'naver.com';
	var nPhotoAlbumPopUpURL = 'http://photo.cloud.naver.com/mini';
	var sNdriveSavePopUpURL = 'https://cloud.naver.com/saveFile.nhn';

	if (typeof nhn == 'undefined')
		nhn = {};
	nhn.sPopupUploaderType = 'new';
</script>
<script src="/js/jindo2.all.js?1.4.4">
	
</script>
<script src="/js/flashObject.js?1.2.2&amp;$Rev: 170202 $"></script>
<script type="text/javascript" charset="utf-8"
	src="/js/startup.js?$Rev: 170202 $">
	
</script>
<script src="/js/sns/interface.js?$Rev: 31062 $"></script>
<script type="text/javascript">
	function redirectToFlashUploader() {
		var url = window.location.href;

		var newUrl = changeParam(url, "userChoice", "flash");

		window.location.href = newUrl;
	}

	if (!checkHTML5Support()) {
		var url = window.location.href;

		var newUrl = changeParam(url, "useFlashUploader", "true");

		window.location.href = newUrl;
	}
</script>
</head>


<!-- [ Photoeditor Template : Start ] -->
<div class="npe_wrap" style="">
	<header class="npe_header">
		<div class="npe_header_func_btn_area npe_btn_area">
			<button type="button" class="npe_btn_icon npe_btn_undo">
				<span class="npe_btn_title _txt_undo-text">이전</span>
			</button>
			<button type="button" class="npe_btn_icon npe_btn_redo">
				<span class="npe_btn_title _txt_redo-text">다시</span>
			</button>
			<button type="button" class="npe_btn_icon npe_btn_original">
				<span class="npe_btn_title _txt_return_origin-text">초기화</span>
			</button>
			<button type="button" class="npe_btn_icon npe_btn_download">
				<span class="npe_btn_title _txt_image_save-text">사진저장</span>
			</button>
		</div>
		<div class="npe_header_submit_btn_area npe_btn_area">
			<button type="button" class="npe_btn_header npe_btn_cancel">
				<span class="npe_btn_title _txt_cancel-text">취소</span>
			</button>
			<button type="button" class="npe_btn_header npe_btn_submit">
				<span class="npe_btn_title _txt_done-text">완료</span>
			</button>
		</div>
		<div class="npe_compare_area">
			<button type="button" class="npe_btn_header npe_btn_compare">
				<span class="npe_btn_title">원본과 비교하기</span>
			</button>
			<div class="npe_compare_tooltip">
				<span class="npe_compare_tooltip_title">버튼을 누르면 원본과 비교할 수 있어요</span>
			</div>
		</div>
	</header>
	<nav class="npe_control_wrap npe_control_right">
		<div class="npe_control_area">
			<button type="button" data-targetcontrol="resize"
				class="npe_btn_control npe_btn_resize _useResize-show _txt_resize-text">크기</button>
			<button type="button" data-targetcontrol="crop"
				class="npe_btn_control npe_btn_crop _useCrop-show _txt_crop-text">자르기,
				회전</button>
			<button type="button" data-targetcontrol="filter"
				class="npe_btn_control npe_btn_filter _useFilter-show _txt_filter-text">필터</button>
			<button type="button" data-targetcontrol="adjust"
				class="npe_btn_control npe_btn_effect _useAdjust-show _txt_adjust-text">보정</button>
			<button type="button" data-targetcontrol="photoFrame"
				class="npe_btn_control npe_btn_frame _usePhotoFrame-show _txt_frame-text">액자</button>
			<button type="button" data-targetcontrol="signature"
				class="npe_btn_control npe_btn_sign _useSignature-show _txt_signature-text">서명</button>
			<button type="button" data-targetcontrol="mosaic"
				class="npe_btn_control npe_btn_mosaic _useMosaic-show _txt_mosaic-text">모자이크</button>
			<button type="button" data-targetcontrol="text"
				class="npe_btn_control _useText-show npe_btn_text _txt_text-text">텍스트</button>
			<button type="button" data-targetcontrol="sticker"
				class="npe_btn_control _useSticker-show npe_btn_sticker _txt_sticker-text">스티커</button>
			<button type="button" data-targetcontrol="clip"
				class="npe_btn_control _useClip-show npe_btn_mask _txt_clip-text">마스크</button>
			<label class="npe_view_set"><input type="checkbox"
				class="npe_view_set_check npe_blind"><i
				class="npe_icon_check"></i><span class="npe_view_set_title">화면
					맞춤</span></label>
		</div>
	</nav>
	<section class="npe_edit_wrap">
		<div class="npe_canvas_wrap" id="npe_canvas_wrap">
			<canvas class="npe_canvas" width="0" height="100"></canvas>
			<div class="npe_deg_wrap">
				<div class="npe_deg">
					<span class="npe_deg_circle npe_deg_circle_big" data-deg="-45"
						style="transform: rotate(90deg); top: 500px; right: 250px;"><em
						class="npe_deg_circle_num">-45</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-44"
						style="top: 500px; right: 241px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-43"
						style="top: 499px; right: 233px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-42"
						style="top: 499px; right: 224px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-41"
						style="top: 498px; right: 215px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="-40"
						style="transform: rotate(80deg); top: 496px; right: 207px;"><em
						class="npe_deg_circle_num">-40</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-39"
						style="top: 495px; right: 198px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-38"
						style="top: 493px; right: 190px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-37"
						style="top: 490px; right: 181px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-36"
						style="top: 488px; right: 173px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="-35"
						style="transform: rotate(70deg); top: 485px; right: 164px;"><em
						class="npe_deg_circle_num">-35</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-34"
						style="top: 482px; right: 156px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-33"
						style="top: 478px; right: 148px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-32"
						style="top: 475px; right: 140px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-31"
						style="top: 471px; right: 133px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="-30"
						style="transform: rotate(60deg); top: 467px; right: 125px;"><em
						class="npe_deg_circle_num">-30</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-29"
						style="top: 462px; right: 118px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-28"
						style="top: 457px; right: 110px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-27"
						style="top: 452px; right: 103px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-26"
						style="top: 447px; right: 96px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="-25"
						style="transform: rotate(50deg); top: 442px; right: 89px;"><em
						class="npe_deg_circle_num">-25</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-24"
						style="top: 436px; right: 83px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-23"
						style="top: 430px; right: 76px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-22"
						style="top: 424px; right: 70px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-21"
						style="top: 417px; right: 64px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="-20"
						style="transform: rotate(40deg); top: 411px; right: 58px;"><em
						class="npe_deg_circle_num">-20</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-19"
						style="top: 404px; right: 53px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-18"
						style="top: 397px; right: 48px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-17"
						style="top: 390px; right: 43px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-16"
						style="top: 382px; right: 38px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="-15"
						style="transform: rotate(30deg); top: 375px; right: 33px;"><em
						class="npe_deg_circle_num">-15</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-14"
						style="top: 367px; right: 29px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-13"
						style="top: 360px; right: 25px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-12"
						style="top: 352px; right: 22px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-11"
						style="top: 344px; right: 18px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="-10"
						style="transform: rotate(20deg); top: 336px; right: 15px;"><em
						class="npe_deg_circle_num">-10</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-9"
						style="top: 327px; right: 12px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-8"
						style="top: 319px; right: 10px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-7"
						style="top: 310px; right: 7px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-6"
						style="top: 302px; right: 5px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="-5"
						style="transform: rotate(10deg); top: 293px; right: 4px;"><em
						class="npe_deg_circle_num">-5</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-4"
						style="top: 285px; right: 2px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-3"
						style="top: 276px; right: 1px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-2"
						style="top: 267px; right: 1px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="-1"
						style="top: 259px; right: 0px;"></span><span
						class="npe_deg_circle npe_deg_circle_big on" data-deg="0"
						style="transform: rotate(0deg); top: 250px; right: 0px;"><em
						class="npe_deg_circle_num">0</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="1"
						style="top: 241px; right: 0px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="2"
						style="top: 233px; right: 1px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="3"
						style="top: 224px; right: 1px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="4"
						style="top: 215px; right: 2px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="5"
						style="transform: rotate(-10deg); top: 207px; right: 4px;"><em
						class="npe_deg_circle_num">5</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="6"
						style="top: 198px; right: 5px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="7"
						style="top: 190px; right: 7px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="8"
						style="top: 181px; right: 10px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="9"
						style="top: 173px; right: 12px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="10"
						style="transform: rotate(-20deg); top: 164px; right: 15px;"><em
						class="npe_deg_circle_num">10</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="11"
						style="top: 156px; right: 18px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="12"
						style="top: 148px; right: 22px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="13"
						style="top: 140px; right: 25px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="14"
						style="top: 133px; right: 29px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="15"
						style="transform: rotate(-30deg); top: 125px; right: 33px;"><em
						class="npe_deg_circle_num">15</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="16"
						style="top: 118px; right: 38px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="17"
						style="top: 110px; right: 43px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="18"
						style="top: 103px; right: 48px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="19"
						style="top: 96px; right: 53px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="20"
						style="transform: rotate(-40deg); top: 89px; right: 58px;"><em
						class="npe_deg_circle_num">20</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="21"
						style="top: 83px; right: 64px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="22"
						style="top: 76px; right: 70px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="23"
						style="top: 70px; right: 76px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="24"
						style="top: 64px; right: 83px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="25"
						style="transform: rotate(-50deg); top: 58px; right: 89px;"><em
						class="npe_deg_circle_num">25</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="26"
						style="top: 53px; right: 96px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="27"
						style="top: 48px; right: 103px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="28"
						style="top: 43px; right: 110px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="29"
						style="top: 38px; right: 118px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="30"
						style="transform: rotate(-60deg); top: 33px; right: 125px;"><em
						class="npe_deg_circle_num">30</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="31"
						style="top: 29px; right: 133px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="32"
						style="top: 25px; right: 140px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="33"
						style="top: 22px; right: 148px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="34"
						style="top: 18px; right: 156px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="35"
						style="transform: rotate(-70deg); top: 15px; right: 164px;"><em
						class="npe_deg_circle_num">35</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="36"
						style="top: 12px; right: 173px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="37"
						style="top: 10px; right: 181px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="38"
						style="top: 7px; right: 190px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="39"
						style="top: 5px; right: 198px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="40"
						style="transform: rotate(-80deg); top: 4px; right: 207px;"><em
						class="npe_deg_circle_num">40</em></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="41"
						style="top: 2px; right: 215px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="42"
						style="top: 1px; right: 224px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="43"
						style="top: 1px; right: 233px;"></span><span
						class="npe_deg_circle npe_deg_circle_small" data-deg="44"
						style="top: 0px; right: 241px;"></span><span
						class="npe_deg_circle npe_deg_circle_big" data-deg="45"
						style="transform: rotate(-90deg); top: 0px; right: 250px;"><em
						class="npe_deg_circle_num">45</em></span>
				</div>
				<div class="npe_deg_option">
					<span class="npe_deg_cursor"></span>
					<button type="button" class="npe_btn_deg_auto">
						<span class="npe_auto_title _txt_auto-text">자동</span>
					</button>
				</div>
			</div>
			<div class="npe_size_wrap">
				<div class="npe_size_width">
					<span class="npe_size_width_text">W <em
						class="npe_size_width_num">3000</em></span>
				</div>
				<div class="npe_size_height">
					<span class="npe_size_height_text">H <em
						class="npe_size_height_num">3000</em></span>
				</div>
			</div>
			<textarea class="npe_text_wrap" wrap="off" spellcheck="false"></textarea>
			<div class="npe_text_hidden"></div>
		</div>
		<div class="npe_sign_wrap">
			<div class="npe_sign_coord_w">
				W <span class="npe_sign_coord_num"></span>
			</div>
			<div class="npe_sign_coord_h">
				H <span class="npe_sign_coord_num"></span>
			</div>
		</div>
		<div class="npe_notice_toast">
			<span class="npe_notice_toast_text">토스트 메시지</span>
		</div>
		<div class="npe_control_detail_wrap">
			<div class="npe_control_detail npe_control_resize"
				data-control="resize">
				<strong class="npe_blind">크기</strong>
				<div class="npe_resize_area npe_resize_function_area">
					<span
						class="npe_btn_detail_text npe_btn_detail_resize npe_btn_direct_input _useResizeCustom-keep"
						data-resize="custom"><input type="text"
						class="npe_detail_title _txt_direct-attr _txt_direct-val"
						maxlength="5" data-placeholder="직접입력">
					<button type="button" class="npe_btn_direct_input_confirm"></button></span>
					<button type="button"
						class="npe_btn_detail_text npe_btn_detail_resize"
						data-resize="original">
						<span class="npe_detail_title"><span
							class="npe_original_text _txt_original_btn-text">원본</span> <span
							class="npe_original_size"><span class="_width-text"></span>
								x <span class="_height-text"></span></span></span>
					</button>
				</div>
				<div
					class="npe_resize_area npe_resize_preset_area _resizePreset _resizePreset-list"
					id="">
					<script type="text/tw-template"></script>
					<button type="button"
						class="npe_btn_detail_text npe_btn_detail_resize _item-replace _item-attr _item _new"
						data-resize="320">
						<span class="npe_detail_title">320</span>
					</button>
					<button type="button"
						class="npe_btn_detail_text npe_btn_detail_resize _item-replace _item-attr _item _new"
						data-resize="400">
						<span class="npe_detail_title">400</span>
					</button>
					<button type="button"
						class="npe_btn_detail_text npe_btn_detail_resize _item-replace _item-attr _item _new"
						data-resize="480">
						<span class="npe_detail_title">480</span>
					</button>
					<button type="button"
						class="npe_btn_detail_text npe_btn_detail_resize _item-replace _item-attr _item _new"
						data-resize="550">
						<span class="npe_detail_title">550</span>
					</button>
					<button type="button"
						class="npe_btn_detail_text npe_btn_detail_resize _item-replace _item-attr _item _new"
						data-resize="650">
						<span class="npe_detail_title">650</span>
					</button>
					<button type="button"
						class="npe_btn_detail_text npe_btn_detail_resize _item-replace _item-attr _item _new"
						data-resize="740">
						<span class="npe_detail_title">740</span>
					</button>
					<button type="button"
						class="npe_btn_detail_text npe_btn_detail_resize _item-replace _item-attr _item _new"
						data-resize="960">
						<span class="npe_detail_title">960</span>
					</button>
					<button type="button"
						class="npe_btn_detail_text npe_btn_detail_resize _item-replace _item-attr _item _new"
						data-resize="1080">
						<span class="npe_detail_title">1080</span>
					</button>
				</div>
				<span class="npe_detail_bar"></span>
				<div class="npe_resize_area npe_resize_apply_area">
					<button type="button" class="npe_btn_icon npe_btn_apply_all">
						<span class="npe_btn_title _txt_apply_all-text">모든 사진 적용</span>
					</button>
					<button type="button" class="npe_btn_icon npe_btn_apply_select">
						<span class="npe_btn_title _txt_apply_select-text">일부 사진 적용</span>
					</button>
				</div>
			</div>
			<div class="npe_control_detail npe_control_crop" data-control="crop">
				<strong class="npe_blind">자르기</strong>
				<button type="button" class="npe_btn_icon npe_btn_rotate">
					<span class="npe_btn_title _txt_rotate-text">회전</span>
				</button>
				<button type="button" class="npe_btn_icon npe_btn_horizon">
					<span class="npe_btn_title">좌우반전</span>
				</button>
				<button type="button" class="npe_btn_icon npe_btn_vertical">
					<span class="npe_btn_title">상하반전</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_crop on"
					data-crop="original">
					<div class="npe_detail_thumb_area">
						<span class="npe_detail_thumb"> <span
							class="npe_detail_thumb_img"></span>
						</span>
					</div>
					<span class="npe_detail_title _txt_original_ratio-text">원본비율</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_crop" data-crop="free">
					<div class="npe_detail_thumb_area">
						<span class="npe_detail_thumb"> <span
							class="npe_detail_thumb_img"></span>
						</span>
					</div>
					<span class="npe_detail_title _txt_free_ratio-text">자유</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_crop" data-crop="16:9">
					<div class="npe_detail_thumb_area crop_16x9">
						<span class="npe_detail_thumb"> <span
							class="npe_detail_thumb_img"></span>
						</span>
					</div>
					<span class="npe_detail_title">16:9</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_crop" data-crop="3:2">
					<div class="npe_detail_thumb_area crop_3x2">
						<span class="npe_detail_thumb"> <span
							class="npe_detail_thumb_img"></span>
						</span>
					</div>
					<span class="npe_detail_title">3:2</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_crop" data-crop="4:3">
					<div class="npe_detail_thumb_area crop_4x3">
						<span class="npe_detail_thumb"> <span
							class="npe_detail_thumb_img"></span>
						</span>
					</div>
					<span class="npe_detail_title">4:3</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_crop" data-crop="1:1">
					<div class="npe_detail_thumb_area crop_1x1">
						<span class="npe_detail_thumb"> <span
							class="npe_detail_thumb_img"></span>
						</span>
					</div>
					<span class="npe_detail_title">1:1</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_crop" data-crop="3:4">
					<div class="npe_detail_thumb_area crop_3x4">
						<span class="npe_detail_thumb"> <span
							class="npe_detail_thumb_img"></span>
						</span>
					</div>
					<span class="npe_detail_title">3:4</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_crop" data-crop="2:3">
					<div class="npe_detail_thumb_area crop_2x3">
						<span class="npe_detail_thumb"> <span
							class="npe_detail_thumb_img"></span>
						</span>
					</div>
					<span class="npe_detail_title">2:3</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_crop" data-crop="9:16">
					<div class="npe_detail_thumb_area crop_9x16">
						<span class="npe_detail_thumb"> <span
							class="npe_detail_thumb_img"></span>
						</span>
					</div>
					<span class="npe_detail_title">9:16</span>
				</button>
				<span class="npe_detail_bar"></span>
				<button type="button" class="npe_btn_icon npe_btn_confirm">
					<span class="npe_btn_title _txt_confirm-text">확인</span>
				</button>
			</div>
			<div
				class="npe_control_detail npe_control_filter _filters _filters-list"
				data-control="filter" id="">
				<strong class="npe_blind">필터</strong>
				<button type="button"
					class="npe_filter_list_arrow npe_filter_list_prev disable">
					<span class="npe_blind">이전</span>
				</button>
				<div class="npe_detail_filter_area _filters-list" id="">
					<script type="text/tw-template"></script>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="-1">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_original-text">Original</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="1">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_clear-text">Clear</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="2">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_bright-text">Bright</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="3">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_cream-text">Cream</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="4">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_delight-text">Delight</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="5">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_blossom-text">Blossom</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="6">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_warm-text">Warm</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="7">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_lollipop-text">Lollipop</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="8">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_candy-text">Candy</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="9">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_mint-text">Mint</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="10">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_cool-text">Cool</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="11">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_cobalt-text">Cobalt</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="12">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_classic-text">Classic</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="13">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_vintage-text">Vintage</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="14">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_urban-text">Urban</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="15">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_chic-text">Chic</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="16">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_blank-text">Blank</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="17">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_tintp-text">Tint
							P</span>
					</button>
					<button type="button"
						class="npe_btn_detail_thumb npe_btn_detail_filter _code-attr _item _new"
						data-filter="18">
						<div class="npe_detail_thumb_area">
							<span class="npe_detail_thumb">
								<canvas class="npe_detail_thumb_img"></canvas>
							</span>
						</div>
						<span
							class="npe_detail_title _i18n-addI18nTextClass _txt_filter_tinty-text">Tint
							Y</span>
					</button>
				</div>
				<button type="button"
					class="npe_filter_list_arrow npe_filter_list_next disable">
					<span class="npe_blind">다음</span>
				</button>
				<span class="npe_detail_bar"></span>
				<button type="button" class="npe_btn_icon npe_btn_apply_all">
					<span class="npe_btn_title _txt_apply_all-text">모든 사진 적용</span>
				</button>
				<button type="button" class="npe_btn_icon npe_btn_apply_select">
					<span class="npe_btn_title _txt_apply_select-text">일부 사진 적용</span>
				</button>
				<div class="npe_control_detail_slide_area npe_slide_area">
					<input type="range" min="0" max="100" step="1" data-base="0"
						data-basedata="0" data-mindata="0" data-maxdata="1"
						class="npe_slide npe_slide_filter on">
					<div class="npe_slide_appear">
						<div class="npe_slide_background_track_back"></div>
						<div class="npe_slide_background_track" style="width: 50%;"></div>
						<div class="npe_slide_background_thumb" style="left: 50%;"></div>
						<span class="npe_control_detail_slide_number npe_slide_number"
							style="left: 50%;">50</span>
					</div>
				</div>
			</div>
			<div class="npe_control_detail npe_control_effect"
				data-control="adjust">
				<strong class="npe_blind">보정</strong>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_effect auto_effect"
					data-adjust="auto_adjust">
					<span class="npe_btn_title _txt_auto_adjustment-text">자동보정</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_effect brightness on"
					data-adjust="brightness">
					<span class="npe_btn_title _txt_brightness-text">밝기</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_effect chroma"
					data-adjust="saturation">
					<span class="npe_btn_title _txt_saturation-text">채도</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_effect resolution"
					data-adjust="sharpen">
					<span class="npe_btn_title _txt_sharpen-text">선명도</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_effect color"
					data-adjust="kelvin">
					<span class="npe_btn_title _txt_kelvin-text">색온도</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_effect constrast"
					data-adjust="contrast">
					<span class="npe_btn_title _txt_contrast-text">대비</span>
				</button>
				<div class="npe_control_detail_slide_area npe_slide_area">
					<input type="range" min="-100" max="100" step="1" data-base="0"
						data-basedata="0" data-mindata="-0.4" data-maxdata="0.4"
						class="npe_slide npe_slide_brightness on" data-adjust="brightness">
					<input type="range" min="-100" max="100" step="1" data-base="0"
						data-basedata="1" data-mindata="0" data-maxdata="4"
						class="npe_slide npe_slide_chroma" data-adjust="saturation">
					<input type="range" min="-100" max="100" step="1" data-base="0"
						data-basedata="0" data-mindata="-0.3" data-maxdata="0.3"
						class="npe_slide npe_slide_resolution" data-adjust="sharpen">
					<input type="range" min="-100" max="100" step="1" data-base="0"
						data-basedata="0" data-mindata="-0.3" data-maxdata="0.3"
						class="npe_slide npe_slide_color" data-adjust="kelvin"> <input
						type="range" min="-100" max="100" step="1" data-base="0"
						data-basedata="1" data-mindata="0.5" data-maxdata="1.5"
						class="npe_slide npe_slide_constrast" data-adjust="contrast">
					<div class="npe_slide_appear">
						<div class="npe_slide_background_track_back"></div>
						<div class="npe_slide_background_track"></div>
						<div class="npe_slide_background_thumb"></div>
						<span class="npe_control_detail_slide_number npe_slide_number">0</span>
					</div>
				</div>
			</div>
			<div
				class="npe_control_detail npe_control_frame _frames _frames-list"
				data-control="photoFrame" id="">
				<strong class="npe_blind">액자</strong>
				<script type="text/tw-template"></script>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_frame _code-attr _item _new"
					data-frame="0">
					<div class="npe_detail_thumb_area">
						<span class="npe_detail_thumb"> </span>
					</div>
					<span
						class="npe_detail_title _i18n-addI18nTextClass _txt_none_apply-text">적용
						안함</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_frame _code-attr _item _new"
					data-frame="1">
					<div class="npe_detail_thumb_area">
						<span class="npe_detail_thumb"> <img alt=""
							class="npe_img_frame _src-src _src-keep"
							src="/html5/img/icons/npe_frame_1.png">
						</span>
					</div>
					<span
						class="npe_detail_title _i18n-addI18nTextClass _txt_frame_1-text">하얀액자</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_frame _code-attr _item _new"
					data-frame="2">
					<div class="npe_detail_thumb_area">
						<span class="npe_detail_thumb"> <img alt=""
							class="npe_img_frame _src-src _src-keep"
							src="/html5/img/icons/npe_frame_2.png">
						</span>
					</div>
					<span
						class="npe_detail_title _i18n-addI18nTextClass _txt_frame_2-text">검은액자</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_frame _code-attr _item _new"
					data-frame="3">
					<div class="npe_detail_thumb_area">
						<span class="npe_detail_thumb"> <img alt=""
							class="npe_img_frame _src-src _src-keep"
							src="/html5/img/icons/npe_frame_3.png">
						</span>
					</div>
					<span
						class="npe_detail_title _i18n-addI18nTextClass _txt_frame_3-text">둥근액자</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_frame _code-attr _item _new"
					data-frame="4">
					<div class="npe_detail_thumb_area">
						<span class="npe_detail_thumb"> <img alt=""
							class="npe_img_frame _src-src _src-keep"
							src="/html5/img/icons/npe_frame_6.png">
						</span>
					</div>
					<span
						class="npe_detail_title _i18n-addI18nTextClass _txt_frame_6-text">투명
						모서리</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_frame _code-attr _item _new"
					data-frame="5">
					<div class="npe_detail_thumb_area">
						<span class="npe_detail_thumb"> <img alt=""
							class="npe_img_frame _src-src _src-keep"
							src="/html5/img/icons/npe_frame_4.png">
						</span>
					</div>
					<span
						class="npe_detail_title _i18n-addI18nTextClass _txt_frame_4-text">낡은액자</span>
				</button>
				<button type="button"
					class="npe_btn_detail_thumb npe_btn_detail_frame _code-attr _item _new"
					data-frame="6">
					<div class="npe_detail_thumb_area">
						<span class="npe_detail_thumb"> <img alt=""
							class="npe_img_frame _src-src _src-keep"
							src="/html5/img/icons/npe_frame_5.png">
						</span>
					</div>
					<span
						class="npe_detail_title _i18n-addI18nTextClass _txt_frame_5-text">종이액자</span>
				</button>
				<span class="npe_detail_bar"></span>
				<button type="button" class="npe_btn_icon npe_btn_apply_all">
					<span class="npe_btn_title _txt_apply_all-text">모든 사진 적용</span>
				</button>
				<button type="button" class="npe_btn_icon npe_btn_apply_select">
					<span class="npe_btn_title _txt_apply_select-text">일부 사진 적용</span>
				</button>
			</div>
			<div class="npe_control_detail npe_control_sign"
				data-control="signature">
				<strong class="npe_blind">서명</strong>
				<button type="button" class="npe_btn_icon npe_btn_sign_none on"
					data-signature="none">
					<span class="npe_btn_title _txt_none_signature-text">서명 안함</span>
				</button>
				<button type="button" class="npe_btn_icon npe_btn_sign_image"
					data-signature="image">
					<span class="npe_btn_title _txt_image_signature-text">이미지 서명</span>
				</button>
				<button type="button" class="npe_btn_icon npe_btn_sign_text"
					data-signature="text">
					<span class="npe_btn_title _txt_text_signature-text">텍스트 서명</span>
				</button>
				<span class="npe_detail_bar"></span>
				<button type="button" class="npe_btn_icon npe_btn_apply_all">
					<span class="npe_btn_title _txt_apply_all-text">모든 사진 적용</span>
				</button>
				<button type="button" class="npe_btn_icon npe_btn_apply_select">
					<span class="npe_btn_title _txt_apply_select-text">일부 사진 적용</span>
				</button>
				<div class="npe_detail_option npe_detail_option_sign_image"
					data-signature="image">
					<span class="npe_sign_image_data _txt_signature_image_input-text">400x200px,
						200kb 이하</span> <label class="npe_btn_detail npe_btn_detail_text">
						<input class="npe_sign_image_file npe_blind" type="file"
						accept=".jpg, .jpeg, .gif, .png, .bmp, .heif, .heic"> <span
						class="npe_detail_title _txt_signature_image_load-text">불러오기</span>
					</label>
				</div>
				<div class="npe_detail_option npe_detail_option_sign_text"
					data-signature="text">
					<span class="npe_sign_text_input_area"> <input type="text"
						class="npe_sign_text_input _txt_signature_text_placeholder-placeholder"
						spellcheck="false" readonly="" placeholder="국문 최대 21자, 영문 42자">
					</span>
					<div class="npe_text_tool_area">
						<span class="npe_text_tool npe_text_font_family"
							data-clickcode="PTE_G_FONT"> <span class="npe_tool_title"
							title="글꼴">나눔고딕</span>
							<ul
								class="npe_tool_list npe_text_font_family_list _fonts _fonts-list"
								id="">
								<script type="text/tw-template"></script>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="" data-type="default" data-default="true"
									style="font-family: &amp; quot;malgun gothic&amp;quot;, &amp;quot;맑은 고딕&amp;quot;, &amp;quot;Helvetica Neue&amp;quot;, helvetica, AppleSDGothicNeo-Regular, sans-serif, simhei;">폰트명</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="" data-type="nanumgothic"
									style="font-family: 나눔고딕, nanumgothic, se_NanumGothic, AppleSDGothicNeo-Regular, sans-serif, simhei;">폰트명</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="" data-type="nanummyeongjo"
									style="font-family: 나눔명조, nanummyeongjo, se_NanumMyeongjo, serif, simsun;">폰트명</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="" data-type="nanumbarungothic"
									style="font-family: 나눔바른고딕, nanumbarungothic, se_NanumBarunGothic, AppleSDGothicNeo-Regular, sans-serif, simhei;">폰트명</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Abel" data-type="Abel" title="Abel"
									style="font-family: Abel, sans-serif;">Abel</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Arvo" data-type="Arvo" title="Arvo"
									style="font-family: Arvo, serif;">Arvo</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Bungee Shade" data-type="Bungee Shade"
									title="Bungee Shade"
									style="font-family: &amp; quot;Bungee Shade&amp;quot;, cursive;">Bungee
									Shade</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Cookie" data-type="Cookie" title="Cookie"
									style="font-family: Cookie, cursive;">Cookie</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Crimson Text" data-type="Crimson Text"
									title="Crimson Text"
									style="font-family: &amp; quot;Crimson Text&amp;quot;, serif;">Crimson
									Text</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Dancing Script" data-type="Dancing Script"
									title="Dancing Script"
									style="font-family: &amp; quot;Dancing Script&amp;quot;, cursive;">Dancing
									Script</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Dosis" data-type="Dosis" title="Dosis"
									style="font-family: Dosis, sans-serif;">Dosis</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Duru Sans" data-type="Duru Sans" title="Duru Sans"
									style="font-family: &amp; quot;Duru Sans&amp;quot;, sans-serif;">Duru
									Sans</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Inconsolata" data-type="Inconsolata"
									title="Inconsolata"
									style="font-family: Inconsolata, monospace;">Inconsolata</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Kreon" data-type="Kreon" title="Kreon"
									style="font-family: Kreon, serif;">Kreon</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Lancelot" data-type="Lancelot" title="Lancelot"
									style="font-family: Lancelot, cursive;">Lancelot</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Lobster" data-type="Lobster" title="Lobster"
									style="font-family: Lobster, cursive;">Lobster</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Mandali" data-type="Mandali" title="Mandali"
									style="font-family: Mandali, sans-serif;">Mandali</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Noto Sans" data-type="Noto Sans" title="Noto Sans"
									style="font-family: &amp; quot;Noto Sans&amp;quot;, sans-serif;">Noto
									Sans</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Noto Serif" data-type="Noto Serif"
									title="Noto Serif"
									style="font-family: &amp; quot;Noto Serif&amp;quot;, serif;">Noto
									Serif</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Podkova" data-type="Podkova" title="Podkova"
									style="font-family: Podkova, serif;">Podkova</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Quicksand" data-type="Quicksand" title="Quicksand"
									style="font-family: Quicksand, sans-serif;">Quicksand</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Rasa" data-type="Rasa" title="Rasa"
									style="font-family: Rasa, serif;">Rasa</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sanchez" data-type="Sanchez" title="Sanchez"
									style="font-family: Sanchez,&amp; quot;serif &amp;quot;;">Sanchez</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Arial" data-type="Arial" title="Arial"
									style="font-family: Arial, sans-serif, simhei;">Arial</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Arial Black" data-type="Arial Black"
									title="Arial Black"
									style="font-family: &amp; quot;Arial Black&amp;quot;, sans-serif, simhei;">Arial
									Black</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Batang" data-type="Batang" title="Batang"
									style="font-family: Batang, sans-serif, simhei;">Batang</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="BatangChe" data-type="BatangChe" title="BatangChe"
									style="font-family: BatangChe, sans-serif, simhei;">BatangChe</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Book Antiqua" data-type="Book Antiqua"
									title="Book Antiqua"
									style="font-family: &amp; quot;Book Antiqua&amp;quot;, sans-serif, simhei;">Book
									Antiqua</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Calibri" data-type="Calibri" title="Calibri"
									style="font-family: Calibri, sans-serif, simhei;">Calibri</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Calibri Light" data-type="Calibri Light"
									title="Calibri Light"
									style="font-family: &amp; quot;Calibri Light&amp;quot;, sans-serif, simhei;">Calibri
									Light</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Calisto MT" data-type="Calisto MT"
									title="Calisto MT"
									style="font-family: &amp; quot;Calisto MT&amp;quot;, sans-serif, simhei;">Calisto
									MT</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Cambria" data-type="Cambria" title="Cambria"
									style="font-family: Cambria, sans-serif, simhei;">Cambria</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Cambria Math" data-type="Cambria Math"
									title="Cambria Math"
									style="font-family: &amp; quot;Cambria Math&amp;quot;, sans-serif, simhei;">Cambria
									Math</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Candara" data-type="Candara" title="Candara"
									style="font-family: Candara, sans-serif, simhei;">Candara</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Century Gothic" data-type="Century Gothic"
									title="Century Gothic"
									style="font-family: &amp; quot;Century Gothic&amp;quot;, sans-serif, simhei;">Century
									Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Comic Sans MS" data-type="Comic Sans MS"
									title="Comic Sans MS"
									style="font-family: &amp; quot;Comic Sans MS&amp;quot;, sans-serif, simhei;">Comic
									Sans MS</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Consolas" data-type="Consolas" title="Consolas"
									style="font-family: Consolas, sans-serif, simhei;">Consolas</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Constantia" data-type="Constantia"
									title="Constantia"
									style="font-family: Constantia, sans-serif, simhei;">Constantia</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Copperplate Gothic" data-type="Copperplate Gothic"
									title="Copperplate Gothic"
									style="font-family: &amp; quot;Copperplate Gothic&amp;quot;, sans-serif, simhei;">Copperplate
									Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Copperplate Gothic Light"
									data-type="Copperplate Gothic Light"
									title="Copperplate Gothic Light"
									style="font-family: &amp; quot;Copperplate Gothic Light&amp;quot;, sans-serif, simhei;">Copperplate
									Gothic Light</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Corbel" data-type="Corbel" title="Corbel"
									style="font-family: Corbel, sans-serif, simhei;">Corbel</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Courier New" data-type="Courier New"
									title="Courier New"
									style="font-family: &amp; quot;Courier New&amp;quot;, sans-serif, simhei;">Courier
									New</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Dotum" data-type="Dotum" title="Dotum"
									style="font-family: Dotum, sans-serif, simhei;">Dotum</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="DotumChe" data-type="DotumChe" title="DotumChe"
									style="font-family: DotumChe, sans-serif, simhei;">DotumChe</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Ebrima" data-type="Ebrima" title="Ebrima"
									style="font-family: Ebrima, sans-serif, simhei;">Ebrima</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Franklin Gothic Medium"
									data-type="Franklin Gothic Medium"
									title="Franklin Gothic Medium"
									style="font-family: &amp; quot;Franklin Gothic Medium&amp;quot;, sans-serif, simhei;">Franklin
									Gothic Medium</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Gabriola" data-type="Gabriola" title="Gabriola"
									style="font-family: Gabriola, sans-serif, simhei;">Gabriola</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Gadugi" data-type="Gadugi" title="Gadugi"
									style="font-family: Gadugi, sans-serif, simhei;">Gadugi</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Georgia" data-type="Georgia" title="Georgia"
									style="font-family: Georgia, sans-serif, simhei;">Georgia</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Gulim" data-type="Gulim" title="Gulim"
									style="font-family: Gulim, sans-serif, simhei;">Gulim</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="GulimChe" data-type="GulimChe" title="GulimChe"
									style="font-family: GulimChe, sans-serif, simhei;">GulimChe</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Gungsuh" data-type="Gungsuh" title="Gungsuh"
									style="font-family: Gungsuh, sans-serif, simhei;">Gungsuh</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="GungsuhChe" data-type="GungsuhChe"
									title="GungsuhChe"
									style="font-family: GungsuhChe, sans-serif, simhei;">GungsuhChe</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Impact" data-type="Impact" title="Impact"
									style="font-family: Impact, sans-serif, simhei;">Impact</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Javanese Text" data-type="Javanese Text"
									title="Javanese Text"
									style="font-family: &amp; quot;Javanese Text&amp;quot;, sans-serif, simhei;">Javanese
									Text</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Leelawadee UI" data-type="Leelawadee UI"
									title="Leelawadee UI"
									style="font-family: &amp; quot;Leelawadee UI&amp;quot;, sans-serif, simhei;">Leelawadee
									UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Lucida Console" data-type="Lucida Console"
									title="Lucida Console"
									style="font-family: &amp; quot;Lucida Console&amp;quot;, sans-serif, simhei;">Lucida
									Console</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Lucida Sans Unicode"
									data-type="Lucida Sans Unicode" title="Lucida Sans Unicode"
									style="font-family: &amp; quot;Lucida Sans Unicode&amp;quot;, sans-serif, simhei;">Lucida
									Sans Unicode</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Malgun Gothic" data-type="Malgun Gothic"
									title="Malgun Gothic"
									style="font-family: &amp; quot;Malgun Gothic&amp;quot;, sans-serif, simhei;">Malgun
									Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Marlett" data-type="Marlett" title="Marlett"
									style="font-family: Marlett, sans-serif, simhei;">Marlett</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Meiryo" data-type="Meiryo" title="Meiryo"
									style="font-family: Meiryo, sans-serif, simhei;">Meiryo</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Meiryo UI" data-type="Meiryo UI" title="Meiryo UI"
									style="font-family: &amp; quot;Meiryo UI&amp;quot;, sans-serif, simhei;">Meiryo
									UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft Himalaya" data-type="Microsoft Himalaya"
									title="Microsoft Himalaya"
									style="font-family: &amp; quot;Microsoft Himalaya&amp;quot;, sans-serif, simhei;">Microsoft
									Himalaya</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft JhengHei" data-type="Microsoft JhengHei"
									title="Microsoft JhengHei"
									style="font-family: &amp; quot;Microsoft JhengHei&amp;quot;, sans-serif, simhei;">Microsoft
									JhengHei</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft JhengHei UI"
									data-type="Microsoft JhengHei UI" title="Microsoft JhengHei UI"
									style="font-family: &amp; quot;Microsoft JhengHei UI&amp;quot;, sans-serif, simhei;">Microsoft
									JhengHei UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft New Tai Lue"
									data-type="Microsoft New Tai Lue" title="Microsoft New Tai Lue"
									style="font-family: &amp; quot;Microsoft New Tai Lue&amp;quot;, sans-serif, simhei;">Microsoft
									New Tai Lue</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft PhagsPa" data-type="Microsoft PhagsPa"
									title="Microsoft PhagsPa"
									style="font-family: &amp; quot;Microsoft PhagsPa&amp;quot;, sans-serif, simhei;">Microsoft
									PhagsPa</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft Sans Serif"
									data-type="Microsoft Sans Serif" title="Microsoft Sans Serif"
									style="font-family: &amp; quot;Microsoft Sans Serif&amp;quot;, sans-serif, simhei;">Microsoft
									Sans Serif</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft Tai Le" data-type="Microsoft Tai Le"
									title="Microsoft Tai Le"
									style="font-family: &amp; quot;Microsoft Tai Le&amp;quot;, sans-serif, simhei;">Microsoft
									Tai Le</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft YaHei" data-type="Microsoft YaHei"
									title="Microsoft YaHei"
									style="font-family: &amp; quot;Microsoft YaHei&amp;quot;, sans-serif, simhei;">Microsoft
									YaHei</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft YaHei UI" data-type="Microsoft YaHei UI"
									title="Microsoft YaHei UI"
									style="font-family: &amp; quot;Microsoft YaHei UI&amp;quot;, sans-serif, simhei;">Microsoft
									YaHei UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft Yi Baiti" data-type="Microsoft Yi Baiti"
									title="Microsoft Yi Baiti"
									style="font-family: &amp; quot;Microsoft Yi Baiti&amp;quot;, sans-serif, simhei;">Microsoft
									Yi Baiti</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MingLiU-ExtB" data-type="MingLiU-ExtB"
									title="MingLiU-ExtB"
									style="font-family: MingLiU-ExtB, sans-serif, simhei;">MingLiU-ExtB</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="PMingLiU-ExtB" data-type="PMingLiU-ExtB"
									title="PMingLiU-ExtB"
									style="font-family: PMingLiU-ExtB, sans-serif, simhei;">PMingLiU-ExtB</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MingLiU_HKSCS-ExtB" data-type="MingLiU_HKSCS-ExtB"
									title="MingLiU_HKSCS-ExtB"
									style="font-family: MingLiU_HKSCS-ExtB, sans-serif, simhei;">MingLiU_HKSCS-ExtB</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Mongolian Baiti" data-type="Mongolian Baiti"
									title="Mongolian Baiti"
									style="font-family: &amp; quot;Mongolian Baiti&amp;quot;, sans-serif, simhei;">Mongolian
									Baiti</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MS Gothic" data-type="MS Gothic" title="MS Gothic"
									style="font-family: &amp; quot;MS Gothic&amp;quot;, sans-serif, simhei;">MS
									Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MS PGothic" data-type="MS PGothic"
									title="MS PGothic"
									style="font-family: &amp; quot;MS PGothic&amp;quot;, sans-serif, simhei;">MS
									PGothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MS UI Gothic" data-type="MS UI Gothic"
									title="MS UI Gothic"
									style="font-family: &amp; quot;MS UI Gothic&amp;quot;, sans-serif, simhei;">MS
									UI Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MV Boli" data-type="MV Boli" title="MV Boli"
									style="font-family: &amp; quot;MV Boli&amp;quot;, sans-serif, simhei;">MV
									Boli</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Myanmar Text" data-type="Myanmar Text"
									title="Myanmar Text"
									style="font-family: &amp; quot;Myanmar Text&amp;quot;, sans-serif, simhei;">Myanmar
									Text</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Nirmala UI" data-type="Nirmala UI"
									title="Nirmala UI"
									style="font-family: &amp; quot;Nirmala UI&amp;quot;, sans-serif, simhei;">Nirmala
									UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="NSimSun" data-type="NSimSun" title="NSimSun"
									style="font-family: NSimSun, sans-serif, simhei;">NSimSun</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Palatino Linotype" data-type="Palatino Linotype"
									title="Palatino Linotype"
									style="font-family: &amp; quot;Palatino Linotype&amp;quot;, sans-serif, simhei;">Palatino
									Linotype</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe MDL2 Assets" data-type="Segoe MDL2 Assets"
									title="Segoe MDL2 Assets"
									style="font-family: &amp; quot;Segoe MDL2 Assets&amp;quot;, sans-serif, simhei;">Segoe
									MDL2 Assets</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe Print" data-type="Segoe Print"
									title="Segoe Print"
									style="font-family: &amp; quot;Segoe Print&amp;quot;, sans-serif, simhei;">Segoe
									Print</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe Script" data-type="Segoe Script"
									title="Segoe Script"
									style="font-family: &amp; quot;Segoe Script&amp;quot;, sans-serif, simhei;">Segoe
									Script</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe UI" data-type="Segoe UI" title="Segoe UI"
									style="font-family: &amp; quot;Segoe UI&amp;quot;, sans-serif, simhei;">Segoe
									UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe UI Emoji" data-type="Segoe UI Emoji"
									title="Segoe UI Emoji"
									style="font-family: &amp; quot;Segoe UI Emoji&amp;quot;, sans-serif, simhei;">Segoe
									UI Emoji</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe UI Historic" data-type="Segoe UI Historic"
									title="Segoe UI Historic"
									style="font-family: &amp; quot;Segoe UI Historic&amp;quot;, sans-serif, simhei;">Segoe
									UI Historic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe UI Symbol" data-type="Segoe UI Symbol"
									title="Segoe UI Symbol"
									style="font-family: &amp; quot;Segoe UI Symbol&amp;quot;, sans-serif, simhei;">Segoe
									UI Symbol</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="SimSun" data-type="SimSun" title="SimSun"
									style="font-family: SimSun, sans-serif, simhei;">SimSun</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="SimSun-ExtB" data-type="SimSun-ExtB"
									title="SimSun-ExtB"
									style="font-family: SimSun-ExtB, sans-serif, simhei;">SimSun-ExtB</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Banner" data-type="Sitka Banner"
									title="Sitka Banner"
									style="font-family: &amp; quot;Sitka Banner&amp;quot;, sans-serif, simhei;">Sitka
									Banner</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Display" data-type="Sitka Display"
									title="Sitka Display"
									style="font-family: &amp; quot;Sitka Display&amp;quot;, sans-serif, simhei;">Sitka
									Display</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Heading" data-type="Sitka Heading"
									title="Sitka Heading"
									style="font-family: &amp; quot;Sitka Heading&amp;quot;, sans-serif, simhei;">Sitka
									Heading</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Small" data-type="Sitka Small"
									title="Sitka Small"
									style="font-family: &amp; quot;Sitka Small&amp;quot;, sans-serif, simhei;">Sitka
									Small</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Subheading" data-type="Sitka Subheading"
									title="Sitka Subheading"
									style="font-family: &amp; quot;Sitka Subheading&amp;quot;, sans-serif, simhei;">Sitka
									Subheading</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Text" data-type="Sitka Text"
									title="Sitka Text"
									style="font-family: &amp; quot;Sitka Text&amp;quot;, sans-serif, simhei;">Sitka
									Text</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sylfaen" data-type="Sylfaen" title="Sylfaen"
									style="font-family: Sylfaen, sans-serif, simhei;">Sylfaen</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Symbol" data-type="Symbol" title="Symbol"
									style="font-family: Symbol, sans-serif, simhei;">Symbol</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Tahoma" data-type="Tahoma" title="Tahoma"
									style="font-family: Tahoma, sans-serif, simhei;">Tahoma</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Times New Roman" data-type="Times New Roman"
									title="Times New Roman"
									style="font-family: &amp; quot;Times New Roman&amp;quot;, sans-serif, simhei;">Times
									New Roman</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Trebuchet MS" data-type="Trebuchet MS"
									title="Trebuchet MS"
									style="font-family: &amp; quot;Trebuchet MS&amp;quot;, sans-serif, simhei;">Trebuchet
									MS</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Verdana" data-type="Verdana" title="Verdana"
									style="font-family: Verdana, sans-serif, simhei;">Verdana</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Webdings" data-type="Webdings" title="Webdings"
									style="font-family: Webdings, sans-serif, simhei;">Webdings</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Wingdings" data-type="Wingdings" title="Wingdings"
									style="font-family: Wingdings, sans-serif, simhei;">Wingdings</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Yu Gothic" data-type="Yu Gothic" title="Yu Gothic"
									style="font-family: &amp; quot;Yu Gothic&amp;quot;, sans-serif, simhei;">Yu
									Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Yu Gothic UI" data-type="Yu Gothic UI"
									title="Yu Gothic UI"
									style="font-family: &amp; quot;Yu Gothic UI&amp;quot;, sans-serif, simhei;">Yu
									Gothic UI</li>
							</ul>
						</span> <span class="npe_text_tool npe_text_font_size"
							data-clickcode="PTE_G_FONTSIZE"> <span
							class="npe_tool_title" title="글자 크기">크기 5</span>
							<ul
								class="npe_tool_list npe_text_font_size_list _sizes _sizes-list"
								id="">
								<script type="text/tw-template"></script>
								<li class="npe_tool_item _item-attr _item _new" title="200px"
									data-type="200" data-title="200px"><span
									class="_item-text">200</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="160px"
									data-type="160" data-title="160px"><span
									class="_item-text">160</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="120px"
									data-type="120" data-title="120px"><span
									class="_item-text">120</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="80px"
									data-type="80" data-title="80px"><span class="_item-text">80</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="40px"
									data-type="40" data-title="40px"><span class="_item-text">40</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="34px"
									data-type="34" data-title="34px"><span class="_item-text">34</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="28px"
									data-type="28" data-title="28px"><span class="_item-text">28</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="19px"
									data-type="19" data-title="19px"><span class="_item-text">19</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="16px"
									data-type="16" data-title="16px"><span class="_item-text">16</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="14px"
									data-type="14" data-title="14px"><span class="_item-text">14</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="11px"
									data-type="11" data-title="11px"><span class="_item-text">11</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="10px"
									data-type="10" data-title="10px"><span class="_item-text">10</span>px</li>
							</ul>
						</span>
						<button type="button" class="npe_text_tool npe_text_font_bold"
							title="굵게" data-clickcode="PTE_G_BOLD">
							<span class="npe_tool_title"></span>
						</button>
						<button type="button" class="npe_text_tool npe_text_font_italic"
							title="기울임꼴" data-clickcode="PTE_G_ITALIC">
							<span class="npe_tool_title"></span>
						</button>
						<span class="npe_text_tool npe_text_font_color" title="글자색"
							data-clickcode="PTE_G_COLOR"> <span class="npe_tool_title"></span>
							<span class="npe_text_color_preview"
							style="background-color: rgb(255, 255, 255);"></span>
						</span> <span class="npe_text_tool npe_text_back_color" title="배경색"
							data-clickcode="PTE_G_BGCOLOR"> <span
							class="npe_tool_title"></span> <span
							class="npe_text_color_preview" style="background-color: #000;"></span>
						</span>
						<div class="npe_color_select_area">
							<div class="npe_color_select_recent">
								<div
									class="npe_color_select_list _recentColors _recentColors-list"
									id="">
									<script type="text/tw-template"></script>
								</div>
							</div>
							<div class="npe_color_select_table">
								<div class="npe_color_select_list _colors _colors-list" id="">
									<script type="text/tw-template"></script>
									<button type="button" title="#ffffff"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#ffffff"
										style="background-color: rgb(255, 255, 255);"></button>
									<button type="button" title="#f7f7f7"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f7f7f7"
										style="background-color: rgb(247, 247, 247);"></button>
									<button type="button" title="#e2e2e2"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#e2e2e2"
										style="background-color: rgb(226, 226, 226);"></button>
									<button type="button" title="#c2c2c2"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#c2c2c2"
										style="background-color: rgb(194, 194, 194);"></button>
									<button type="button" title="#9c9c9c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#9c9c9c"
										style="background-color: rgb(156, 156, 156);"></button>
									<button type="button" title="#858585"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#858585"
										style="background-color: rgb(133, 133, 133);"></button>
									<button type="button" title="#636363"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#636363" style="background-color: rgb(99, 99, 99);"></button>
									<button type="button" title="#404040"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#404040" style="background-color: rgb(64, 64, 64);"></button>
									<button type="button" title="#272727"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#272727" style="background-color: rgb(39, 39, 39);"></button>
									<button type="button" title="#000000"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#000000" style="background-color: rgb(0, 0, 0);"></button>
									<button type="button" title="#ffb39b"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#ffb39b"
										style="background-color: rgb(255, 179, 155);"></button>
									<button type="button" title="#ffd4a7"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#ffd4a7"
										style="background-color: rgb(255, 212, 167);"></button>
									<button type="button" title="#fff599"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#fff599"
										style="background-color: rgb(255, 245, 153);"></button>
									<button type="button" title="#c5dd9c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#c5dd9c"
										style="background-color: rgb(197, 221, 156);"></button>
									<button type="button" title="#7ec89d"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#7ec89d"
										style="background-color: rgb(126, 200, 157);"></button>
									<button type="button" title="#78ccc9"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#78ccc9"
										style="background-color: rgb(120, 204, 201);"></button>
									<button type="button" title="#85ddff"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#85ddff"
										style="background-color: rgb(133, 221, 255);"></button>
									<button type="button" title="#87c5ff"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#87c5ff"
										style="background-color: rgb(135, 197, 255);"></button>
									<button type="button" title="#bd8fbf"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#bd8fbf"
										style="background-color: rgb(189, 143, 191);"></button>
									<button type="button" title="#f69fc1"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f69fc1"
										style="background-color: rgb(246, 159, 193);"></button>
									<button type="button" title="#f3704c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f3704c"
										style="background-color: rgb(243, 112, 76);"></button>
									<button type="button" title="#fcaf59"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#fcaf59"
										style="background-color: rgb(252, 175, 89);"></button>
									<button type="button" title="#ffef4c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#ffef4c"
										style="background-color: rgb(255, 239, 76);"></button>
									<button type="button" title="#abd072"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#abd072"
										style="background-color: rgb(171, 208, 114);"></button>
									<button type="button" title="#30b478"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#30b478"
										style="background-color: rgb(48, 180, 120);"></button>
									<button type="button" title="#00bab4"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00bab4"
										style="background-color: rgb(0, 186, 180);"></button>
									<button type="button" title="#00c8ff"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00c8ff"
										style="background-color: rgb(0, 200, 255);"></button>
									<button type="button" title="#0092e6"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#0092e6"
										style="background-color: rgb(0, 146, 230);"></button>
									<button type="button" title="#a868a9"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#a868a9"
										style="background-color: rgb(168, 104, 169);"></button>
									<button type="button" title="#f175a8"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f175a8"
										style="background-color: rgb(241, 117, 168);"></button>
									<button type="button" title="#f12f22"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f12f22"
										style="background-color: rgb(241, 47, 34);"></button>
									<button type="button" title="#ff9c23"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#ff9c23"
										style="background-color: rgb(255, 156, 35);"></button>
									<button type="button" title="#f4d400"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f4d400"
										style="background-color: rgb(244, 212, 0);"></button>
									<button type="button" title="#7bb423"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#7bb423"
										style="background-color: rgb(123, 180, 35);"></button>
									<button type="button" title="#00a350"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00a350" style="background-color: rgb(0, 163, 80);"></button>
									<button type="button" title="#009991"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#009991"
										style="background-color: rgb(0, 153, 145);"></button>
									<button type="button" title="#00afef"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00afef"
										style="background-color: rgb(0, 175, 239);"></button>
									<button type="button" title="#0076c8"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#0076c8"
										style="background-color: rgb(0, 118, 200);"></button>
									<button type="button" title="#93338f"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#93338f"
										style="background-color: rgb(147, 51, 143);"></button>
									<button type="button" title="#f02c8c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f02c8c"
										style="background-color: rgb(240, 44, 140);"></button>
									<button type="button" title="#9f190d"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#9f190d"
										style="background-color: rgb(159, 25, 13);"></button>
									<button type="button" title="#a46206"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#a46206" style="background-color: rgb(164, 98, 6);"></button>
									<button type="button" title="#a79a00"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#a79a00"
										style="background-color: rgb(167, 154, 0);"></button>
									<button type="button" title="#568228"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#568228"
										style="background-color: rgb(86, 130, 40);"></button>
									<button type="button" title="#007036"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#007036" style="background-color: rgb(0, 112, 54);"></button>
									<button type="button" title="#00726a"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00726a"
										style="background-color: rgb(0, 114, 106);"></button>
									<button type="button" title="#0077a4"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#0077a4"
										style="background-color: rgb(0, 119, 164);"></button>
									<button type="button" title="#004c80"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#004c80" style="background-color: rgb(0, 76, 128);"></button>
									<button type="button" title="#63155f"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#63155f" style="background-color: rgb(99, 21, 95);"></button>
									<button type="button" title="#a01a5c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#a01a5c"
										style="background-color: rgb(160, 26, 92);"></button>
									<button type="button" title="#5f0e06"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#5f0e06" style="background-color: rgb(95, 14, 6);"></button>
									<button type="button" title="#734300"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#734300" style="background-color: rgb(115, 67, 0);"></button>
									<button type="button" title="#675f00"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#675f00" style="background-color: rgb(103, 95, 0);"></button>
									<button type="button" title="#3a5919"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#3a5919" style="background-color: rgb(58, 89, 25);"></button>
									<button type="button" title="#004b24"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#004b24" style="background-color: rgb(0, 75, 36);"></button>
									<button type="button" title="#00524c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00524c" style="background-color: rgb(0, 82, 76);"></button>
									<button type="button" title="#004c69"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#004c69" style="background-color: rgb(0, 76, 105);"></button>
									<button type="button" title="#00385f"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00385f" style="background-color: rgb(0, 56, 95);"></button>
									<button type="button" title="#430d40"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#430d40" style="background-color: rgb(67, 13, 64);"></button>
									<button type="button" title="#701441"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#701441"
										style="background-color: rgb(112, 20, 65);"></button>
								</div>
							</div>
							<div class="npe_color_select_input">
								<span class="npe_color_select_preview"
									style="background-color: #f7f7f7"></span> <span
									class="npe_color_select_code"> <span
									class="npe_color_select_code_prefix">#</span> <input
									type="text" class="npe_color_select_code_input" maxlength="6"
									style="text-transform: uppercase; ime-mode: disabled;">
								</span>
								<div class="npe_color_select_opacity_area">
									<span
										class="npe_color_select_opacity_title _txt_signature_opacity-text">투명도</span>
									<div class="npe_color_select_opacity_slide npe_slide_area">
										<input type="range" step="1" class="npe_slide on">
										<div class="npe_slide_appear">
											<div class="npe_slide_background_track_back"></div>
											<div class="npe_slide_background_track"></div>
											<div class="npe_slide_background_thumb"></div>
										</div>
									</div>
									<input type="text" class="npe_color_select_opacity_num"
										maxlength="3" size="3"> <span
										class="npe_color_select_opacity_num_control">
										<button type="button" class="npe_num_up"></button>
										<button type="button" class="npe_num_down"></button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="npe_control_detail npe_control_mosaic"
				data-control="mosaic">
				<strong class="npe_blind">모자이크</strong>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mosaic rect1 on"
					data-mosaic="square1">
					<span class="npe_btn_title"><span class="_txt_square-text">사각</span>1</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mosaic rect2"
					data-mosaic="square2">
					<span class="npe_btn_title"><span class="_txt_square-text">사각</span>2</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mosaic rect3"
					data-mosaic="square3">
					<span class="npe_btn_title"><span class="_txt_square-text">사각</span>3</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mosaic rect4"
					data-mosaic="square4">
					<span class="npe_btn_title"><span class="_txt_square-text">사각</span>4</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mosaic rect5"
					data-mosaic="square5">
					<span class="npe_btn_title"><span class="_txt_square-text">사각</span>5</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mosaic circle1"
					data-mosaic="circle1">
					<span class="npe_btn_title"><span class="_txt_circle-text">원</span>1</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mosaic circle2"
					data-mosaic="circle2">
					<span class="npe_btn_title"><span class="_txt_circle-text">원</span>2</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mosaic circle3"
					data-mosaic="circle3">
					<span class="npe_btn_title"><span class="_txt_circle-text">원</span>3</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mosaic circle4"
					data-mosaic="circle4">
					<span class="npe_btn_title"><span class="_txt_circle-text">원</span>4</span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mosaic circle5"
					data-mosaic="circle5">
					<span class="npe_btn_title"><span class="_txt_circle-text">원</span>5</span>
				</button>
			</div>
			<div class="npe_control_detail npe_control_text" data-control="text">
				<strong class="npe_blind">텍스트</strong>
				<button type="button" class="npe_btn_icon npe_btn_text_add">
					<span class="npe_btn_title _txt_add_text-text">텍스트 추가</span>
				</button>
				<div class="npe_control_text_option_area">
					<div class="npe_text_tool_area">
						<span class="npe_text_tool npe_text_font_family"
							data-clickcode="PTE_T_FONT"> <span class="npe_tool_title"
							title="글꼴">나눔고딕</span>
							<ul
								class="npe_tool_list npe_text_font_family_list _fonts _fonts-list"
								id="">
								<script type="text/tw-template"></script>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="" data-type="default" data-default="true"
									style="font-family: &amp; quot;malgun gothic&amp;quot;, &amp;quot;맑은 고딕&amp;quot;, &amp;quot;Helvetica Neue&amp;quot;, helvetica, AppleSDGothicNeo-Regular, sans-serif, simhei;">폰트명</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="" data-type="nanumgothic"
									style="font-family: 나눔고딕, nanumgothic, se_NanumGothic, AppleSDGothicNeo-Regular, sans-serif, simhei;">폰트명</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="" data-type="nanummyeongjo"
									style="font-family: 나눔명조, nanummyeongjo, se_NanumMyeongjo, serif, simsun;">폰트명</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="" data-type="nanumbarungothic"
									style="font-family: 나눔바른고딕, nanumbarungothic, se_NanumBarunGothic, AppleSDGothicNeo-Regular, sans-serif, simhei;">폰트명</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Abel" data-type="Abel" title="Abel"
									style="font-family: Abel, sans-serif;">Abel</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Arvo" data-type="Arvo" title="Arvo"
									style="font-family: Arvo, serif;">Arvo</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Bungee Shade" data-type="Bungee Shade"
									title="Bungee Shade"
									style="font-family: &amp; quot;Bungee Shade&amp;quot;, cursive;">Bungee
									Shade</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Cookie" data-type="Cookie" title="Cookie"
									style="font-family: Cookie, cursive;">Cookie</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Crimson Text" data-type="Crimson Text"
									title="Crimson Text"
									style="font-family: &amp; quot;Crimson Text&amp;quot;, serif;">Crimson
									Text</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Dancing Script" data-type="Dancing Script"
									title="Dancing Script"
									style="font-family: &amp; quot;Dancing Script&amp;quot;, cursive;">Dancing
									Script</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Dosis" data-type="Dosis" title="Dosis"
									style="font-family: Dosis, sans-serif;">Dosis</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Duru Sans" data-type="Duru Sans" title="Duru Sans"
									style="font-family: &amp; quot;Duru Sans&amp;quot;, sans-serif;">Duru
									Sans</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Inconsolata" data-type="Inconsolata"
									title="Inconsolata"
									style="font-family: Inconsolata, monospace;">Inconsolata</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Kreon" data-type="Kreon" title="Kreon"
									style="font-family: Kreon, serif;">Kreon</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Lancelot" data-type="Lancelot" title="Lancelot"
									style="font-family: Lancelot, cursive;">Lancelot</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Lobster" data-type="Lobster" title="Lobster"
									style="font-family: Lobster, cursive;">Lobster</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Mandali" data-type="Mandali" title="Mandali"
									style="font-family: Mandali, sans-serif;">Mandali</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Noto Sans" data-type="Noto Sans" title="Noto Sans"
									style="font-family: &amp; quot;Noto Sans&amp;quot;, sans-serif;">Noto
									Sans</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Noto Serif" data-type="Noto Serif"
									title="Noto Serif"
									style="font-family: &amp; quot;Noto Serif&amp;quot;, serif;">Noto
									Serif</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Podkova" data-type="Podkova" title="Podkova"
									style="font-family: Podkova, serif;">Podkova</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Quicksand" data-type="Quicksand" title="Quicksand"
									style="font-family: Quicksand, sans-serif;">Quicksand</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Rasa" data-type="Rasa" title="Rasa"
									style="font-family: Rasa, serif;">Rasa</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sanchez" data-type="Sanchez" title="Sanchez"
									style="font-family: Sanchez,&amp; quot;serif &amp;quot;;">Sanchez</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Arial" data-type="Arial" title="Arial"
									style="font-family: Arial, sans-serif, simhei;">Arial</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Arial Black" data-type="Arial Black"
									title="Arial Black"
									style="font-family: &amp; quot;Arial Black&amp;quot;, sans-serif, simhei;">Arial
									Black</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Batang" data-type="Batang" title="Batang"
									style="font-family: Batang, sans-serif, simhei;">Batang</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="BatangChe" data-type="BatangChe" title="BatangChe"
									style="font-family: BatangChe, sans-serif, simhei;">BatangChe</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Book Antiqua" data-type="Book Antiqua"
									title="Book Antiqua"
									style="font-family: &amp; quot;Book Antiqua&amp;quot;, sans-serif, simhei;">Book
									Antiqua</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Calibri" data-type="Calibri" title="Calibri"
									style="font-family: Calibri, sans-serif, simhei;">Calibri</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Calibri Light" data-type="Calibri Light"
									title="Calibri Light"
									style="font-family: &amp; quot;Calibri Light&amp;quot;, sans-serif, simhei;">Calibri
									Light</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Calisto MT" data-type="Calisto MT"
									title="Calisto MT"
									style="font-family: &amp; quot;Calisto MT&amp;quot;, sans-serif, simhei;">Calisto
									MT</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Cambria" data-type="Cambria" title="Cambria"
									style="font-family: Cambria, sans-serif, simhei;">Cambria</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Cambria Math" data-type="Cambria Math"
									title="Cambria Math"
									style="font-family: &amp; quot;Cambria Math&amp;quot;, sans-serif, simhei;">Cambria
									Math</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Candara" data-type="Candara" title="Candara"
									style="font-family: Candara, sans-serif, simhei;">Candara</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Century Gothic" data-type="Century Gothic"
									title="Century Gothic"
									style="font-family: &amp; quot;Century Gothic&amp;quot;, sans-serif, simhei;">Century
									Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Comic Sans MS" data-type="Comic Sans MS"
									title="Comic Sans MS"
									style="font-family: &amp; quot;Comic Sans MS&amp;quot;, sans-serif, simhei;">Comic
									Sans MS</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Consolas" data-type="Consolas" title="Consolas"
									style="font-family: Consolas, sans-serif, simhei;">Consolas</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Constantia" data-type="Constantia"
									title="Constantia"
									style="font-family: Constantia, sans-serif, simhei;">Constantia</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Copperplate Gothic" data-type="Copperplate Gothic"
									title="Copperplate Gothic"
									style="font-family: &amp; quot;Copperplate Gothic&amp;quot;, sans-serif, simhei;">Copperplate
									Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Copperplate Gothic Light"
									data-type="Copperplate Gothic Light"
									title="Copperplate Gothic Light"
									style="font-family: &amp; quot;Copperplate Gothic Light&amp;quot;, sans-serif, simhei;">Copperplate
									Gothic Light</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Corbel" data-type="Corbel" title="Corbel"
									style="font-family: Corbel, sans-serif, simhei;">Corbel</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Courier New" data-type="Courier New"
									title="Courier New"
									style="font-family: &amp; quot;Courier New&amp;quot;, sans-serif, simhei;">Courier
									New</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Dotum" data-type="Dotum" title="Dotum"
									style="font-family: Dotum, sans-serif, simhei;">Dotum</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="DotumChe" data-type="DotumChe" title="DotumChe"
									style="font-family: DotumChe, sans-serif, simhei;">DotumChe</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Ebrima" data-type="Ebrima" title="Ebrima"
									style="font-family: Ebrima, sans-serif, simhei;">Ebrima</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Franklin Gothic Medium"
									data-type="Franklin Gothic Medium"
									title="Franklin Gothic Medium"
									style="font-family: &amp; quot;Franklin Gothic Medium&amp;quot;, sans-serif, simhei;">Franklin
									Gothic Medium</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Gabriola" data-type="Gabriola" title="Gabriola"
									style="font-family: Gabriola, sans-serif, simhei;">Gabriola</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Gadugi" data-type="Gadugi" title="Gadugi"
									style="font-family: Gadugi, sans-serif, simhei;">Gadugi</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Georgia" data-type="Georgia" title="Georgia"
									style="font-family: Georgia, sans-serif, simhei;">Georgia</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Gulim" data-type="Gulim" title="Gulim"
									style="font-family: Gulim, sans-serif, simhei;">Gulim</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="GulimChe" data-type="GulimChe" title="GulimChe"
									style="font-family: GulimChe, sans-serif, simhei;">GulimChe</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Gungsuh" data-type="Gungsuh" title="Gungsuh"
									style="font-family: Gungsuh, sans-serif, simhei;">Gungsuh</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="GungsuhChe" data-type="GungsuhChe"
									title="GungsuhChe"
									style="font-family: GungsuhChe, sans-serif, simhei;">GungsuhChe</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Impact" data-type="Impact" title="Impact"
									style="font-family: Impact, sans-serif, simhei;">Impact</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Javanese Text" data-type="Javanese Text"
									title="Javanese Text"
									style="font-family: &amp; quot;Javanese Text&amp;quot;, sans-serif, simhei;">Javanese
									Text</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Leelawadee UI" data-type="Leelawadee UI"
									title="Leelawadee UI"
									style="font-family: &amp; quot;Leelawadee UI&amp;quot;, sans-serif, simhei;">Leelawadee
									UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Lucida Console" data-type="Lucida Console"
									title="Lucida Console"
									style="font-family: &amp; quot;Lucida Console&amp;quot;, sans-serif, simhei;">Lucida
									Console</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Lucida Sans Unicode"
									data-type="Lucida Sans Unicode" title="Lucida Sans Unicode"
									style="font-family: &amp; quot;Lucida Sans Unicode&amp;quot;, sans-serif, simhei;">Lucida
									Sans Unicode</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Malgun Gothic" data-type="Malgun Gothic"
									title="Malgun Gothic"
									style="font-family: &amp; quot;Malgun Gothic&amp;quot;, sans-serif, simhei;">Malgun
									Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Marlett" data-type="Marlett" title="Marlett"
									style="font-family: Marlett, sans-serif, simhei;">Marlett</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Meiryo" data-type="Meiryo" title="Meiryo"
									style="font-family: Meiryo, sans-serif, simhei;">Meiryo</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Meiryo UI" data-type="Meiryo UI" title="Meiryo UI"
									style="font-family: &amp; quot;Meiryo UI&amp;quot;, sans-serif, simhei;">Meiryo
									UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft Himalaya" data-type="Microsoft Himalaya"
									title="Microsoft Himalaya"
									style="font-family: &amp; quot;Microsoft Himalaya&amp;quot;, sans-serif, simhei;">Microsoft
									Himalaya</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft JhengHei" data-type="Microsoft JhengHei"
									title="Microsoft JhengHei"
									style="font-family: &amp; quot;Microsoft JhengHei&amp;quot;, sans-serif, simhei;">Microsoft
									JhengHei</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft JhengHei UI"
									data-type="Microsoft JhengHei UI" title="Microsoft JhengHei UI"
									style="font-family: &amp; quot;Microsoft JhengHei UI&amp;quot;, sans-serif, simhei;">Microsoft
									JhengHei UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft New Tai Lue"
									data-type="Microsoft New Tai Lue" title="Microsoft New Tai Lue"
									style="font-family: &amp; quot;Microsoft New Tai Lue&amp;quot;, sans-serif, simhei;">Microsoft
									New Tai Lue</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft PhagsPa" data-type="Microsoft PhagsPa"
									title="Microsoft PhagsPa"
									style="font-family: &amp; quot;Microsoft PhagsPa&amp;quot;, sans-serif, simhei;">Microsoft
									PhagsPa</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft Sans Serif"
									data-type="Microsoft Sans Serif" title="Microsoft Sans Serif"
									style="font-family: &amp; quot;Microsoft Sans Serif&amp;quot;, sans-serif, simhei;">Microsoft
									Sans Serif</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft Tai Le" data-type="Microsoft Tai Le"
									title="Microsoft Tai Le"
									style="font-family: &amp; quot;Microsoft Tai Le&amp;quot;, sans-serif, simhei;">Microsoft
									Tai Le</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft YaHei" data-type="Microsoft YaHei"
									title="Microsoft YaHei"
									style="font-family: &amp; quot;Microsoft YaHei&amp;quot;, sans-serif, simhei;">Microsoft
									YaHei</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft YaHei UI" data-type="Microsoft YaHei UI"
									title="Microsoft YaHei UI"
									style="font-family: &amp; quot;Microsoft YaHei UI&amp;quot;, sans-serif, simhei;">Microsoft
									YaHei UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Microsoft Yi Baiti" data-type="Microsoft Yi Baiti"
									title="Microsoft Yi Baiti"
									style="font-family: &amp; quot;Microsoft Yi Baiti&amp;quot;, sans-serif, simhei;">Microsoft
									Yi Baiti</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MingLiU-ExtB" data-type="MingLiU-ExtB"
									title="MingLiU-ExtB"
									style="font-family: MingLiU-ExtB, sans-serif, simhei;">MingLiU-ExtB</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="PMingLiU-ExtB" data-type="PMingLiU-ExtB"
									title="PMingLiU-ExtB"
									style="font-family: PMingLiU-ExtB, sans-serif, simhei;">PMingLiU-ExtB</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MingLiU_HKSCS-ExtB" data-type="MingLiU_HKSCS-ExtB"
									title="MingLiU_HKSCS-ExtB"
									style="font-family: MingLiU_HKSCS-ExtB, sans-serif, simhei;">MingLiU_HKSCS-ExtB</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Mongolian Baiti" data-type="Mongolian Baiti"
									title="Mongolian Baiti"
									style="font-family: &amp; quot;Mongolian Baiti&amp;quot;, sans-serif, simhei;">Mongolian
									Baiti</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MS Gothic" data-type="MS Gothic" title="MS Gothic"
									style="font-family: &amp; quot;MS Gothic&amp;quot;, sans-serif, simhei;">MS
									Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MS PGothic" data-type="MS PGothic"
									title="MS PGothic"
									style="font-family: &amp; quot;MS PGothic&amp;quot;, sans-serif, simhei;">MS
									PGothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MS UI Gothic" data-type="MS UI Gothic"
									title="MS UI Gothic"
									style="font-family: &amp; quot;MS UI Gothic&amp;quot;, sans-serif, simhei;">MS
									UI Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="MV Boli" data-type="MV Boli" title="MV Boli"
									style="font-family: &amp; quot;MV Boli&amp;quot;, sans-serif, simhei;">MV
									Boli</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Myanmar Text" data-type="Myanmar Text"
									title="Myanmar Text"
									style="font-family: &amp; quot;Myanmar Text&amp;quot;, sans-serif, simhei;">Myanmar
									Text</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Nirmala UI" data-type="Nirmala UI"
									title="Nirmala UI"
									style="font-family: &amp; quot;Nirmala UI&amp;quot;, sans-serif, simhei;">Nirmala
									UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="NSimSun" data-type="NSimSun" title="NSimSun"
									style="font-family: NSimSun, sans-serif, simhei;">NSimSun</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Palatino Linotype" data-type="Palatino Linotype"
									title="Palatino Linotype"
									style="font-family: &amp; quot;Palatino Linotype&amp;quot;, sans-serif, simhei;">Palatino
									Linotype</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe MDL2 Assets" data-type="Segoe MDL2 Assets"
									title="Segoe MDL2 Assets"
									style="font-family: &amp; quot;Segoe MDL2 Assets&amp;quot;, sans-serif, simhei;">Segoe
									MDL2 Assets</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe Print" data-type="Segoe Print"
									title="Segoe Print"
									style="font-family: &amp; quot;Segoe Print&amp;quot;, sans-serif, simhei;">Segoe
									Print</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe Script" data-type="Segoe Script"
									title="Segoe Script"
									style="font-family: &amp; quot;Segoe Script&amp;quot;, sans-serif, simhei;">Segoe
									Script</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe UI" data-type="Segoe UI" title="Segoe UI"
									style="font-family: &amp; quot;Segoe UI&amp;quot;, sans-serif, simhei;">Segoe
									UI</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe UI Emoji" data-type="Segoe UI Emoji"
									title="Segoe UI Emoji"
									style="font-family: &amp; quot;Segoe UI Emoji&amp;quot;, sans-serif, simhei;">Segoe
									UI Emoji</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe UI Historic" data-type="Segoe UI Historic"
									title="Segoe UI Historic"
									style="font-family: &amp; quot;Segoe UI Historic&amp;quot;, sans-serif, simhei;">Segoe
									UI Historic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Segoe UI Symbol" data-type="Segoe UI Symbol"
									title="Segoe UI Symbol"
									style="font-family: &amp; quot;Segoe UI Symbol&amp;quot;, sans-serif, simhei;">Segoe
									UI Symbol</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="SimSun" data-type="SimSun" title="SimSun"
									style="font-family: SimSun, sans-serif, simhei;">SimSun</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="SimSun-ExtB" data-type="SimSun-ExtB"
									title="SimSun-ExtB"
									style="font-family: SimSun-ExtB, sans-serif, simhei;">SimSun-ExtB</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Banner" data-type="Sitka Banner"
									title="Sitka Banner"
									style="font-family: &amp; quot;Sitka Banner&amp;quot;, sans-serif, simhei;">Sitka
									Banner</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Display" data-type="Sitka Display"
									title="Sitka Display"
									style="font-family: &amp; quot;Sitka Display&amp;quot;, sans-serif, simhei;">Sitka
									Display</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Heading" data-type="Sitka Heading"
									title="Sitka Heading"
									style="font-family: &amp; quot;Sitka Heading&amp;quot;, sans-serif, simhei;">Sitka
									Heading</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Small" data-type="Sitka Small"
									title="Sitka Small"
									style="font-family: &amp; quot;Sitka Small&amp;quot;, sans-serif, simhei;">Sitka
									Small</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Subheading" data-type="Sitka Subheading"
									title="Sitka Subheading"
									style="font-family: &amp; quot;Sitka Subheading&amp;quot;, sans-serif, simhei;">Sitka
									Subheading</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sitka Text" data-type="Sitka Text"
									title="Sitka Text"
									style="font-family: &amp; quot;Sitka Text&amp;quot;, sans-serif, simhei;">Sitka
									Text</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Sylfaen" data-type="Sylfaen" title="Sylfaen"
									style="font-family: Sylfaen, sans-serif, simhei;">Sylfaen</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Symbol" data-type="Symbol" title="Symbol"
									style="font-family: Symbol, sans-serif, simhei;">Symbol</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Tahoma" data-type="Tahoma" title="Tahoma"
									style="font-family: Tahoma, sans-serif, simhei;">Tahoma</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Times New Roman" data-type="Times New Roman"
									title="Times New Roman"
									style="font-family: &amp; quot;Times New Roman&amp;quot;, sans-serif, simhei;">Times
									New Roman</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Trebuchet MS" data-type="Trebuchet MS"
									title="Trebuchet MS"
									style="font-family: &amp; quot;Trebuchet MS&amp;quot;, sans-serif, simhei;">Trebuchet
									MS</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Verdana" data-type="Verdana" title="Verdana"
									style="font-family: Verdana, sans-serif, simhei;">Verdana</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Webdings" data-type="Webdings" title="Webdings"
									style="font-family: Webdings, sans-serif, simhei;">Webdings</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Wingdings" data-type="Wingdings" title="Wingdings"
									style="font-family: Wingdings, sans-serif, simhei;">Wingdings</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Yu Gothic" data-type="Yu Gothic" title="Yu Gothic"
									style="font-family: &amp; quot;Yu Gothic&amp;quot;, sans-serif, simhei;">Yu
									Gothic</li>
								<li
									class="npe_tool_item _type-data _fontFamily-fontFamily _title-text _title-title _title-data _default-data _item _new"
									data-title="Yu Gothic UI" data-type="Yu Gothic UI"
									title="Yu Gothic UI"
									style="font-family: &amp; quot;Yu Gothic UI&amp;quot;, sans-serif, simhei;">Yu
									Gothic UI</li>
							</ul>
						</span> <span class="npe_text_tool npe_text_font_size"
							data-clickcode="PTE_T_FONTSIZE"> <span
							class="npe_tool_title" title="글자 크기">크기 5</span>
							<ul
								class="npe_tool_list npe_text_font_size_list _sizes _sizes-list"
								id="">
								<script type="text/tw-template"></script>
								<li class="npe_tool_item _item-attr _item _new" title="200px"
									data-type="200" data-title="200px"><span
									class="_item-text">200</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="160px"
									data-type="160" data-title="160px"><span
									class="_item-text">160</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="120px"
									data-type="120" data-title="120px"><span
									class="_item-text">120</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="80px"
									data-type="80" data-title="80px"><span class="_item-text">80</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="40px"
									data-type="40" data-title="40px"><span class="_item-text">40</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="34px"
									data-type="34" data-title="34px"><span class="_item-text">34</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="28px"
									data-type="28" data-title="28px"><span class="_item-text">28</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="19px"
									data-type="19" data-title="19px"><span class="_item-text">19</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="16px"
									data-type="16" data-title="16px"><span class="_item-text">16</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="14px"
									data-type="14" data-title="14px"><span class="_item-text">14</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="11px"
									data-type="11" data-title="11px"><span class="_item-text">11</span>px</li>
								<li class="npe_tool_item _item-attr _item _new" title="10px"
									data-type="10" data-title="10px"><span class="_item-text">10</span>px</li>
							</ul>
						</span>
						<button type="button" class="npe_text_tool npe_text_font_bold"
							title="굵게" data-clickcode="PTE_T_BOLD">
							<span class="npe_tool_title"></span>
						</button>
						<button type="button" class="npe_text_tool npe_text_font_italic"
							title="기울임꼴" data-clickcode="PTE_T_ITALIC">
							<span class="npe_tool_title"></span>
						</button>
						<span class="npe_text_tool npe_text_font_color" title="글자색"
							data-clickcode="PTE_T_COLOR"> <span class="npe_tool_title"></span>
							<span class="npe_text_color_preview"
							style="background-color: rgb(255, 255, 255);"></span>
						</span> <span class="npe_text_tool npe_text_back_color" title="배경색"
							data-clickcode="PTE_T_BGCOLOR"> <span
							class="npe_tool_title"></span> <span
							class="npe_text_color_preview" style="background-color: #000;"></span>
						</span>
						<div class="npe_color_select_area">
							<div class="npe_color_select_recent">
								<div
									class="npe_color_select_list _recentColors _recentColors-list"
									id="">
									<script type="text/tw-template"></script>
								</div>
							</div>
							<div class="npe_color_select_table">
								<div class="npe_color_select_list _colors _colors-list" id="">
									<script type="text/tw-template"></script>
									<button type="button" title="#ffffff"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#ffffff"
										style="background-color: rgb(255, 255, 255);"></button>
									<button type="button" title="#f7f7f7"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f7f7f7"
										style="background-color: rgb(247, 247, 247);"></button>
									<button type="button" title="#e2e2e2"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#e2e2e2"
										style="background-color: rgb(226, 226, 226);"></button>
									<button type="button" title="#c2c2c2"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#c2c2c2"
										style="background-color: rgb(194, 194, 194);"></button>
									<button type="button" title="#9c9c9c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#9c9c9c"
										style="background-color: rgb(156, 156, 156);"></button>
									<button type="button" title="#858585"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#858585"
										style="background-color: rgb(133, 133, 133);"></button>
									<button type="button" title="#636363"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#636363" style="background-color: rgb(99, 99, 99);"></button>
									<button type="button" title="#404040"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#404040" style="background-color: rgb(64, 64, 64);"></button>
									<button type="button" title="#272727"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#272727" style="background-color: rgb(39, 39, 39);"></button>
									<button type="button" title="#000000"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#000000" style="background-color: rgb(0, 0, 0);"></button>
									<button type="button" title="#ffb39b"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#ffb39b"
										style="background-color: rgb(255, 179, 155);"></button>
									<button type="button" title="#ffd4a7"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#ffd4a7"
										style="background-color: rgb(255, 212, 167);"></button>
									<button type="button" title="#fff599"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#fff599"
										style="background-color: rgb(255, 245, 153);"></button>
									<button type="button" title="#c5dd9c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#c5dd9c"
										style="background-color: rgb(197, 221, 156);"></button>
									<button type="button" title="#7ec89d"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#7ec89d"
										style="background-color: rgb(126, 200, 157);"></button>
									<button type="button" title="#78ccc9"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#78ccc9"
										style="background-color: rgb(120, 204, 201);"></button>
									<button type="button" title="#85ddff"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#85ddff"
										style="background-color: rgb(133, 221, 255);"></button>
									<button type="button" title="#87c5ff"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#87c5ff"
										style="background-color: rgb(135, 197, 255);"></button>
									<button type="button" title="#bd8fbf"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#bd8fbf"
										style="background-color: rgb(189, 143, 191);"></button>
									<button type="button" title="#f69fc1"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f69fc1"
										style="background-color: rgb(246, 159, 193);"></button>
									<button type="button" title="#f3704c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f3704c"
										style="background-color: rgb(243, 112, 76);"></button>
									<button type="button" title="#fcaf59"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#fcaf59"
										style="background-color: rgb(252, 175, 89);"></button>
									<button type="button" title="#ffef4c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#ffef4c"
										style="background-color: rgb(255, 239, 76);"></button>
									<button type="button" title="#abd072"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#abd072"
										style="background-color: rgb(171, 208, 114);"></button>
									<button type="button" title="#30b478"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#30b478"
										style="background-color: rgb(48, 180, 120);"></button>
									<button type="button" title="#00bab4"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00bab4"
										style="background-color: rgb(0, 186, 180);"></button>
									<button type="button" title="#00c8ff"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00c8ff"
										style="background-color: rgb(0, 200, 255);"></button>
									<button type="button" title="#0092e6"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#0092e6"
										style="background-color: rgb(0, 146, 230);"></button>
									<button type="button" title="#a868a9"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#a868a9"
										style="background-color: rgb(168, 104, 169);"></button>
									<button type="button" title="#f175a8"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f175a8"
										style="background-color: rgb(241, 117, 168);"></button>
									<button type="button" title="#f12f22"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f12f22"
										style="background-color: rgb(241, 47, 34);"></button>
									<button type="button" title="#ff9c23"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#ff9c23"
										style="background-color: rgb(255, 156, 35);"></button>
									<button type="button" title="#f4d400"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f4d400"
										style="background-color: rgb(244, 212, 0);"></button>
									<button type="button" title="#7bb423"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#7bb423"
										style="background-color: rgb(123, 180, 35);"></button>
									<button type="button" title="#00a350"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00a350" style="background-color: rgb(0, 163, 80);"></button>
									<button type="button" title="#009991"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#009991"
										style="background-color: rgb(0, 153, 145);"></button>
									<button type="button" title="#00afef"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00afef"
										style="background-color: rgb(0, 175, 239);"></button>
									<button type="button" title="#0076c8"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#0076c8"
										style="background-color: rgb(0, 118, 200);"></button>
									<button type="button" title="#93338f"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#93338f"
										style="background-color: rgb(147, 51, 143);"></button>
									<button type="button" title="#f02c8c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#f02c8c"
										style="background-color: rgb(240, 44, 140);"></button>
									<button type="button" title="#9f190d"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#9f190d"
										style="background-color: rgb(159, 25, 13);"></button>
									<button type="button" title="#a46206"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#a46206" style="background-color: rgb(164, 98, 6);"></button>
									<button type="button" title="#a79a00"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#a79a00"
										style="background-color: rgb(167, 154, 0);"></button>
									<button type="button" title="#568228"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#568228"
										style="background-color: rgb(86, 130, 40);"></button>
									<button type="button" title="#007036"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#007036" style="background-color: rgb(0, 112, 54);"></button>
									<button type="button" title="#00726a"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00726a"
										style="background-color: rgb(0, 114, 106);"></button>
									<button type="button" title="#0077a4"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#0077a4"
										style="background-color: rgb(0, 119, 164);"></button>
									<button type="button" title="#004c80"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#004c80" style="background-color: rgb(0, 76, 128);"></button>
									<button type="button" title="#63155f"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#63155f" style="background-color: rgb(99, 21, 95);"></button>
									<button type="button" title="#a01a5c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#a01a5c"
										style="background-color: rgb(160, 26, 92);"></button>
									<button type="button" title="#5f0e06"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#5f0e06" style="background-color: rgb(95, 14, 6);"></button>
									<button type="button" title="#734300"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#734300" style="background-color: rgb(115, 67, 0);"></button>
									<button type="button" title="#675f00"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#675f00" style="background-color: rgb(103, 95, 0);"></button>
									<button type="button" title="#3a5919"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#3a5919" style="background-color: rgb(58, 89, 25);"></button>
									<button type="button" title="#004b24"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#004b24" style="background-color: rgb(0, 75, 36);"></button>
									<button type="button" title="#00524c"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00524c" style="background-color: rgb(0, 82, 76);"></button>
									<button type="button" title="#004c69"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#004c69" style="background-color: rgb(0, 76, 105);"></button>
									<button type="button" title="#00385f"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#00385f" style="background-color: rgb(0, 56, 95);"></button>
									<button type="button" title="#430d40"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#430d40" style="background-color: rgb(67, 13, 64);"></button>
									<button type="button" title="#701441"
										class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
										data-item="#701441"
										style="background-color: rgb(112, 20, 65);"></button>
								</div>
							</div>
							<div class="npe_color_select_input">
								<span class="npe_color_select_preview"
									style="background-color: #f7f7f7"></span> <span
									class="npe_color_select_code"> <span
									class="npe_color_select_code_prefix">#</span> <input
									type="text" class="npe_color_select_code_input" maxlength="6"
									style="text-transform: uppercase; ime-mode: disabled;">
								</span>
								<div class="npe_color_select_opacity_area">
									<span
										class="npe_color_select_opacity_title _txt_signature_opacity-text">투명도</span>
									<div class="npe_color_select_opacity_slide npe_slide_area">
										<input type="range" step="1" class="npe_slide on">
										<div class="npe_slide_appear">
											<div class="npe_slide_background_track_back"></div>
											<div class="npe_slide_background_track"></div>
											<div class="npe_slide_background_thumb"></div>
										</div>
									</div>
									<input type="text" class="npe_color_select_opacity_num"
										maxlength="3" size="3"> <span
										class="npe_color_select_opacity_num_control">
										<button type="button" class="npe_num_up"></button>
										<button type="button" class="npe_num_down"></button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="npe_control_detail npe_control_sticker"
				data-control="sticker">
				<strong class="npe_blind">스티커</strong>
				<div class="npe_sticker_area">
					<div class="npe_sticker_list _stickerPacks _stickerPacks-list">
						<script type="text/tw-template"></script>
						<div class="npe_sticker_item _grafolioMarketBtnWrap">
							<button type="button"
								class="npe_btn_detail_sticker _grafolioMarketBtn">
								<i class="npe_icon_plus"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="npe_control_detail npe_control_mask _masks _masks-list"
				data-control="clip">
				<strong class="npe_blind">마스크</strong>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mask no_apply _mask_btn"
					data-code="-1">
					<span class="npe_btn_title"><span
						class="_txt_none_apply-text">적용 안함</span></span>
				</button>
				<span class="npe_detail_bar"></span>
				<script type="text/tw-template"></script>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mask _mask_btn _code-data _className-addClass _item _new oval"
					data-code="0">
					<span class="npe_btn_title"><span
						class="_i18n-addI18nTextClass _txt_mask_oval-text">원</span></span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mask _mask_btn _code-data _className-addClass _item _new triangle"
					data-code="1">
					<span class="npe_btn_title"><span
						class="_i18n-addI18nTextClass _txt_mask_triangle-text">삼각</span></span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mask _mask_btn _code-data _className-addClass _item _new round_square"
					data-code="2">
					<span class="npe_btn_title"><span
						class="_i18n-addI18nTextClass _txt_mask_round_square-text">둥근사각</span></span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mask _mask_btn _code-data _className-addClass _item _new polygon"
					data-code="3">
					<span class="npe_btn_title"><span
						class="_i18n-addI18nTextClass _txt_mask_polygon-text">다각</span></span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mask _mask_btn _code-data _className-addClass _item _new star1"
					data-code="4">
					<span class="npe_btn_title"><span
						class="_i18n-addI18nTextClass _txt_mask_star1-text">별1</span></span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mask _mask_btn _code-data _className-addClass _item _new star2"
					data-code="5">
					<span class="npe_btn_title"><span
						class="_i18n-addI18nTextClass _txt_mask_star2-text">별2</span></span>
				</button>
				<button type="button"
					class="npe_btn_icon npe_btn_detail_mask _mask_btn _code-data _className-addClass _item _new round_star"
					data-code="6">
					<span class="npe_btn_title"><span
						class="_i18n-addI18nTextClass _txt_mask_round_star-text">둥근별</span></span>
				</button>
				<span class="npe_detail_bar"></span> <span role="button"
					class="npe_btn_icon npe_btn_detail_mask _mask_outline_btn outline">
					<span class="npe_btn_title"><span class="_txt_outline-text">테두리</span></span>
					<div class="npe_color_select_area">
						<div class="npe_color_select_border_area">
							<span class="npe_color_select_border_title">두께</span>
							<div class="npe_color_select_border_slide npe_slide_area">
								<input type="range" step="1" class="npe_slide on" min="0"
									max="30">
								<div class="npe_slide_appear">
									<div class="npe_slide_background_track_back"></div>
									<div class="npe_slide_background_track"
										style="left: 50%; width: 50%;"></div>
									<div class="npe_slide_background_thumb" style="left: 100%;"></div>
								</div>
							</div>
							<input type="text" class="npe_color_select_opacity_num"
								maxlength="3" size="3"> <span
								class="npe_color_select_opacity_num_control">
								<button class="npe_num_up"></button>
								<button class="npe_num_down"></button>
							</span>
						</div>
						<div class="npe_color_select_recent">
							<div
								class="npe_color_select_list _recentColors _recentColors-list"
								id="">
								<script type="text/tw-template"></script>
							</div>
						</div>
						<div class="npe_color_select_table">
							<div class="npe_color_select_list _colors _colors-list" id="">
								<script type="text/tw-template"></script>
								<button type="button" title="#ffffff"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#ffffff"
									style="background-color: rgb(255, 255, 255);"></button>
								<button type="button" title="#f7f7f7"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#f7f7f7"
									style="background-color: rgb(247, 247, 247);"></button>
								<button type="button" title="#e2e2e2"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#e2e2e2"
									style="background-color: rgb(226, 226, 226);"></button>
								<button type="button" title="#c2c2c2"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#c2c2c2"
									style="background-color: rgb(194, 194, 194);"></button>
								<button type="button" title="#9c9c9c"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#9c9c9c"
									style="background-color: rgb(156, 156, 156);"></button>
								<button type="button" title="#858585"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#858585"
									style="background-color: rgb(133, 133, 133);"></button>
								<button type="button" title="#636363"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#636363" style="background-color: rgb(99, 99, 99);"></button>
								<button type="button" title="#404040"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#404040" style="background-color: rgb(64, 64, 64);"></button>
								<button type="button" title="#272727"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#272727" style="background-color: rgb(39, 39, 39);"></button>
								<button type="button" title="#000000"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#000000" style="background-color: rgb(0, 0, 0);"></button>
								<button type="button" title="#ffb39b"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#ffb39b"
									style="background-color: rgb(255, 179, 155);"></button>
								<button type="button" title="#ffd4a7"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#ffd4a7"
									style="background-color: rgb(255, 212, 167);"></button>
								<button type="button" title="#fff599"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#fff599"
									style="background-color: rgb(255, 245, 153);"></button>
								<button type="button" title="#c5dd9c"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#c5dd9c"
									style="background-color: rgb(197, 221, 156);"></button>
								<button type="button" title="#7ec89d"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#7ec89d"
									style="background-color: rgb(126, 200, 157);"></button>
								<button type="button" title="#78ccc9"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#78ccc9"
									style="background-color: rgb(120, 204, 201);"></button>
								<button type="button" title="#85ddff"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#85ddff"
									style="background-color: rgb(133, 221, 255);"></button>
								<button type="button" title="#87c5ff"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#87c5ff"
									style="background-color: rgb(135, 197, 255);"></button>
								<button type="button" title="#bd8fbf"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#bd8fbf"
									style="background-color: rgb(189, 143, 191);"></button>
								<button type="button" title="#f69fc1"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#f69fc1"
									style="background-color: rgb(246, 159, 193);"></button>
								<button type="button" title="#f3704c"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#f3704c"
									style="background-color: rgb(243, 112, 76);"></button>
								<button type="button" title="#fcaf59"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#fcaf59"
									style="background-color: rgb(252, 175, 89);"></button>
								<button type="button" title="#ffef4c"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#ffef4c"
									style="background-color: rgb(255, 239, 76);"></button>
								<button type="button" title="#abd072"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#abd072"
									style="background-color: rgb(171, 208, 114);"></button>
								<button type="button" title="#30b478"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#30b478"
									style="background-color: rgb(48, 180, 120);"></button>
								<button type="button" title="#00bab4"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#00bab4" style="background-color: rgb(0, 186, 180);"></button>
								<button type="button" title="#00c8ff"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#00c8ff" style="background-color: rgb(0, 200, 255);"></button>
								<button type="button" title="#0092e6"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#0092e6" style="background-color: rgb(0, 146, 230);"></button>
								<button type="button" title="#a868a9"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#a868a9"
									style="background-color: rgb(168, 104, 169);"></button>
								<button type="button" title="#f175a8"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#f175a8"
									style="background-color: rgb(241, 117, 168);"></button>
								<button type="button" title="#f12f22"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#f12f22" style="background-color: rgb(241, 47, 34);"></button>
								<button type="button" title="#ff9c23"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#ff9c23"
									style="background-color: rgb(255, 156, 35);"></button>
								<button type="button" title="#f4d400"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#f4d400" style="background-color: rgb(244, 212, 0);"></button>
								<button type="button" title="#7bb423"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#7bb423"
									style="background-color: rgb(123, 180, 35);"></button>
								<button type="button" title="#00a350"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#00a350" style="background-color: rgb(0, 163, 80);"></button>
								<button type="button" title="#009991"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#009991" style="background-color: rgb(0, 153, 145);"></button>
								<button type="button" title="#00afef"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#00afef" style="background-color: rgb(0, 175, 239);"></button>
								<button type="button" title="#0076c8"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#0076c8" style="background-color: rgb(0, 118, 200);"></button>
								<button type="button" title="#93338f"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#93338f"
									style="background-color: rgb(147, 51, 143);"></button>
								<button type="button" title="#f02c8c"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#f02c8c"
									style="background-color: rgb(240, 44, 140);"></button>
								<button type="button" title="#9f190d"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#9f190d" style="background-color: rgb(159, 25, 13);"></button>
								<button type="button" title="#a46206"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#a46206" style="background-color: rgb(164, 98, 6);"></button>
								<button type="button" title="#a79a00"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#a79a00" style="background-color: rgb(167, 154, 0);"></button>
								<button type="button" title="#568228"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#568228" style="background-color: rgb(86, 130, 40);"></button>
								<button type="button" title="#007036"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#007036" style="background-color: rgb(0, 112, 54);"></button>
								<button type="button" title="#00726a"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#00726a" style="background-color: rgb(0, 114, 106);"></button>
								<button type="button" title="#0077a4"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#0077a4" style="background-color: rgb(0, 119, 164);"></button>
								<button type="button" title="#004c80"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#004c80" style="background-color: rgb(0, 76, 128);"></button>
								<button type="button" title="#63155f"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#63155f" style="background-color: rgb(99, 21, 95);"></button>
								<button type="button" title="#a01a5c"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#a01a5c" style="background-color: rgb(160, 26, 92);"></button>
								<button type="button" title="#5f0e06"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#5f0e06" style="background-color: rgb(95, 14, 6);"></button>
								<button type="button" title="#734300"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#734300" style="background-color: rgb(115, 67, 0);"></button>
								<button type="button" title="#675f00"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#675f00" style="background-color: rgb(103, 95, 0);"></button>
								<button type="button" title="#3a5919"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#3a5919" style="background-color: rgb(58, 89, 25);"></button>
								<button type="button" title="#004b24"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#004b24" style="background-color: rgb(0, 75, 36);"></button>
								<button type="button" title="#00524c"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#00524c" style="background-color: rgb(0, 82, 76);"></button>
								<button type="button" title="#004c69"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#004c69" style="background-color: rgb(0, 76, 105);"></button>
								<button type="button" title="#00385f"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#00385f" style="background-color: rgb(0, 56, 95);"></button>
								<button type="button" title="#430d40"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#430d40" style="background-color: rgb(67, 13, 64);"></button>
								<button type="button" title="#701441"
									class="npe_color_select_item _item-attr _item-data _item-backgroundColor _item _new"
									data-item="#701441" style="background-color: rgb(112, 20, 65);"></button>
							</div>
						</div>
						<div class="npe_color_select_input">
							<span class="npe_color_select_preview"
								style="background-color: #f7f7f7"></span> <span
								class="npe_color_select_code"> <span
								class="npe_color_select_code_prefix">#</span> <input type="text"
								class="npe_color_select_code_input" maxlength="6"
								style="text-transform: uppercase; ime-mode: disabled;">
							</span>
							<div class="npe_color_select_opacity_area">
								<span
									class="npe_color_select_opacity_title _txt_signature_opacity-text">투명도</span>
								<div class="npe_color_select_opacity_slide npe_slide_area">
									<input type="range" step="1" class="npe_slide on">
									<div class="npe_slide_appear">
										<div class="npe_slide_background_track_back"></div>
										<div class="npe_slide_background_track"></div>
										<div class="npe_slide_background_thumb"></div>
									</div>
								</div>
								<input type="text" class="npe_color_select_opacity_num"
									maxlength="3" size="3"> <span
									class="npe_color_select_opacity_num_control">
									<button class="npe_num_up"></button>
									<button class="npe_num_down"></button>
								</span>
							</div>
						</div>
					</div>
				</span> <span class="npe_detail_bar"></span>
				<button type="button" class="npe_btn_icon npe_btn_confirm">
					<span class="npe_btn_title _txt_confirm-text">확인</span>
				</button>
			</div>
		</div>
	</section>
	<footer class="npe_image_list_wrap">
		<div class="npe_image_list_area">
			<div class="npe_image_list_header">
				<div class="npe_image_list_header_title">
					<span class="list_title _txt_image_list-text">이미지 목록</span><span
						class="list_num _total-show" style="display: none"><em
						class="now_num _now-text">6</em><span class="total_num"> /
							<em class="_total-text">14</em>
					</span></span>
					<div class="npe_image_list_header_btn_area">
						<span class="npe_image_list_header_bar"></span> <span
							class="list_open_close list_open on"><em
							class="list_open_close_title _txt_open-text">열기</em></span> <span
							class="list_open_close list_close"><em
							class="list_open_close_title _txt_close-text">닫기</em></span>
					</div>
				</div>
			</div>
			<div class="npe_image_list_header npe_select_header">
				<div class="npe_image_list_header_title">
					<button type="button" class="npe_btn_select_all" title="전체 선택"></button>
					<span class="list_title">적용할 사진을 선택하세요.</span> <span
						class="list_num"><em class="now_num">6</em>장 선택함</span>
					<div class="npe_image_list_header_btn_area">
						<button type="button" class="npe_btn_image_select npe_btn_cancel">
							<span class="npe_btn_title">취소</span>
						</button>
						<button type="button" class="npe_btn_image_select npe_btn_submit">
							<span class="npe_btn_title">적용</span>
						</button>
					</div>
				</div>
			</div>
			<div class="npe_image_list_header npe_order_header">
				<div class="npe_image_list_header_title">
					<span class="list_title">사진을 끌어서 순서를 바꿔 보세요. 문서에 첨부된 사진 순서도
						함께 바뀝니다.</span> <span class="list_num"><em class="now_num">6</em>장
						선택함</span>
					<div class="npe_image_list_header_btn_area">
						<button type="button" class="npe_btn_image_select npe_btn_cancel">
							<span class="npe_btn_title">취소</span>
						</button>
						<button type="button" class="npe_btn_image_select npe_btn_submit">
							<span class="npe_btn_title">순서 편집 완료</span>
						</button>
					</div>
				</div>
			</div>
			<div class="npe_image_list_content" style="max-height: 960px;">
				<button type="button"
					class="npe_image_list_arrow npe_image_list_prev disable">
					<span class="npe_blind">이전</span>
				</button>
				<ul class="npe_image_list _list _list-list j-selectable">
					<script type="text/tw-template"></script>
				</ul>
				<button type="button"
					class="npe_image_list_arrow npe_image_list_next disable">
					<span class="npe_blind">다음</span>
				</button>
			</div>
			<div class="npe_image_list_tooltip _txt_editor_sort_tooltip-html">끌어서
				이미지 순서를 변경할 수 있어요.</div>
		</div>
	</footer>
	<div class="npe_canvas_loading" style="margin-bottom: 50px;"></div>
</div>
<div class="npe_alert_wrap">
	<div class="npe_alert">
		<strong class="npe_alert_title _txt_alert_error-text"
			style="display: none;"> 앗, 에러가 발생했습니다! </strong> <strong
			class="npe_alert_title_small" style="display: inline;">JPG,
			GIF, PNG, BMP, HEIF 이미지 파일을 올릴 수 있습니다.<br>한 장당 10MB, 1회 50MB까지
			올리기 가능합니다.
		</strong>
		<p class="npe_alert_description" style="display: none;">다시 한 번 시도해
			주시겠어요?</p>
		<p class="npe_alert_description_long" style="display: block;">
			저작권자 등 원 권리자의 허락을 받지 않은 이미지의 수정 및 저작권 등<br>다른 사람의 권리 침해, 명예를
			훼손하는 이미지는 <br>
			<em class="highlight">이용약관 및 관련 법률에 의해 제재를 받으실 수 있습니다.</em>
		</p>
		<div class="npe_alert_uploading_area" style="display: none;">
			<div class="npe_alert_uploading_total">
				<div class="npe_alert_progress_bar_wrap">
					<div class="npe_alert_progress_bar _totalPercent-widthPercent"></div>
				</div>
				<span class="npe_alert_text">전체</span> <span
					class="npe_alert_num_area"> <em
					class="npe_alert_num _uploadCnt-text">0</em>/<em
					class="npe_alert_num_total _listCnt-text">0</em>장
				</span>
			</div>
			<div class="npe_alert_uploading_part">
				<div class="npe_alert_progress_bar_wrap">
					<div class="npe_alert_progress_bar"></div>
				</div>
				<span class="npe_alert_text _currentFileName-text">IMG_8333.JPG</span>
				<span class="npe_alert_num_perent"><span
					class="_percent-text"></span>%</span>
			</div>
			<div class="npe_alert_uploading_error _errorResultMessage-show">
				<i class="npe_icon_info"></i><span
					class="npe_alert_text _errorResultMessage-text">전체 50장 중
					10장을 추가하지 못했습니다.</span>
				<button type="button"
					class="npe_btn_alert_toggle close _errorLogs-show">
					<span class="npe_btn_alert_title _btnTxt-text">닫기</span>
				</button>
				<div class="npe_alert_detail_area _errorLogs-show">
					<ul class="npe_alert_detail_list _errorLogs _errorLogs-list">
						<li class="npe_alert_detail_item _template"><span
							class="npe_alert_detail_filename _fileName-text">IMG_파일명글자수여기까지..</span>
							<span class="npe_alert_detail_fileext _fileExt-text">JPG</span> <span
							class="npe_alert_detail_text _message-text">최대 500MB까지 사진을
								추가할 수 있습니다.</span></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="npe_alert_btn_area" style="display: none;">
			<button type="button" class="npe_btn npe_alert_btn_cancel"
				style="display: none;">
				<em class="npe_btn_title _txt_alert_cancel-text">취소</em>
			</button>
			<button type="button" class="npe_btn npe_alert_btn_ok"
				style="display: none;">
				<em class="npe_btn_title _txt_alert_ok-text">확인</em>
			</button>
		</div>
		<div class="npe_alert_sns_area" style="display: none;">
			<button type="button" class="npe_btn_sns npe_btn_facebook"
				data-sns="facebook">
				<div class="npe_btn_sns_img"></div>
				<span class="npe_btn_sns_title">페이스북</span>
			</button>
			<button type="button" class="npe_btn_sns npe_btn_pholar"
				data-sns="pholar">
				<div class="npe_btn_sns_img"></div>
				<span class="npe_btn_sns_title">폴라</span>
			</button>
			<button type="button" class="npe_btn_sns npe_btn_instagram"
				data-sns="instagram">
				<div class="npe_btn_sns_img"></div>
				<span class="npe_btn_sns_title">인스타그램</span>
			</button>
		</div>
		<div class="npe_alert_save_area" style="display: none;">
			<button type="button" class="npe_btn_save npe_btn_mycomputer">
				<div class="npe_btn_save_img"></div>
				<span class="npe_btn_save_title">내 컴퓨터</span>
			</button>
			<button type="button" class="npe_btn_save npe_btn_cloud">
				<div class="npe_btn_save_img"></div>
				<span class="npe_btn_save_title">네이버 클라우드</span>
			</button>
		</div>
		<button type="button" class="npe_alert_btn_close"
			style="display: block;"></button>
		<label class="npe_alert_btn_hide" style="display: block;"> <input
			type="checkbox" class="npe_alert_hide_check npe_blind"> <i
			class="npe_check_icon"></i> <span class="npe_btn_title">다시 보지
				않기</span>
		</label>
	</div>
</div>
<!-- [ Photoeditor Template : Start ] -->
<div class="npu_wrap on">
	<header class="npu_header">
		<div class="npu_header_attach_area">
			<input class="npe_pc_image_file npe_blind" id="pc_image_file"
				type="file" accept=".jpg, .jpeg, .gif, .png, .bmp, .heif, .heic"
				multiple="multiple"> <label
				class="npu_btn_icon npu_btn_mypc" for="pc_image_file"
				aria-role="button"> <span class="npu_btn_title">내 PC</span>
			</label>
			<button type="button" class="npu_btn_icon npu_btn_cloud">
				<span class="npu_btn_title">클라우드</span> <i
					class="npu_icon_new _newCnt-show" style="display: none"></i>
			</button>
			<button type="button" class="npu_btn_icon npu_btn_sns">
				<span class="npu_btn_title">SNS</span> <i
					class="npu_icon_new _newCnt-show" style="display: none"></i>
			</button>
			<button type="button" class="npu_btn npu_btn_prev_version"
				style="display: none">
				<span class="npu_btn_title">이전 버전으로 올리기</span>
			</button>
		</div>
		<div class="npu_header_btn_area">
			<input type="checkbox" class="npu_photo_gap_check npe_blind"
				id="photo_gap" checked=""> <label for="photo_gap"
				class="npu_btn_photo_gap"> <i class="npu_check_icon"></i> <span
				class="npu_btn_title">사진간격 띄우기</span>
			</label>
			<button type="button" class="npu_btn npu_btn_submit">
				<span class="npu_btn_title">올리기</span>
			</button>
		</div>
	</header>
	<section class="npu_image_list_wrap multi edit_order">
		<div class="npu_image_list_header" style="display: none">
			<div class="npu_image_list_title">
				<button type="button" class="npu_btn npu_btn_check_all disable"
					title="전체선택" disabled=""></button>
				<strong class="npu_image_list_text">이미지 목록</strong> <span
					class="npu_image_list_num"><em class="npu_now_num _now-text">0</em>/<em
					class="npu_max_num _total-text">100</em>장</span> <span
					class="npu_image_list_size">( <em
					class="npu_now_num _now-text">0</em>MB / <em
					class="npu_max_num _total-text">50</em>MB )
				</span>
			</div>
			<div class="npu_image_list_btn_area">
				<div class="npu_size_select">
					<i class="npu_icon_size"></i> <span class="npu_size_text">740px</span>
					<i class="npu_icon_arrow"></i>
					<ul class="npu_size_list _resizePreset _resizePreset-list" id="">
						<script type="text/tw-template"></script>
						<li class="npu_size_item _item-replace _item-attr _item _new"
							data-resize="320"><span
							class="npu_size_item_text _item-replace">320px</span></li>
						<li class="npu_size_item _item-replace _item-attr _item _new"
							data-resize="400"><span
							class="npu_size_item_text _item-replace">400px</span></li>
						<li class="npu_size_item _item-replace _item-attr _item _new"
							data-resize="480"><span
							class="npu_size_item_text _item-replace">480px</span></li>
						<li class="npu_size_item _item-replace _item-attr _item _new"
							data-resize="550"><span
							class="npu_size_item_text _item-replace">550px</span></li>
						<li class="npu_size_item _item-replace _item-attr _item _new"
							data-resize="650"><span
							class="npu_size_item_text _item-replace">650px</span></li>
						<li class="npu_size_item _item-replace _item-attr _item _new"
							data-resize="740"><span
							class="npu_size_item_text _item-replace">740px</span></li>
						<li class="npu_size_item _item-replace _item-attr _item _new"
							data-resize="960"><span
							class="npu_size_item_text _item-replace">960px</span></li>
						<li class="npu_size_item _item-replace _item-attr _item _new"
							data-resize="1080"><span
							class="npu_size_item_text _item-replace">1080px</span></li>
						<li class="npu_size_item" data-resize="original"><span
							class="npu_size_item_text">원본크기</span></li>
						<li class="npu_size_item npu_size_direct _useResizeCustom-keep"
							data-resize="custom">
							<div class="npu_size_direct_input_wrap">
								<input type="text"
									class="npu_size_direct_input _txt_direct-attr _txt_direct-val"
									maxlength="5" data-placeholder="직접입력">
								<button type="button" class="npu_size_direct_input_confirm"></button>
							</div>
						</li>
					</ul>
				</div>
				<button type="button" class="npu_btn_icon npu_btn_rotation disable"
					title="회전" disabled=""></button>
				<button type="button" class="npu_btn_icon npu_btn_inverse disable"
					title="역순으로" disabled=""></button>
				<button type="button" class="npu_btn_icon npu_btn_edit disable"
					title="편집하기" disabled=""></button>
				<button type="button" class="npu_btn_icon npu_btn_delall disable"
					title="삭제" disabled=""></button>
			</div>
		</div>
		<div class="npu_image_list_area">
			<ul class="npu_image_list _list _list-list npu_cols_6 j-selectable">
				<script type="text/tw-template"></script>
				<script class="npu_image_blank_template" type="text/template">
<li class="npu_image_item _npu_image_item_blank">
<div class="npu_image_list_thumb_wrap">
</div>
</li>
</script>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>

				<li class="npu_image_item _npu_image_item_blank">
					<div class="npu_image_list_thumb_wrap"></div>
				</li>
			</ul>
			<div class="npu_image_list_tooltip _txt_uploader_sort_tooltip-html">
				끌어서 이미지 순서를 변경할 수 있어요.<br>더블클릭하면 이미지를 편집할 수 있어요.
			</div>
		</div>
		<div class="npu_image_upload_area on">
			<div class="npu_image_upload">
				<i class="npu_icon_image_upload  npu_is_multi"> <span
					class="back_square"></span> <span class="front_square"></span>
				</i> <strong class="npu_image_upload_title _txt_upload_title-text">더욱
					빠르게 사진 올리기</strong>
				<p class="npu_image_upload_description">원하는 이미지를 이곳에 끌어다 놓으면 바로
					사진을 올릴 수 있어요.</p>
			</div>
		</div>
	</section>
	<div class="npu_image_size_area" style="display: none;">
		<button type="button" class="npu_btn npu_btn_image_size_up"></button>
		<button type="button" class="npu_btn npu_btn_image_size_down"></button>
	</div>
	<div class="npu_notice_toast">
		<span class="npu_notice_toast_text">토스트 메시지</span>
	</div>
</div>

<div style="display: none;"></div>
<div style="display: none;"></div>



<!--  -->
<script>
	var maxFileCount = "100";

	window.NPHOTO_MINI = {
		open : function() {
			this.win = window
					.open(
							location.protocol + "//"
									+ "photo.cloud.naver.com/v2/mini"
									+ "?mediaType=I&maxCount=100",
							"NPHOTO_MINI",
							(function() {
								var w = Math.min(870, screen.width), h = Math
										.min(610, screen.height);
								return "menubar=0,toolbar=0,location=0,status=0,scrollbars=1,resizable=1,"
										+ "width=" + w + ",height=" + h;
							}()));
		},

		onInitialized : function() {
		},

		onSubmit : function(items) {
			items = items && JSON.parse(items);

			var npe = typeof (PhotoEditorApp) !== 'undefined'
					&& PhotoEditorApp.instance;
			if (npe && npe.opened) {
				npe.addPhotosByUrlsEncoded(items);
				NPHOTO_MINI.close();
			}
		},

		close : function() {
			if (this.win) {
				this.win.close();
			}
		}
	};

	var windowResizeTo = (function() {
		function _getOuterWidth() {
			return window.outerWidth || document.documentElement.clientWidth
					|| 0;
		}

		function _getOuterHeight() {
			return window.outerHeight || document.documentElement.clientHeight
					|| 0;
		}

		function _getInnerWidth() {
			return window.innerWidth || document.documentElement.clientWidth
					|| 0;
		}

		function _getInnerHeight() {
			return window.innerHeight || document.documentElement.clientHeight
					|| 0;
		}

		return function(contentWidth, contentHeight) {
			var prevOuterWidth = _getOuterWidth();
			var prevOuterHeight = _getOuterHeight();
			var resizeWidth = contentWidth
					+ (prevOuterWidth - _getInnerWidth());
			var resizeHeight = contentHeight
					+ (prevOuterHeight - _getInnerHeight());
			var outerWidth, outerHeight, moveX, moveY;

			window.resizeTo(resizeWidth, resizeHeight);

			outerWidth = _getOuterWidth();
			outerHeight = _getOuterHeight();

			if (prevOuterWidth !== outerWidth
					|| prevOuterHeight !== outerHeight) {
				if (resizeWidth > outerWidth || resizeHeight > outerHeight) {
					moveX = Math.max(outerWidth - resizeWidth, -window.screenX);
					moveY = Math.max(outerHeight - resizeHeight,
							-window.screenY);

					window.moveBy(moveX, moveY);
					window.resizeTo(resizeWidth, resizeHeight);
				}
			}
		}
	})();

	if (checkHTML5Support()) {
		windowResizeTo(1280, 960);

		// 포토에디터 객체 생성
		var npe = getPhotoEditorInstance();

		var isWin98 = $Agent().os().win
				&& ($Agent().os().getName().indexOf("98") > -1);
		var requireVersion = isWin98 ? "9.0.0.0" : "10.0.0.0";

		var optionVars = 'serviceName=cafe2&maxTotalSize=52428800&imageWidthList=320|400|480|550|650|740|960|1080&maxFileSize=10485760&maxFileCount=100&serverTimeOut=300&retryCount=3&noticeImgURL=&selectedTab=Base&tabList=Base|Edit|Story&addType=Local|NPhoto&usePosition=true&useGap=true&version=&interfaceVersion=1.0&allowedImageTypes=jpg|gif|png|bmp|heif&allowedImageExtensions=jpg|jpeg|gif|png|bmp|heif|heic&autoClose=false&snsPhotoEnabled=true&useSingleImageFitScreen=true&bottomBannerExposureEnable=true&checkHarmEnabled=true&userId=lumber4&sessionKey=MjAxOTA0MjYxNjI4MDQHMTU1NjI2NDYwNTMyNwdjYWZlMgdsdW1iZXI0BzAHMgdlMGVkOWRjMjM2YzQwMjYzMTZiYThjOGZmMGM4Mzg4Mw&publishDomain=&storyPhoto=&defaultWidth=960&editImageIndexes=&nPhotoDomain=photo.cloud.naver.com&ndriveOldSaveApi=http://cloud.naver.com/downloadfile.nhn&ndriveSaveApi=https://cloud.naver.com/saveFile.nhn&pin=&encToken=&useEditFlag=false&encodedCustomQuery=&customKey=&customKeyVersion=0&popupUploaderStickerType=all&grafolioApiDomain=apis.naver.com&grafolioBaseDomain=ssl.phinf.net/gfmarket&grafolioMarketUrl=http://m.gfmarket.naver.com/sticker/home&currentMaxFileCount='
				+ '&filterPath=/html5/img/'
				+ '&baseDomain=http://'
				+ baseDomain
				+ '&ndriveNewCnt=0'
				+ '&signatureDefaultText='
				+ decodeURIComponent('')
				+ '&flashSupport='
				+ nhn.FlashObject.isFlashSupportable(requireVersion);
		npe.init(optionVars);
		npe.open();
	}
</script>
