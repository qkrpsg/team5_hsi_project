<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
    
<!-- 여기서부터 사용자 관리 페이지 시작 -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        사용자 관리
        <small>13 명의 새로운 사용자</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 홈</a></li>
        <li class="active">사용자 관리</li>
      </ol>
    </section>
<!-- 프로필사진+목록 통합 시작 -->
    <!-- Main content -->
    <section class="content">
      <div class="row">
      
      <!-- 사용자 목록 통합 시작 -->
        <div class="col-md-9">
          <div class="box box-primary">
          
          	<!-- 목록 헤더 시작 -->
            <div class="box-header with-border">
              <h3 class="box-title">사용자 목록</h3>
              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="Search User">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <!-- 목록 헤더 끝-->
            
            <!-- 목록 바디 시작 -->
            <div class="box-body no-padding">
              <!-- 목록 버튼 시작 -->
              <div class="userbox-controls">
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-ban"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                <div class="pull-right">
                  1-50/200
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.pull-right -->
              </div>
              <!-- 목록 버튼 끝 -->
              
              <!-- 목록데이터 : 사용자 아이디 입력 부분 -->
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td class=""><a href="#"><i class="fa fa-ban text-red"></i></a></td>
                    <td class=""><a href="read-mail.html">로그인계정(user_id)</a></td>
                    <td class=""><b>별명(user_nickname)</b>
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="">최종로그인(last_login)</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td class=""><a href="#"><i class="fa-circle-o text-yellow"></i></a></td>
                    <td class=""><a href="read-mail.html">로그인계정(user_id)</a></td>
                    <td class=""><b>별명(user_nickname)</b>
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="">활동 중...</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox"></td>
                    <td class=""><a href="#"><i class="fa-circle-o text-green"></i></a></td>
                    <td class=""><a href="read-mail.html">로그인계정(user_id)</a></td>
                    <td class=""><b>별명(user_nickname)</b>
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="">2019.03.25</td>
                  </tr>
                  
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.box-body -->
            <!-- 목록 바디 끝 -->
            
            <!-- 목록 풋터 시작 -->
            <div class="box-footer no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-ban"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                <div class="pull-right">
                  1-50/200
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.pull-right -->
              </div>
              <!-- 목록 풋터 끝 -->
            </div>
          </div>
          <!-- /. box -->
        </div>
        
      <!-- 프로필 통합 시작 -->
        <div class="col-md-3">

          <!--프로필 사진 시작 -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="<c:url value='/resources/admin_images/user_icon.png'/>" alt="User profile picture">

              <h3 class="profile-username text-center">로그인계정</h3>

              <p class="text-muted text-center">별명</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>가입일 </b> <a class="pull-right">2018-02-12</a>
                </li>
                <li class="list-group-item">
                  <b>최종 로그인 날짜</b> <a class="pull-right">2019-04-03</a>
                </li>
              </ul>

              <a href="#" class="btn btn-primary btn-block"><b>사용자 페이지로 이동</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          <!--프로필 사진 끝 -->

          <!-- 활동정보 시작 -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">활동 정보</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> 작성</strong>

           
              <ul class="list-group">
              <li class="list-group-item">
                  <b>누적 픽</b> <a class="pull-right">56개</a>
                </li>
                <li class="list-group-item">
                  <b>게시물</b> <a class="pull-right">10개</a>
                </li>
                <li class="list-group-item">
                  <b>구매</b> <a class="pull-right">45개</a>
                </li>
                <li class="list-group-item">
                  <b>댓글</b> <a class="pull-right">52개</a>
                </li>
                <li class="list-group-item">
                  <b>문의</b> <a class="pull-right">2개</a>
                </li>
              </ul>
               
              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> 거주 지역</strong>

              <p class="text-muted">국가,지역</p>

              <hr>

              <strong><i class="fa fa-pencil margin-r-5"></i> 권한</strong>

              <p>
                <span class="label label-danger">차단 계정</span>
                <span class="label label-warning">관리자</span>
                <span class="label label-primary">일반 사용자</span>
              </p>

              <hr>

            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
          <!-- 활동정보 끝 -->
        </div>
        <!-- /.col -->
        <!-- 프로필 통합 끝 -->  
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
    <!-- 프로필사진+목록 통합 끝 -->
  </div>
  <!-- /.content-wrapper -->
  <!-- 여기까지 사용자 관리 페이지 끝 -->